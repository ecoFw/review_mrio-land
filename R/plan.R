plan <- drake_plan(
### Load data
    make.refs = mk_refs(),
    io.raw = convert2df("refs.bib", dbsource = "wos", format = "bibtex"),
### Data wrangling
    io.bdf = fix_bdf(io.raw, include.books = FALSE),
    ab.bdf = fix_bdf(io.raw, include.books = TRUE),
### Data checks
    checks = check_data(io.bdf),
    check.books = check_data(ab.bdf),
### Analyses
    q.all = mk_q(io.bdf),
    export_query(io.bdf, q.all, dir = "data/wos-mrio_query")
### Export review spreadsheet
    mk_review(io.bdf, q.all[-1], file = "results/wos_review.md")
### Analytical Checks
### Generate the manuscript
)
