#' Munge bibliometrix dataframe
#'
#' Fixes issues associated with the bibtex data files
#'
#' @param df bibliometrix dataframe
#'
#' @return Fixed dataframe

mk_refs <- function(){
    print(getwd())
    if (!("refs.bib" %in% dir())){
        compile.bib = capture.output(
            system("cat ./data/wos_io/savedrecs* > ./refs.bib"), 
            type = "message")
        system("sed -i.bak '/Early Access Date/d' ./refs.bib")
        if (length(compile.bib) != 0){
            print(compile.bib)
        }
        print("Compiled refs.bib")
    }else{
        print("refs.bib exists")
    }
}

fix_bdf <- function(df, include.books = FALSE){
    # missing early access year field years
    ead <- strsplit(df[, "early.access.date"], split = " ")
    df[is.na(df[, "PY"]), "PY"] <- do.call(rbind, ead)[is.na(df[, "PY"]), 2]
    ## limit to articles
    df <- df[!(grepl("PROCEEDINGS", df[, "DT"])), ]
    if (include.books){
        df <- df[grepl("ARTICLE", df[, "DT"]) | 
                 grepl("BOOK", df[, "DT"]), ]
    }else{
        df <- df[grepl("ARTICLE", df[, "DT"]) & 
                 !(grepl("BOOK", df[, "DT"])), ]
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
        checks["count", 1] <- nrow(df) == 8165
    }else{
        checks["count", 1] <- nrow(df) == 7755
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
                         dir = "output directory", overwrite = TRUE){
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

mk_review <- function(df = "bibliographic data frame", ql = "Named query list", file = "Output file path", overwrite = TRUE, verbose = FALSE, sort.by.year = TRUE){

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
                         paste(sc[[i]], length(refs)),
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

mk_q <- function(io.bdf){
   q.mrio <- grepl("INPUT-OUTPUT", io.bdf[, "DE"]) | 
       grepl("INPUT-OUTPUT", io.bdf[, "TI"]) | 
       grepl("INPUT OUTPUT", io.bdf[, "DE"]) | 
       grepl("INPUT OUTPUT", io.bdf[, "TI"]) 
   q.rev <- grepl("REVIEW", io.bdf[, "DT"]) | 
       grepl("REVIEW", io.bdf[, "DE"]) | 
       grepl("REVIEW", io.bdf[, "TI"]) 
   q.ov <- grepl("OVERVIEW", io.bdf[, "DT"]) |
       grepl("OVERVIEW", io.bdf[, "DE"]) | 
       grepl("OVERVIEW", io.bdf[, "TI"]) 
   q.land <- grepl("^LAND", io.bdf[, "DE"]) | 
       grepl("^LAND", io.bdf[, "TI"]) | 
       grepl(" LAND", io.bdf[, "DE"]) | 
       grepl(" LAND", io.bdf[, "TI"]) 
   q.mrio <- grepl("INPUT-OUTPUT", io.bdf[, "DE"]) | 
       grepl("INPUT-OUTPUT", io.bdf[, "TI"]) | 
       grepl("INPUT OUTPUT", io.bdf[, "DE"]) | 
       grepl("INPUT OUTPUT", io.bdf[, "TI"]) 
   q.for <- grepl("FOREST", io.bdf[, "DE"]) | 
   	      grepl("FOREST", io.bdf[, "TI"]) |
   		 grepl("FOREST", io.bdf[, "AB"])
   q.net <- (grepl("NETWORK ANALYS", io.bdf[, "DE"]) | 
       grepl("NETWORK ANALYS", io.bdf[, "TI"])) & 
   	!(grepl("ECOLOGICAL NETWORK ANALYS", io.bdf[, "DE"]) | 
       grepl("ECOLOGICAL NETWORK ANALYS", io.bdf[, "TI"]))
   q.ena <- grepl("ECOLOGICAL NETWORK ANALYS", io.bdf[, "DE"]) | 
       grepl("ECOLOGICAL NETWORK ANALYS", io.bdf[, "TI"]) &
       !(q.net)
   q.mc <- grepl("^CLIMATE", io.bdf[, "TI"]) | 
       grepl("^CLIMATE", io.bdf[, "DE"]) | 
       grepl(" CLIMATE", io.bdf[, "TI"]) | 
       grepl(" CLIMATE", io.bdf[, "DE"]) 
   q.md <- grepl("^DISTURB", io.bdf[, "TI"]) | 
       grepl("^DISTURB", io.bdf[, "DE"]) | 
       grepl(" DISTURB", io.bdf[, "TI"]) | 
       grepl(" DISTURB", io.bdf[, "DE"]) 
   q.met.land <- q.met & q.land
   q.chns <- grepl("HUMAN-NATURAL", io.bdf[, "TI"]) | 
       grepl("HUMAN-NATURAL", io.bdf[, "DE"]) |
       grepl("HUMAN-NATURAL", io.bdf[, "AB"]) |
       grepl("HUMAN NATURAL", io.bdf[, "TI"]) | 
       grepl("HUMAN NATURAL", io.bdf[, "DE"]) |
       grepl("HUMAN NATURAL", io.bdf[, "AB"]) 
   q.all <- list("IO_MRIO" = q.mrio, 
                 Review = (q.rev | q.ov),
                 Land = (q.land & q.mrio), 
                 Forest = (q.for & q.mrio), 
                 "Forest Network" = (q.for & q.mrio & (q.ena | q.net)), 
                 "Land Metrics" = q.met.land,
                 ENA = q.ena, 
                 Network = q.net,
                 CHNS = q.chns, 
         	      "Climate Change" = (q.mc & q.mrio), 
   			  Resilience = q.res,
   			  Metric = (q.met & q.mrio)
   		  )
   return(q.all)
}


