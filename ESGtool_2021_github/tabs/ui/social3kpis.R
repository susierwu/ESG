tab_files <- list.files(path = "tabs/ui/socialcal", full.names = T)
suppressMessages(lapply(tab_files, source))

soc <- tabPanel(title = "Social", 
                      value = "social",
                      hr(),
                      tabsetPanel(
                        soclabor,
                        socturnover,
                        socregion,
                        soctrn
                      )
)