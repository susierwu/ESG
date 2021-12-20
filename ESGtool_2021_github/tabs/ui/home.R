home <- tabPanel(title = "Home", 
                 value = "home",
                 hr(),
                 br(), br(),
                 HTML("<h1><center>Welcome to the <b>ESG online tool</b> for data processing </center></h1>"),
                 br(), br(), br(), br(),
                 column(width = 3, align = "center",
                        tab_voronoys(texto = "Materiality Matrix", cor = cores[1], icon = "flag.png", id = "click_mat")
                        ),
                 column(width = 3, align = "center",
                        tab_voronoys(texto = "Environmental_Selected KPIs", cor = cores[2], icon = "energy1.png", id = "click_environ")
                 ),
                 column(width = 3, align = "center",
                        tab_voronoys(texto = "Social_Employment & Labour ", cor = cores[3], icon = "person.png", id = "click_social")
                 ),
                 column(width = 3, align = "center",
                        tab_voronoys(texto = "Social_Operating Practices", cor = cores[4], icon = "earth.png", id = "click_opr")
                 ),
                 column(width = 12,
                        br(), br(), br(), br(),
                        wellPanel(
                          HTML("<h3><b>ESG online tool</b></h3>"),
                          HTML("<h4>This ESG online tool_version 2.0 is for <b>data calculation & visualization</b> purposes. It is developed as an open-source tool to
                          help issuers facilitate ESG reporting, following HKex Appendix 20/27. </h4>")
                        )
                 )
)
