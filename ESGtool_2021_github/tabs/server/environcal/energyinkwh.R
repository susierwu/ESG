totalelec_cal <-  reactive({
  df <- input$elec
  if(input$dtpetrol_liter != 0) {
    petrol <- round(ifelse(input$location == "CN", input$dtpetrol_liter/1000 * 740.7 * 43070 * KJ2kwh ,
                           input$dtpetrol_liter/1000 * 740.7 * 44300 * KJ2kwh),3)
    df <- sum(df, petrol)}
  else{
    df <- df
  }
  
  if(input$dtdiesel_liter != 0) {
    diesel <- round(ifelse(input$location == "CN", input$dtdiesel_liter/1000 * 843.9 * 42652 * KJ2kwh,
                           input$dtdiesel_liter/1000 * 843.9 * 43000 * KJ2kwh),3)
    df <- sum(df, diesel)}
  else{
    df <- df
  }
  
  if(input$dtLPG != 0) {
    LPG <-  round(
      if(input$location == "CN") {
        ifelse(input$LPGunit == "kg", input$dtLPG  * 50179 * KJ2kwh, input$dtLPG * 522.2 * 50179 * KJ2kwh)
      } else if (input$location =="non-CN") {
        ifelse(input$LPGunit == "kg", input$dtLPG  * 47300 * KJ2kwh, input$dtLPG * 522.2 * 47300 * KJ2kwh)
      },3)
    
    df <- sum(df, LPG)}
  else{
    df <- df
  }
  
  if(input$dtNG != 0) {
    NG <-  round(
      if (input$location == "CN") {
        ifelse(input$NGunit == "kg", input$dtNG/0.7 * 35575.5 * KJ2kwh, input$dtNG * 35575.5 * KJ2kwh)
      } else if (input$location =="non-CN") {
        ifelse(input$NGunit == "kg", input$dtNG * 44200 * KJ2kwh, input$dtNG * 0.7  * 44200 * KJ2kwh)
      },3)
    
    df <- sum(df, NG)}
  else{
    df <- df
  }
  
  if(input$towngasunit != 0) {
    towngas <-   round(input$towngasunit * 48 * 1000 * KJ2kwh,3)
    df <- sum(df, towngas)}
  else{
    df <- df
  }
  
  if(input$dtfueloil_liter != 0) {
    fueloil <-  round(input$dtfueloil_liter/1000 * 925.1 * 41816 * KJ2kwh,3)
    df <- sum(df, fueloil)}
  else{
    df <- df
  }
})


output$totalelec <- renderPrint({
  cat("The Group's total elec. and non-elec. consumption (in kWh) is:\n")
  print(totalelec_cal())
})



total_cal <- reactive({
  df <- list()
  if(input$dtpetrol_liter != 0) {
    petrol <- round(ifelse(input$location == "CN", input$dtpetrol_liter/1000 * 740.7 * 43070 * KJ2kwh ,
                           input$dtpetrol_liter/1000 * 740.7 * 44300 * KJ2kwh),3)
    df <- paste("petrol", petrol)}
  else{
    df <- df
  }
  
  if(input$dtdiesel_liter != 0) {
    diesel <- round(ifelse(input$location == "CN", input$dtdiesel_liter/1000 * 843.9 * 42652 * KJ2kwh,
                           input$dtdiesel_liter/1000 * 843.9 * 43000 * KJ2kwh),3)
    df <- append(df, paste("diesel", diesel))}
  else{
    df <- df
  }
  
  if(input$dtLPG != 0) {
    LPG <-  round(
      if(input$location == "CN") {
        ifelse(input$LPGunit == "kg", input$dtLPG  * 50179 * KJ2kwh, input$dtLPG * 522.2 * 50179 * KJ2kwh)
      } else if (input$location =="non-CN") {
        ifelse(input$LPGunit == "kg", input$dtLPG  * 47300 * KJ2kwh, input$dtLPG * 522.2 * 47300 * KJ2kwh)
      },3)
    
    df <- append(df, paste("LPG", LPG))}
  else{
    df <- df
  }
  
  if(input$dtNG != 0) {
    NG <-  round(
      if (input$location == "CN") {
        ifelse(input$NGunit == "kg", input$dtNG/0.7 * 35575.5 * KJ2kwh, input$dtNG * 35575.5 * KJ2kwh)
      } else if (input$location =="non-CN") {
        ifelse(input$NGunit == "kg", input$dtNG * 44200 * KJ2kwh, input$dtNG * 0.7  * 44200 * KJ2kwh)
      },3)
    
    df <- append(df, paste("NG", NG))}
  else{
    df <- df
  }
  
  if(input$towngasunit != 0) {
    towngas <-   round(input$towngasunit * 48 * 1000 * KJ2kwh,3)
    df <- append(df, paste("towngas", towngas))}
  else{
    df <- df
  }
  
  if(input$dtfueloil_liter != 0) {
    fueloil <-  round(input$dtfueloil_liter/1000 * 925.1 * 41816 * KJ2kwh,3)
    df <- append(df, paste("fueloil", fueloil))}
  else{
    df <- df
  }
  
})

output$total <- renderPrint({
  cat("The Group has following types of non-elec. energy consumed (in kWh):\n")
  print(total_cal())
})



intensity_cal <- reactive({
  df <- input$elec
  if(input$dtpetrol_liter != 0) {
    petrol <- round(ifelse(input$location == "CN", input$dtpetrol_liter/1000 * 740.7 * 43070 * KJ2kwh ,
                           input$dtpetrol_liter/1000 * 740.7 * 44300 * KJ2kwh),3)
    df <- sum(df, petrol)}
  else{
    df <- df
  }
  
  if(input$dtdiesel_liter != 0) {
    diesel <- round(ifelse(input$location == "CN", input$dtdiesel_liter/1000 * 843.9 * 42652 * KJ2kwh,
                           input$dtdiesel_liter/1000 * 843.9 * 43000 * KJ2kwh),3)
    df <- sum(df, diesel)}
  else{
    df <- df
  }
  
  if(input$dtLPG != 0) {
    LPG <-  round(
      if(input$location == "CN") {
        ifelse(input$LPGunit == "kg", input$dtLPG  * 50179 * KJ2kwh, input$dtLPG * 522.2 * 50179 * KJ2kwh)
      } else if (input$location =="non-CN") {
        ifelse(input$LPGunit == "kg", input$dtLPG  * 47300 * KJ2kwh, input$dtLPG * 522.2 * 47300 * KJ2kwh)
      },3)
    
    df <- sum(df, LPG)}
  else{
    df <- df
  }
  
  if(input$dtNG != 0) {
    NG <-  round(
      if (input$location == "CN") {
        ifelse(input$NGunit == "kg", input$dtNG/0.7 * 35575.5 * KJ2kwh, input$dtNG * 35575.5 * KJ2kwh)
      } else if (input$location =="non-CN") {
        ifelse(input$NGunit == "kg", input$dtNG * 44200 * KJ2kwh, input$dtNG * 0.7  * 44200 * KJ2kwh)
      },3)
    
    df <- sum(df, NG)}
  else{
    df <- df
  }
  
  if(input$towngasunit != 0) {
    towngas <-   round(input$towngasunit * 48 * 1000 * KJ2kwh,3)
    df <- sum(df, towngas)}
  else{
    df <- df
  }
  
  if(input$dtfueloil_liter != 0) {
    fueloil <-  round(input$dtfueloil_liter/1000 * 925.1 * 41816 * KJ2kwh,3)
    df <- sum(df, fueloil)}
  else{
    df <- df
  }
  
  df <- df/input$totalarea
})

output$intensity <- renderPrint({
  cat("The Group's total elec. intensity (in kWh per defined unit) is:\n")
  print(intensity_cal())
})


output$Aplot <- renderPlot({
  petrol <- round(ifelse(input$location == "CN", input$dtpetrol_liter/1000 * 740.7 * 43070 * KJ2kwh ,
                         input$dtpetrol_liter/1000 * 740.7 * 44300 * KJ2kwh),3)
  
  diesel <- round(ifelse(input$location == "CN", input$dtdiesel_liter/1000 * 843.9 * 42652 * KJ2kwh,
                         input$dtdiesel_liter/1000 * 843.9 * 43000 * KJ2kwh),3)
  
  LPG <-  round(    
    if(input$location == "CN") { 
      ifelse(input$LPGunit == "kg", input$dtLPG  * 50179 * KJ2kwh, input$dtLPG * 522.2 * 50179 * KJ2kwh)
    } else if (input$location =="non-CN") {
      ifelse(input$LPGunit == "kg", input$dtLPG  * 47300 * KJ2kwh, input$dtLPG * 522.2 * 47300 * KJ2kwh)
    },3)
  
  NG <-  round(  
    if (input$location == "CN") { 
      ifelse(input$NGunit == "kg", input$dtNG/0.7 * 35575.5 * KJ2kwh, input$dtNG * 35575.5 * KJ2kwh)
    } else if (input$location =="non-CN") {
      ifelse(input$NGunit == "kg", input$dtNG * 44200 * KJ2kwh, input$dtNG * 0.7  * 44200 * KJ2kwh)
    },3)
  
  towngas <-   round(input$towngasunit * 48 * 1000 * KJ2kwh,3)
  
  fueloil <-  round(input$dtfueloil_liter/1000 * 925.1 * 41816 * KJ2kwh,3)
  
  df <- data.frame(petrol, diesel, LPG, NG, towngas, fueloil)
  colnames(df) <- c("petrol", "diesel", "LPG", "natural gas", "towngas", "fueloil")
  newdf <- subset.data.frame(df, select = df[]!= 0)
  
  #barplot(t(as.matrix(newdf)), beside=T, names.arg=colnames(newdf), ylab = "consumption in kWh")
  
  newddf <- melt(newdf)
  colnames(newddf) <- c("fuel","consumption_kWh")
  newddf$energy_type <- "non-elec"
  ddddf <- rbind(newddf, data.frame(fuel="electricity", consumption_kWh = input$elec, energy_type ="elec"))
  
  ggplot(ddddf, aes(fill=fuel, y=consumption_kWh, x=energy_type)) +
    geom_bar(stat="identity")  +
    geom_text(aes(label=consumption_kWh), position = position_stack(vjust = 0.5),
              color="black", size=3)  +
    scale_fill_brewer(palette="Blues")
  
})

