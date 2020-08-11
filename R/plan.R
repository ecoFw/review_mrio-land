plan <- drake_plan(
### Load data
    mk_refs(),
    io.raw = convert2df("refs.bib", dbsource = "wos", format = "bibtex"),
### Data wrangling
    io.bdf = fix_bdf(io.raw, include.books = FALSE),
    ab.bdf = fix_bdf(io.raw, include.books = TRUE),
### Data checks
    checks = check_data(io.bdf),
    check.books = check_data(ab.bdf),
### Analyses
### Export review spreadsheet
    
### Analytical Checks
### Generate the manuscript
    report = rmarkdown::render(
                            knitr_in("report.Rmd"),
                            quiet = FALSE
                        )
)
