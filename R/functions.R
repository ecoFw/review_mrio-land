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
        checks["count", 1] <- nrow(df) == 3040
    }else{
        checks["count", 1] <- nrow(df) == 2944
    }
    checks["years", 1] <- all(!(is.na(df[, "PY"])))
    if (all(checks[, 1])){
        print("Passed all checks.")
    }else{
        warning("The following checks failed:")
        return(rownames(checks)[!checks[, 1]])
    }
}
