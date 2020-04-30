#' Munge bibliometrix dataframe
#'
#' Fixes issues associated with the bibtex data files
#'
#' @param df bibliometrix dataframe
#'
#' @return Fixed dataframe

fix_bdf <- function(df, include.books = FALSE){
    # missing early access year field years
    ead <- strsplit(df[, "early.access.date"], split = " ")
    df[is.na(df[, "PY"]), "PY"] <- do.call(rbind, ead)[is.na(df[, "PY"]), 2]
    ## limit to articles
    if (include.books){
        df <- df[grepl("ARTICLE", df[, "DT"]) | grepl("BOOK", df[, "DT"]), ]
    }else{
        df <- df[grepl("ARTICLE", df[, "DT"]), ]
    }
    ## remove duplicates by title and UID
    df <- df[!(duplicated(df[, "TI"]) | duplicated(df[, "UT"])), ]
    return(df)
}

#' Check data are correct prior to analysis
#'
#' Check data are correct prior to analysis
#'
#' @param df bibliometrix dataframe
#'
#' @return Indicators of errors

check_data <- function(df){
    checks <- data.frame()
    if (any(grepl("BOOK", df[, "DT"]))){
        checks["count", 1] <- nrow(df) == 3512
    }else{
        checks["count", 1] <- nrow(df) == 3383
    }
    checks["years", 1] <- all(!(is.na(df[, "PY"])))
    if (all(checks[, 1])){
        print("Passed all checks.")
    }else{
        warning("The following checks failed:")
        return(rownames(checks)[!checks[, 1]])
    }
}

#' Remove special characters
#' 
#' @param x Character string
#'
#' @return String with special characters removed

rm.spch <- function(x){
    ch <- strsplit(toupper(x), split = "")[[1]]
    ch <- ch[ch %in% c(LETTERS, " ")]
    out <- paste(ch, collapse = "")
    return(out)
}

#' Export a spreadsheet for review
#'
#' Create a spreadsheet for sorting articles by topic
#'
#' @param df Bibliometrix formatted dataframe
#' @param ql Named list of logical query vectors
#' @param dir Name of the directory to create
#'
#' @return NULL

export_query <- function(df = "dataframe", ql = "query list", 
                         dir = "output directory", overwrite = FALSE){
    

    names(ql) <- gsub(" ", "_", names(ql))

    for (i in seq_along(ql)){
        if (sum(ql[[i]]) == 0){
            print(paste(names(ql)[i], "had length zero and was removed."))
        }
    }

    ql <- ql[lapply(ql, sum) != 0]

    out <- list()
    for (i in seq_along(ql)){
        topic <- rep(names(ql)[i], nrow(df[ql[[i]], ]))
        notes <- rep("", nrow(df[ql[[i]], ]))
        auth <- rownames(df[ql[[i]], ])
        out[[i]] <- data.frame(topic, auth, df[ql[[i]], c("UT", "TI", "AB")], notes)
        colnames(out[[i]]) <- c("TOPIC", "AUTHOR",  "UID", "TITLE", "ABSTRACT", "NOTES")
        rownames(out[[i]]) <- seq(1, nrow(out[[i]]))
    }
    names(out) <- names(ql)

    if (!(dir.exists(dir)) | overwrite){
        if (!(dir.exists(dir))){dir.create(dir)}
        for (i in seq_along(out)){
            write.csv(out[[i]], file = paste0(dir, "/", names(out)[i], ".csv"))
        }
        print(paste0(names(out), ".csv"))
        print(paste("Successfully written to", dir))
    }else{
        warning("Directory exists. Remove or set overwrite = TRUE.")
    }
}

#' Build a review based on topic lists
#'
#' Create a document that can be used as a basis using logical queries
#'
#' 

mk_review <- function(df = "bibliographic data frame", ql = "Named query list", file = "Output file path", overwrite = FALSE, verbose = FALSE, sort.by.year = TRUE){

    if (file.exists(file) & overwrite == FALSE){
        warning(paste(file, "exists. Set overwrite = TRUE to overwrite."))
    }else{
        hd  <- c("---", 
                 paste("title:", "REVIEW OF", paste(names(ql), collapse = ", ")),
                 "author: ", "date: ", 
                 "---")
        sc  <- paste("#", names(ql))
        bo <- list()
        for (i in seq_along(ql)){
            refs <- apply(df[ql[[i]], c("TI", "SR", "UT")], 1, paste, collapse = " | ")
            if (sort.by.year){
                refs <- refs[order(df[ql[[i]], "PY"], decreasing = TRUE)]
            }
            bo[[i]] <- c("", 
                         "", 
                         sc[[i]], 
                         "",
                         paste("-", refs)
                             )
        }
        out <- c(hd, unlist(bo))
        file.create(file, showWarnings = FALSE)
        file_conn <- file(file)
        writeLines(out, file_conn)
        close(file_conn)
    }
    if (verbose){return(out)}
}
