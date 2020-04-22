plan <- drake_plan(
### Load data
    io.raw = convert2df("data/wos_io.bib", dbsource = "wos", format = "bibtex"),
### Data wrangling
    io.bdf = fix_bdf(io.raw),
### Data checks
    checks = check_data(io.bdf),
### Analyses
### Analytical Checks
### Generate the manuscript
    report = rmarkdown::render(
                            knitr_in("report.Rmd"),
                            output_file = file_out("report.md"),
                            quiet = TRUE
                        )
)
