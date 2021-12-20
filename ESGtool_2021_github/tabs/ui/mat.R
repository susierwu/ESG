tab_files <- list.files(path = "tabs/ui/stkhsurvey", full.names = T)
suppressMessages(lapply(tab_files, source))

mat <- tabPanel(title = "Materiality",
                     value = "mat",
                     hr(),
                     tabsetPanel(
                       matmatrix
                     )
)