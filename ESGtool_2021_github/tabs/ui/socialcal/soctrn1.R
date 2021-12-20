soctrn<- tabPanel(title = "Training", 
                   value = "social_4",
                   br(), hr(),
                  p("Please input training data (total number of trained employees and total training hours completed for those trained) 
                       during the reporting period by employment category and by gender."),
                  
                  sidebarPanel(
                    h4("By Employee Category:"),
                    hr(),
                    tags$i(h4("Senior Management")),
                    numericInput("Trn_senior", "number of employees trained", 1),
                    numericInput("Trn_senior_hr", "total training hours", 3),
                    hr(),
                    tags$i(h4("Middle Management")),
                    numericInput("Trn_middle", "number of employees trained", 3),
                    numericInput("Trn_middle_hr", "total training hours", 22),
                    hr(),
                    tags$i(h4("Frontline & Other Staff")),
                    numericInput("Trn_frontline", "number of employees trained", 30),
                    numericInput("Trn_frontline_hr", "total training hours", 290)
                  ),
                  
                  
                  sidebarPanel(
                    h4("By Gender:"),
                    hr(),
                    tags$i(h4("Female")),
                    numericInput("Trn_female", "number of employees trained", 67),
                    numericInput("Trn_female_hr", "total training hours", 200),
                    hr(),
                    tags$i(h4("Male")),
                    numericInput("Trn_male", "number of employees trained", 53),
                    numericInput("Trn_male_hr", "total training hours", 125)
                  ),
                  
                  
                  sidebarPanel(
                    h4("Output format"),
                    hr(),
                    tags$i(h5("Format to present percentage of employees trained (KPIB3.1)")),
                    selectInput("Trn_chart", "Choose format to present",
                                list("Barplot" = "bar")),
                    hr(),
                    tags$i(h5("Format to present average training hour (KPIB3.2)")),
                    selectInput("Trn_hr_chart", "Choose format to present",
                                list("Barplot" = "hr_bar")),
                    hr(),
                    tags$i(h5("Select color scheme if presenting by chart")),
                    selectInput("Col_chart", "Color scheme for chart",
                                list("purple" = "Purples", "orange" = "Oranges", "blue" = "Blues", "green" = "Greens", "grey" = "Greys","set" = "Set3", "pastel" = "Pastel1", "spectral" = "Spectral"))
                  ),
                  
                  mainPanel(
                    plotOutput("Trn_Perc_Categoryplot",height = 250),
                    plotOutput("Trn_Perc_Genderplot",height = 250),
                    dataTableOutput("Trn_Perc_Categorytable"),
                    dataTableOutput("Trn_Perc_Gendertable"),
                    br(),br(),br(),br(),
                    plotOutput("Trn_Hr_Categoryplot" ,height = 250),
                    plotOutput("Trn_Hr_Genderplot",height = 250),
                    dataTableOutput("Trn_Hr_Categorytable"),
                    dataTableOutput("Trn_Hr_Gendertable")
                  )  

)