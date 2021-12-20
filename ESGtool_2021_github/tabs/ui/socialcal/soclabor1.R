soclabor <- tabPanel(title = "Employment", 
                   value = "social_1",
                   br(), hr(),
                   
                   p("Please input employment data (number of employees at the end of reporting period)."),
                   p("Reporting recommendations (per GRI Standard 102): \n 1). express employee numbers as either head count or Full Time Equivalent (FTE), with the chosen approach stated and applied consistently;
               \n 2). use numbers as at the end of the reporting period, unless there has been a material change during the reporting period;
               \n 3). combine country statistics to calculate global statistics, and disregard differences in legal definitions."), 
                   
                   sidebarPanel(
                     h4("Employee Category:"),
                     div(style="display: inline-block;vertical-align:top;",
                         numericInput("senior", "employees no._Senior Management", 5),
                         numericInput("middle", "employees no._Middle Management", 10),
                         numericInput("frontline", "employees no._Frontline & Other Staff", 100))
                   ),
                   
                   sidebarPanel(
                     h4("Gender:"),
                     numericInput("female", "employees no._Female", 60),
                     numericInput("male", "employees no._Male", 55)
                   ),
                   
                   sidebarPanel(
                     h4("Age Group:"),
                     numericInput("Age18", "employees no._Age group: 18-25", 5),
                     numericInput("Age26", "employees no._Age group: 26-35", 5),
                     numericInput("Age36", "employees no._Age group: 36-45", 50),
                     numericInput("Age46", "employees no._Age group: 46-55", 50),
                     numericInput("Age56", "employees no._Age group: 56 or above", 5)
                   ),
                   
                   
                   
                   sidebarPanel(
                     selectInput("chart", "Choose chart format to present",
                                 list("Pie charts" = "pie", "Waffle plots" = "waffle")),
                     selectInput("color", "Choose color scheme for charts",
                                 list("purple" = "Purples", "orange" = "Oranges", "blue" = "Blues", "green" = "Greens", "grey" = "Greys","set" = "Set3", "pastel" = "Pastel1", "spectral" = "Spectral"))
                   ),
                   
                   
                   mainPanel(
                     tabsetPanel(
                       tabPanel("Category_plot", plotOutput("Categoryplot")), 
                       tabPanel("Gender_plot", plotOutput("Genderplot")), 
                       tabPanel("Age_plot", plotOutput("Ageplot"))
                     )
                   )

)