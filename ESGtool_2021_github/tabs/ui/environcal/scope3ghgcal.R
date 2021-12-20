GHG3scope <- tabPanel(title = "Scope3 GHG biz air travel", 
                            value = "environ1",
                            br(), hr(), 
                      
                      fluidRow(
                        column(12,
                               "This is developed to calculate scope 3 GHG from business air travel. The calculation is based on using EF (kg CO2e/passenger-km) 
                      from '2020 UK Government GHG Conversion Factors for Company Reporting' :: sheet(Business travel - air):: EF(International, to/from non-UK, with RF)"
                        )),
                      br(),
                      fluidRow(
                        column(12,
                               "Please upload CSV file (in Step1), with five columns (an example is shown below). You can also downlaod the template .CSV file."
                        )),
                      fluidRow(
                        column(12,
                               "Descriptions: Col1: departure airport; Col2: arrival airport; please use IATA airport code (https://www.world-airport-codes.com/);
                      Col3: number of passengers; Col4: flight class (1-economy; 2-premium economy; 3-biz class; 4-first class); Col5: Return trip (1-single trip; 2-return trip)."
                        )),
                      br(),
                      matrixInput(
                        "biztravel",
                        value = matrix(rep(c("PVG", "PEK", 2, 1, 1), each=1), nrow = 1, ncol = 5, dimnames = list(seq(1,1,1), c("Departure", "Arrival", "Passenger_number", "Class(1/2/3/4)", "Return(1/2)"))),  
                        rows = list(names = FALSE, editableNames = TRUE),
                        cols = list(names = TRUE)
                      ),
                      
                      sidebarPanel("Download .CSV template then have your own data entries",
                                   downloadButton("downloadData", "Download (add suffix '.CSV')")
                      ),
                      
                      sidebarPanel("Step 1_Upload CSV file and validate data entries",
                                   fileInput("file1", "Choose CSV Input File",
                                             accept = c(
                                               "text/csv",
                                               "text/comma-separated-values,text/plain",
                                               ".csv")),
                                   actionButton("validate", "Validating input IATA code")
                      ),
                      
                      
                      sidebarPanel("Step 2_Calculate airport distance",
                                   actionButton("calculate", "Calculating airport distance")
                      ),
                      
                      
                      sidebarPanel("Step 3_Calculate scope 3 GHG",
                                   actionButton("calculation", "Run GHG calculation"),
                                   downloadButton("save", "Save results (add suffix '.CSV')")
                      ),
                      
                      
                      mainPanel(
                        tabsetPanel(
                          tabPanel("Step1.Raw_input", dataTableOutput("contents")),  
                          tabPanel("Step1.validate_error", dataTableOutput("errormsg")),
                          tabPanel("Step2.Flight_info",dataTableOutput("GHGtable")), 
                          tabPanel("Step3.Final_GHG", dataTableOutput("GHG_final_table"))
                        ))
)