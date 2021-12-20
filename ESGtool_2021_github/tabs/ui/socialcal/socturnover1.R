socturnover <- tabPanel(title = "Turnover", 
                     value = "social_2",
                     br(), hr(),
                     p("Please input turnover data for the reporting period (how many people left during the reporting period)."),
                     sidebarPanel(
                       h4("Employee Category (turnover):"),
                       numericInput("T_senior", "employees left_Senior Management", 1),
                       numericInput("T_middle", "employees left_Middle Management", 3),
                       numericInput("T_frontline", "employees left_Frontline & Other Staff", 35)
                     ),
                     
                     sidebarPanel(
                       h4("Gender (turnover):"),
                       numericInput("T_female", "number of employees leaving company_Female", 16),
                       numericInput("T_male", "number of employees leaving company_Male", 23)
                     ),
                     
                     sidebarPanel(
                       h4("Age Group (turnover):"),
                       numericInput("T_Age18", "employees left_Age group: 18-25", 13),
                       numericInput("T_Age26", "employees left_Age group: 26-35", 12),
                       numericInput("T_Age36", "employees left_Age group: 36-45", 9),
                       numericInput("T_Age46", "employees left_Age group: 46-55", 3),
                       numericInput("T_Age56", "employees left_Age group: 56 or above", 2)
                     ),
                     
                     sidebarPanel(
                       selectInput("T_chart", "Choose chart format to present",
                                   list("Barplots" = "bar")),
                       selectInput("T_color", "Choose color scheme for charts",
                                   list("purple" = "Purples", "orange" = "Oranges", "blue" = "Blues", "green" = "Greens", "grey" = "Greys","set" = "Set3", "pastel" = "Pastel1", "spectral" = "Spectral"))
                     ),
                     
                     mainPanel(
                       tabsetPanel(
                         tabPanel("Category_Turnover_plot", plotOutput("Turnover_Categoryplot")), 
                         tabPanel("Gender_Turnover_plot", plotOutput("Turnover_Genderplot")), 
                         tabPanel("Age_Turnover_plot", plotOutput("Turnover_Ageplot"))
                       )
                     )
                     
)