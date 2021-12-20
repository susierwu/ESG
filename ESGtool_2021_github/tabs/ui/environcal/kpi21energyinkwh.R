kpia21energy <- tabPanel(title = "Total energy in kWh", 
                          value = "environ2",
                         br(), hr(),
                         
                         p("Please first select the location where you operate your business, either in mainland China, or others. 
                   If you have both operations in mainland China and other places, please seperate the calculation and do it twice. 
                           Then enter the amount of any energy sources that you consumed during the reporting year."),     
                         hr(),
                         
                         sidebarPanel(
                           selectInput("location", "Select location",
                                       list("mainland China (using CN energy stat)" = "CN", 
                                            "all others (e.g.,HK) (using IPCC)" = "non-CN")),
                           #div(style="display: inline-block;vertical-align:top; width: 240px;", numericInput("totalarea", "Entering intensity calculation unit (e.g., number of employees/total prorduction volumn)", 100)),
                           hr(),
                           numericInput("totalarea", "Entering intensity calculation unit (e.g., number of employees/total prorduction volumn)", 100)
                         ),
                         hr(),
                         
                         div(style="display: inline-block;vertical-align:top; width: 260px;",numericInput("elec", "electricity consumed (in kWh)", 1000)),
                         #div(style="display: inline-block;vertical-align:top; width: 10px;",HTML("<br>")),  
                         #div(style="display: inline-block;vertical-align:top; width: 110px;",HTML("<br>")),  
                         br(),
                         div(style="display: inline-block;height: 75px; width: 220px;",numericInput("dtpetrol_liter", "petrol consumed (in liters)", 10)),
                         div(style="display: inline-block;vertical-align:top; width: 30px;",HTML("<br>")), 
                         div(style="display: inline-block;height: 75px; width: 220px;",numericInput("dtdiesel_liter", "diesel consumed (in liters)", 10)),
                         br(),
                         #div(style="display: inline-block;vertical-align:top; width: 110px;",HTML("<br>")),  
                         div(style="display: inline-block;height: 75px;  width: 220px;", numericInput("towngasunit", "towngas consumed (in unit)", 0)),
                         div(style="display: inline-block;vertical-align:top; width: 30px;",HTML("<br>")), 
                         div(style="display: inline-block;height: 75px; width: 220px;",  numericInput("dtfueloil_liter", "fuel oil consumed (in liters)", 0)),
                         hr(),
                         
                         sidebarPanel(
                           numericInput("dtLPG", "entering LPG data (select kg or m3 below)", 0),
                           selectInput("LPGunit", "LPGunit:",
                                       c("kg" = "kg",
                                         "m3" = "m3"
                                       ))),
                         
                         sidebarPanel(
                           numericInput("dtNG", "entering natural gas data (select kg or m3 below)", 0),
                           selectInput("NGunit", "NGunit:",
                                       c("kg" = "kg",
                                         "m3" = "m3"
                                       ))),
                         
                         
                         mainPanel(
                           verbatimTextOutput("total"),
                           verbatimTextOutput("totalelec"),
                           verbatimTextOutput("intensity"),
                           plotOutput("Aplot")
                         )
)