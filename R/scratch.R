q.all <- list(q.ml, q.net, q.ena, q.res, q.md, q.mc, q.chns,
              q.met, q.met.land, (q.rev | q.ov))
q.labs <- c("Land", "Network", "ENA", "Resilience", "Disturbance", "Climate Change", 
            "Coupled Human-Natural", "Metrics", "Land Metrics", "Review or Overview")
q.df <- data.frame(topic = q.labs, count = unlist(lapply(q.all, sum)))
knitr::kable(q.df, caption = "Topic table", booktabs = TRUE)
