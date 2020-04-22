plan <- drake_plan(
### Load data
### Data wrangling
### Data checks
### Analyses
### Analytical Checks
### Generate the manuscript
    report = rmarkdown::render(
                            knitr_in("report.Rmd"),
                            output_file = file_out("report.pdf"),
                            quiet = TRUE
                        )
)
