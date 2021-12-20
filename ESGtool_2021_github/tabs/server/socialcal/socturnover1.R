output$Turnover_Categoryplot <- renderPlot({ 
  data = data.frame(Turnover_Employ_Category=c("Turnover_Senior Mngmt","Turnover_Middle Mngmt","Turnover_Frontline & Others"),
                    value = c(input$T_senior/input$senior, input$T_middle/input$middle, input$T_frontline/input$frontline))
  ggplot(data=data, aes(x = "", y = value, fill = Turnover_Employ_Category, width = 1, label = percent(data$value))) + 
    geom_col(position = 'dodge', width = 0.5) + 
    geom_text(position = position_dodge(width = 1),    
              vjust = -1, size = 3) + 
    coord_flip()+
    #theme_minimal()+
    ylab("Turnover percentage") + 
    xlab("Employment Category") +
    theme(aspect.ratio = 0.5, panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
    geom_hline(yintercept = as.numeric(data$value), linetype="dotted", 
               color = "dimgrey", size=0.7) +
    scale_fill_brewer(palette=input$T_color)
})


output$Turnover_Genderplot <- renderPlot({ 
  data = data.frame(Turnover_Gender=c("Turnover_Female","Turnover_Male"),
                    value = c(input$T_female/input$female, input$T_male/input$male))
  ggplot(data=data, aes(x = "", y = value, fill = Turnover_Gender, width = 1, label = percent(data$value))) + 
    geom_col(position = 'dodge', width = 0.05) +   #width not working
    geom_text(position = position_dodge(width = 1),   
              vjust = -1, size = 3) + 
    coord_flip()+
    #theme_minimal()+
    ylab("Turnover percentage") + 
    xlab("Gender") +
    theme(aspect.ratio = 0.3, panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
    geom_hline(yintercept = as.numeric(data$value), linetype="dotted", 
               color = "dimgrey", size=0.7) +
    scale_fill_brewer(palette=input$T_color)
})


output$Turnover_Ageplot <- renderPlot({ 
  data = data.frame(Turnover_Age=c("18-25 years old","26-35 years old","36-45 years old","46-55 years old", "56 or above 56 years old"),
                    value = c(input$T_Age18/input$Age18, input$T_Age26/input$Age26, input$T_Age36/input$Age36, input$T_Age46/input$Age46, input$T_Age56/input$Age56))
  ggplot(data=data, aes(x = "", y = value, fill = Turnover_Age, width = 1, label = percent(data$value))) + 
    geom_col(position = 'dodge', width = 0.5) + 
    geom_text(position = position_dodge(width = 1),    
              vjust = -1, size = 3) + 
    coord_flip()+
    #theme_minimal()+
    ylab("Turnover percentage") + 
    xlab("Age Group") +
    theme(aspect.ratio = 0.6, panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
    geom_hline(yintercept = as.numeric(data$value), linetype="dotted", 
               color = "dimgrey", size=0.7) +
    scale_fill_brewer(palette=input$T_color)
})