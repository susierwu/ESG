tab_files <- list.files(path = "tabs/ui/environcal", full.names = T)
suppressMessages(lapply(tab_files, source))

environ <- tabPanel(title = "Environmental", 
                    value = "environ",
                    hr(),
                     tabsetPanel(
                       GHG3scope,
                       kpia21energy
                     )
)