matmatrix <- tabPanel(title = "Materaility Matrix", 
                        value = "mat_matrix",
                        br(), hr(),
                      p("Materiality: The threshold at which ESG issues determined by the board are sufficiently important to investors and other stakeholders that they should be reported."),
                      br(),  
                      fluidRow(
                        column(12,
                               "Enter score (1-5, with 5 most important) on importance to company (indicated by Comp.score) and importance to stakeholder (indicated by Stkh.score) below:",
                               fluidRow(
                                 column(4, "Environmental Aspects: A1-A4", 
                                        fluidRow(
                                          column(6, "A1-Emissions"),column(6, "A2-Resources"),column(6, "A3-Environment&Natural Resources"),column(6, "A4-Climate Change")
                                        )
                                 ),
                                 column(width = 8, "Social and Operational Aspects: B1-B8",
                                        fluidRow(
                                          column(3, "B1-Employment"),column(3, "B2-Health&Safety"),column(3, "B3-Devlpmt&Training"),column(3, "B4-Labor Standards"),
                                          column(3, "B5-Supply Chain Mngmt"),column(3, "B6-Product Responsibility"),column(3, "B7-Anti-corruption"),column(3, "B8-Community Investment")
                                        )
                                 )
                               )
                        )
                      ),
                      
                      
                      matrixInput(
                        "matrix_company",
                        value = matrix(ceiling(runif(12, 1, 5)) , 1, 12,  dimnames = list(c("Comp. score"), 
                                                                                          c(paste("A",seq(1,4), sep=""), paste("B",seq(1,8), sep="")))),
                        rows = list(names = TRUE),
                        cols = list(names = TRUE),
                        copy = TRUE,
                        paste = TRUE
                      ),
                      
                      matrixInput(
                        "matrix_stakeholder",
                        value = matrix(ceiling(runif(12, 1, 5)), nrow = 1, ncol = 12,  dimnames = list(c("Stkh. score"), 
                                                                                                       c(paste("A",seq(1,4), sep=""), paste("B",seq(1,8), sep="")))),
                        rows = list(names = TRUE),
                        cols = list(names = FALSE),
                        copy = TRUE,
                        paste = TRUE
                      ),
                      
                      
                      sidebarPanel(
                        numericInput("line1", "Indicating starting point for first line", 5, min=1, max=5),
                        numericInput("line2", "Indicating starting point for second line", 3, min=1, max=5)
                      ),
                      
                      mainPanel(
                        plotOutput("matmatrixplot",  height = "500px")
                      )            
                        
)