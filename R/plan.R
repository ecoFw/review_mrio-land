plan <- drake_plan(
### Load data
    compile.bib = capture.output(system("cat data/wos_io/savedrecs* > ./refs.bib"), type = "message"),
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
                            output_file = file_out("report.md"),
                            quiet = TRUE
                        )
)
