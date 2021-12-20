output$matmatrixplot <- renderPlot({
  x <- as.numeric(as.vector(input$matrix_company))
  y <- as.numeric(as.vector(input$matrix_stakeholder))
  
  dfmat <- data.frame(x, y)
  rownames(dfmat) <- c(paste("A",seq(1,4), sep=""), paste("B",seq(1,8), sep="")) 
  
  ggplot(dfmat) +
    labs(x = "Importance to company", y = "Importance to stakeholder") +
    xlim(1, 5) + 
    ylim(1, 5) +
    coord_fixed() +
    geom_curve(aes(x = 6-input$line1, y = 5, xend = 5, yend = 6-input$line1), colour = "gray48", cex=1.2, data = dfmat, curvature = 0.4) + 
    geom_curve(aes(x = input$line2, y = 5, xend = 5, yend = input$line2),colour = "gray48", cex=1.2, data = dfmat, curvature = 0.4) +
    geom_point(x = x, y=y, colour = "red", size = 5)  +
    geom_text_repel(aes(x = x, y=y, label = rownames(dfmat)), size = 4, hjust = 0,point.padding = 0.2) 
})
