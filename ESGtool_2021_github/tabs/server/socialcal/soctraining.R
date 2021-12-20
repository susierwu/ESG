output$Trn_Perc_Categoryplot <- renderPlot({ 
  if (input$Trn_chart == "bar") {
    data = data.frame(Training_Perct_EmployCategory=c("Senior Mngmt","Middle Mngmt","Frontline & Others"),
                      value = c(input$Trn_senior/input$senior, input$Trn_middle/input$middle, input$Trn_frontline/input$frontline))
    ggplot(data=data, aes(x = "", y = value, fill = Training_Perct_EmployCategory, width = 1, label = percent(data$value))) + 
      geom_col(position = 'dodge', width = 0.5) + 
      geom_text(position = position_dodge(width = 1),    
                vjust = -1, size = 3) + 
      coord_flip()+
      #theme_minimal()+     
      #ggtitle("Total percentage of trained employees by employment category") +
      ylab("Total percentage of trained employees") + 
      xlab("Employment Category") +
      theme(aspect.ratio = 0.5, panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
      geom_hline(yintercept = as.numeric(data$value), linetype="dotted", 
                 color = "dimgrey", size=0.7) +
      scale_fill_brewer(palette=input$Col_chart)
  }
})

# output$Trn_Perc_Categorytable <- renderDataTable({ 
#     if(input$Trn_chart == "table") {
#         data.frame(Employ_Category=c("Senior Management","Middle Management","Frontline & Others"),
#                    Percentage_employees_trained = percent(c(input$Trn_senior/input$senior, input$Trn_middle/input$middle, input$Trn_frontline/input$frontline)))
#     }
# })

output$Trn_Perc_Genderplot <- renderPlot({
  if (input$Trn_chart == "bar") {
    data = data.frame(Training_Perct_Gender=c("Female","Male"),
                      value = c(input$Trn_female/input$female, input$Trn_male/input$male))
    ggplot(data=data, aes(x = "", y = value, fill = Training_Perct_Gender, width = 1, label = percent(data$value))) + 
      geom_col(position = 'dodge', width = 0.05) +   #width not working
      geom_text(position = position_dodge(width = 1),   
                vjust = -1, size = 3) + 
      coord_flip()+ 
      ylab("Total percentage of trained employees") + 
      xlab("Gender") +
      theme(aspect.ratio = 0.3, panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
      geom_hline(yintercept = as.numeric(data$value), linetype="dotted", 
                 color = "dimgrey", size=0.7) +
      scale_fill_brewer(palette=input$Col_chart)
  }
})

# output$Trn_Perc_Gendertable <- renderDataTable({ 
#     if(input$Trn_chart == "table") {
#         data.frame(Gender=c("Female","Male"),
#                    Percentage_employees_trained = percent(c(input$Trn_female/input$female, input$Trn_male/input$male)))
#     }
# })



#average training hour KPIB3.2 
output$Trn_Hr_Categoryplot <- renderPlot({ 
  if (input$Trn_hr_chart == "hr_bar") {
    data = data.frame(Training_hours_EmployCategory=c("Senior Mngmt","Middle Mngmt","Frontline & Others"),
                      value = round(c(input$Trn_senior_hr/input$senior, input$Trn_middle_hr/input$middle, input$Trn_frontline_hr/input$frontline),1))
    ggplot(data=data, aes(x = "", y = value, fill = Training_hours_EmployCategory, width = 1, label = paste(data$value, "hr"))) + 
      geom_col(position = 'dodge', width = 0.5) + 
      geom_text(position = position_dodge(width = 1),    
                vjust = -1, size = 3) + 
      coord_flip()+
      ylab("Average training hours completed for each employee") + 
      xlab("Employment Category") +
      theme(aspect.ratio = 0.5, panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
      scale_fill_brewer(palette=input$Col_chart)
  }
})

output$Trn_Hr_Genderplot <- renderPlot({
  if (input$Trn_hr_chart == "hr_bar") {
    data = data.frame(Training_hours_Gender=c("Female","Male"),
                      value = round(c(input$Trn_female_hr/input$female, input$Trn_male_hr/input$male),1))
    ggplot(data=data, aes(x = "", y = value, fill = Training_hours_Gender, width = 1, label = paste(data$value, "hr"))) + 
      geom_col(position = 'dodge', width = 0.5) + 
      geom_text(position = position_dodge(width = 1),    
                vjust = -1, size = 3) + 
      coord_flip()+
      ylab("Average training hours completed for each employee") + 
      xlab("Gender") +
      theme(aspect.ratio = 0.3, panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
      scale_fill_brewer(palette=input$Col_chart)
  }
})


output$Trn_Hr_Categorytable <- renderDataTable({ 
  if(input$Trn_hr_chart == "hr_table") {
    data.frame(Employ_Category=c("Senior Management","Middle Management","Frontline & Others"),
               Average_training_hours_per_employee = round(c(input$Trn_senior_hr/input$senior, input$Trn_middle_hr/input$middle, input$Trn_frontline_hr/input$frontline),1))
  }
})

output$Trn_Hr_Gendertable <- renderDataTable({ 
  if(input$Trn_hr_chart == "hr_table") {
    data.frame(Gender=c("Female","Male"),
               Average_training_hours_per_employee = round(c(input$Trn_female_hr/input$female, input$Trn_male_hr/input$male),1))
  }
})