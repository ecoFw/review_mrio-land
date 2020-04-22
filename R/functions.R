#' Munge bibliometrix dataframe
#'
#' Fixes issues associated with the bibtex data files
#'
#' @param df bibliometrix dataframe
#'
#' @return Fixed dataframe

fix_bdf <- function(df){
    # missing early access year fields
    ead <- strsplit(df[, "early.access.date"], split = " ")
    df[is.na(df[, "PY"]), "PY"] <- do.call(rbind, ead)[is.na(df[, "PY"]), 2]
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
    checks["count", 1] <- nrow(df) == 4155
    checks["years", 1] <- all(!(is.na(df[, "PY"])))
    if (all(checks[, 1])){
        print("Passed all checks.")
    }else{
        warning("The following checks failed:")
        return(rownames(checks)[!checks[, 1]])
    }
}
