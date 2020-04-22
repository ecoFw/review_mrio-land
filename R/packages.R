## Check for supporting packages
cran.pkgs <- c("magrittr", "devtools", "beepr", "xtable", 
               "bibliometrix", "drake"
              )
## install packages that are not installed
## CRAN
if (any(!(cran.pkgs %in% installed.packages()[, 1]))){
    sapply(cran.pkgs[which(!(cran.pkgs %in% 
                             installed.packages()[, 1]))], 
           install.packages, 
           dependencies = TRUE, 
           repos = 'http://cran.us.r-project.org')
}
## Load libraries
sapply(c(cran.pkgs), 
       library, quietly = TRUE, character.only = TRUE)
