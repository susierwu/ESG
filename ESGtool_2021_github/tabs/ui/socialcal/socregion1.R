socregion <- tabPanel(title = "Empl&Turnover by region", 
                   value = "social_3",
                   br(), hr(),
                   
                   p("If your employees come from equal or over 2 different regions, use this tab to report. Otherwise, please ignore this tab."),

                   p("Please input employment and turnover data by geographical regions (under the region column), using your own definition (e.g., mainland China, Hong kong)."),
                   matrixInput("region",
                               rows = list(names = TRUE,extend = T,editableNames = TRUE),
                               cols = list(names = TRUE,extend = F,editableNames = TRUE),
                               value = matrix(c("Region_1", "Region_2", 20,  20,  4, 3), nrow = 2, ncol = 3, 
                                              dimnames = list(c("1","2"), c("Region", "Employment: #_of_Employees", "Turnover: #_of_employees_left")))),
                   
                   
                   sidebarPanel(
                     # selectInput("G_region", "Select which matrix you have data entry",
                     #             list("a: only 2 regions" = "two_region", "b: >= 3 regions" = "three_region")),
                     selectInput("G_chart", "Choose chart format to present (for Employment data)",
                                 list("Pie charts" = "pie", "Waffle plots" = "waffle")),
                     selectInput("G_color", "Choose color scheme for charts",
                                 list("purple" = "Purples", "orange" = "Oranges", "blue" = "Blues", "green" = "Greens", "grey" = "Greys","set" = "Set3", "pastel" = "Pastel1", "spectral" = "Spectral")),
                     tags$hr(),
                     actionButton("plot_Emp", "Update plot_empl by region"),
                     actionButton("plot_EmpTurn", "Update plot_turnover by region")
                   ),
                   
                   mainPanel(
                     plotOutput("Regionplot"),
                     plotOutput("Turnover_Regionplot")
                   )
)