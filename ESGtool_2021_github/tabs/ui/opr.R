tab_files <- list.files(path = "tabs/ui/operations", full.names = T)
suppressMessages(lapply(tab_files, source))

opr <- tabPanel(title = "Operational",
                     value = "operation",
                     hr(),
                     tabsetPanel(
                       suppliermap
                     )
)