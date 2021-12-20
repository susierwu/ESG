shinyUI(
  fluidPage(
    ##-- Header ----
    navbarPage(title = div(img(src="",
                               height = "75px"), style = "padding-left:100px;"),
               id = "navbar",
               selected = "home",
               theme = "styles.css", 
               fluid = T,
               ##-- tabs ----
               home,
               mat,
               environ,
               soc,
               opr
    ),
    ##-- Footer ----
    div(class = "footer",
        includeHTML("html/footer.html")
    )
  )
)