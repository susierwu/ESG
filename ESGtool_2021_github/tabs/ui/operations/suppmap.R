
suppliermap <- tabPanel(title = "Suppliers Map", 
                        value = "opr_suppmap",
                        br(), hr(),
                      p("Suppliers (definition per GRI standard): organization or person that provides a product or service used in the supply chain of the reporting organization. Examples of suppliers can include, but are not limited to: -Brokers; -Consultants; -Contractors; -Distributors; -Franchisees or licensees; -Home workers 
      -Independent contractors; -Manufacturers; -Primary producers; -Sub-contractors; -Wholesalers"),
                      br(),  
                      sidebarLayout(

                          sidebarPanel(
                            selectizeInput(
                              'sup_country', 'Select where your suppliers are located', choices = wmap@data$NAME, selected = c("Australia","China","Thailand"), multiple = TRUE),
                            br(),
                            textInput('sup_number', 'Enter number of suppliers for each selected locations (in the same order) (comma delimited)', "10,50,20"),
                          ),
                          
                          sidebarPanel(
                            selectInput("map_pin", "Choose map option:",
                                        list("Choropleth map_lable displaced" = "choropleth", "Choropleth map_lable not displaced" = "choropleth_nolable",
                                             "Map with circle (suggested for <50 total no. of suppliers)" = "circle", "Map with pin" = "pin")),
                            tags$hr(),
                            actionButton("map", "Update suppliers map"),
                            br(),br(),
                            actionButton("table", "Update suppliers table"),
                            width = 6
                          )
                        ),
                        
                        mainPanel(
                          leafletOutput("supplier_map", height = 600, width = 600),
                          tableOutput("supplier_table"))
)