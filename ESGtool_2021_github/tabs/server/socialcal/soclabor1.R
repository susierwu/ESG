output$Categoryplot <- renderPlot({ 
  if(input$chart == "pie") {
    data = data.frame(Employ_Category=c("Frontline & Others","Middle Mngmt","Senior Mngmt"),value = c(input$frontline, input$middle, input$senior))
    data <- data %>% 
      mutate(per=data$value/sum(data$value)) %>% 
      arrange(desc(Employ_Category))
    data$label <- scales::percent(data$per)
    ggplot(data=data)+
      geom_bar(aes(x="", y=per, fill=Employ_Category), stat="identity", width = 1)+
      coord_polar("y", start=0)+
      theme_void()+
      scale_fill_brewer(palette=input$color)+
      geom_text(aes(x=1, y = cumsum(per) - per/2, label=label))
  }
  else if (input$chart =="waffle") {
    vals <- c(input$senior, input$middle, input$frontline)
    val_names <- sprintf("%s (%s)", c("Senior Mngmt","Middle Mngmt","Frontline & Others"), scales::percent(round(vals/sum(vals), 3)))
    names(vals) <- val_names
    waffle::waffle(vals, colors=brewer.pal(3,input$color))
  }
})

output$Genderplot <- renderPlot({ 
  if(input$chart == "pie") { 
    data = data.frame(Employ_Gender=c("Female","Male"),value = c(input$female, input$male))
    data <- data %>% 
      mutate(per=data$value/sum(data$value)) %>% 
      arrange(desc(Employ_Gender))
    data$label <- scales::percent(data$per)
    ggplot(data=data)+
      geom_bar(aes(x="", y=round(per,1), fill=Employ_Gender), stat="identity", width = 1)+
      coord_polar("y", start=0)+
      theme_void()+
      scale_fill_brewer(palette=input$color)+
      geom_text(aes(x=1, y = cumsum(per) - per/2, label=label))
  }
  else if (input$chart == "waffle") {
    vals <- c(input$female, input$male)
    val_names <- sprintf("%s (%s)", c("Female","Male"), scales::percent(round(vals/sum(vals), 3)))
    names(vals) <- val_names
    if(input$color == "Purples") {
      waffle::waffle(vals, color = c("#bcbddc","#756bb1"))
    }
    else if (input$color == "Greens"){
      waffle::waffle(vals, color = c("#a1d99b","#31a354"))
    }
    else if (input$color == "Blues"){
      waffle::waffle(vals, color = c("#9ecae1","#3182bd"))
    }
    else if (input$color == "Oranges"){
      waffle::waffle(vals, color = c("#fdae6b","#e6550d"))
    }
    else if (input$color == "Greys"){
      waffle::waffle(vals, color = c("#bdbdbd","#636363"))
    }
    else if (input$color == "Spectral"){
      waffle::waffle(vals, color = c("#fc8d59","#99d594"))
    }
    else if (input$color == "Pastel1"){
      waffle::waffle(vals, color = c("#fbb4ae","#b3cde3"))
    }
    else if (input$color == "Set3"){
      waffle::waffle(vals, color = c("#ffffb3","#bebada"))
    }
  }
})

output$Ageplot <- renderPlot({
  if(input$chart == "pie") {  
    data = data.frame(Employ_Age=c("18-25 years old","26-35 years old","36-45 years old","46-55 years old", "56 or above 56 years old"),
                      value = c(input$Age18, input$Age26,input$Age36, input$Age46,input$Age56))
    data <- data %>% 
      mutate(per=data$value/sum(data$value)) %>% 
      arrange(desc(Employ_Age))
    data$label <- scales::percent(data$per)
    ggplot(data=data)+
      geom_bar(aes(x="", y=per, fill=Employ_Age), stat="identity", width = 1)+
      coord_polar("y", start=0)+
      theme_void()+
      scale_fill_brewer(palette=input$color)+
      geom_text(aes(x=1, y = cumsum(per) - per/2, label=label))
  }
  else if (input$chart == "waffle") {
    vals <- c(input$Age18, input$Age26,input$Age36, input$Age46,input$Age56)
    val_names <- sprintf("%s (%s)", c("18-25 years old","26-35 years old","36-45 years old","46-55 years old", "56 or above 56 years old"), scales::percent(round(vals/sum(vals), 3)))
    names(vals) <- val_names
    waffle::waffle(vals, colors=brewer.pal(5,input$color)) 
  } 
  
})

