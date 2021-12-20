output$Regionplot <- renderPlot(pp())
pp <- eventReactive(input$plot_Emp, {
  if(input$G_chart == "pie") {
    g <- input$region[1:nrow(input$region)-1,1]
    v <- input$region[1:nrow(input$region)-1,2]
    per <- round(as.numeric(v)/sum(as.numeric(v)) ,2)
    data <- data.frame(value = per, Employ_Region = g)
    data <- data %>%
      arrange(desc(Employ_Region))
    data
    ggplot(data, aes(x = "", y = value, fill = Employ_Region)) +
      geom_bar(width = 1, stat = "identity") +
      coord_polar("y", start = 0)+
      geom_text(aes(y = cumsum(value) - 0.5*value,  label = paste0(value*100, "%")), color = "white") + 
      theme_void()+
      scale_fill_brewer(palette=input$G_color)
  }
  else if (input$G_chart =="waffle") {
    vals <- as.numeric(input$region[1:nrow(input$region)-1,2])
    g <- input$region[1:nrow(input$region)-1,1]
    val_names <- sprintf("%s (%s)", g, scales::percent(round(vals/sum(vals), 3)))
    names(vals) <- val_names
    waffle::waffle(vals, colors=brewer.pal(nrow(input$region)-1,input$G_color)) 
  }
  
})

output$Turnover_Regionplot <- renderPlot(tt())
tt <- eventReactive(input$plot_EmpTurn, {
  # if(input$G_region == "three_region") {
  g <- input$region[1:nrow(input$region)-1,1]
  vv <- round(as.numeric(input$region[1:nrow(input$region)-1,3]) / as.numeric(input$region[1:nrow(input$region)-1,2]), 2)
  
  data = data.frame(Turnover_Region = g, value = vv)
  ggplot(data=data, aes(x = "", y = value, fill = Turnover_Region, width = 1, label = percent(data$value))) +
    geom_col(position = 'dodge', width = 0.5) +
    geom_text(position = position_dodge(width = 1),
              vjust = -1, size = 3) +
    coord_flip()+
    #theme_minimal()+
    ylab("Turnover percentage") +
    xlab("Geographical Region") +
    theme(aspect.ratio = 0.6, panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
    geom_hline(yintercept = as.numeric(data$value), linetype="dotted",
               color = "dimgrey", size=0.7) +
    scale_fill_brewer(palette=input$G_color)
})
