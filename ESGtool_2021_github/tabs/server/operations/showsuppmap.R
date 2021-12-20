ttb <- reactive({
  validate(
    need(length(input$sup_country) == length(unlist(strsplit(input$sup_number,","))), "Please check: \n 1. Countries are entered by alphabetical order, with numbers of suppliers entered correspondingly for each country \n 2. Numbers are seperated by comma ")
  )
  ttb <- drawmap(length(input$sup_country),input$sup_country,input$sup_number,wmap)
  ttb
})


worldnew <- reactive ({
  worldnew <- wmap
  for (i in 1:nrow(wmap)) {
    if(rlang::is_empty(which(wmap@data$NAME[i] == ttb()[,1])) == F) {
      worldnew@data$new_suppdt[i] = as.numeric(ttb()[which(wmap@data$NAME[i] == ttb()[,1]),2])   #col2 of ttb() for supplier no.
    } else {
      worldnew@data$new_suppdt[i] <- NA
    }
  }
  worldnew
})


wmap_withsupp <- reactive ({
  wmap_withsupp <- subset(worldnew(), is.na(worldnew()@data$new_suppdt) ==F )
  wmap_withsupp
})


pal <- reactive ({ colorBin("YlOrRd", domain = worldnew()@data$new_suppdt, na.color = NA, bins = 4)})

output$supplier_table <- renderTable(tbtable())
tbtable <- eventReactive(input$table, {
  validate(
    need(length(input$sup_country) == length(unlist(strsplit(input$sup_number,","))), "Please check: \n 1. Countries are entered by alphabetical order, with numbers of suppliers entered correspondingly for each country \n 2. Numbers are seperated by comma ")
  )
  data.frame("Suppliers_location" = input$sup_country,
             "Suppliers_numbers" = unlist(strsplit(input$sup_number,","))
  )
})


output$supplier_map <- renderLeaflet(tmsupp())
tmsupp <- eventReactive(input$map, {
  
  if(input$map_pin == "choropleth") {
    leaflet(wmap) %>% 
      addTiles()  %>% 
      setView(lat=10, lng=0 , zoom=2) %>%
      addPolygons(
        fillColor  =~  pal()(worldnew()@data$new_suppdt),
        weight = 2,
        opacity = 1,
        color = "white",
        dashArray = "3",
        fillOpacity = 0.7,
        label = paste("suppliers: ", worldnew()@data$new_suppdt, "at", worldnew()@data$NAME),
        labelOptions = labelOptions(
          style = list("font-weight" = "normal", padding = "3px 8px"), 
          textsize = "13px", 
          direction = "auto"
        )) %>%
      addLegend('bottomright', values = ttb()[,2], pal= pal(),
                title = "No. of Suppliers",
                opacity = 0.6) %>%  
      addPopups(wmap_withsupp(), lng = wmap_withsupp()@data$LON, lat = wmap_withsupp()@data$LAT,
                popup =~ paste( wmap_withsupp()@data$new_suppdt, "suppliers at", wmap_withsupp()@data$NAME, "<br/>"),
                options = popupOptions())
    
  }
  
  else if(input$map_pin == "choropleth_nolable") {
    leaflet(wmap) %>% 
      addTiles()  %>% 
      setView(lat=10, lng=0 , zoom=2) %>%
      addPolygons(
        fillColor  =~  pal()(worldnew()@data$new_suppdt),
        weight = 2,
        opacity = 1,
        color = "white",
        dashArray = "3",
        fillOpacity = 0.7,
        label = paste("suppliers: ", worldnew()@data$new_suppdt, "at", worldnew()@data$NAME),
        labelOptions = labelOptions(
          style = list("font-weight" = "normal", padding = "3px 8px"), 
          textsize = "13px", 
          direction = "auto"
        )) %>%
      addLegend('bottomright', values = ttb()[,2], pal= pal(),
                title = "No. of Suppliers",
                opacity = 0.6)
  }
  
  
  else if(input$map_pin == "circle") {
    
    leaflet(wmap) %>%
      #fitBounds(~min(wwd$ave_Longitude), ~min(wwd$ave_Latitude), ~max(wwd$ave_Longitude), ~max(wwd$ave_Latitude))
      setView(lng = -1, lat = 1, zoom = 12) %>% 
      addProviderTiles(providers$OpenStreetMap) %>%  #basemap 
      clearBounds() %>%                              #world view
      addCircleMarkers( 
        lng=~  as.numeric(ttb()[,3]),      #%in%  if not single element
        lat=~  as.numeric(ttb()[,4]),
        radius=~  ttb()[,2],
        fillColor = "orangered",
        stroke=FALSE, # Circle stroke
        fillOpacity=0.5, # Circle Fill Opacity
        popup=~paste(
          "suppliers: ", ttb()[,2], "at", ttb()[,1], "<br/>"
        )
      ) %>%  
      addPopups(lng = as.numeric(ttb()[,3]), lat = as.numeric(ttb()[,4]),
                popup =~paste("suppliers: ", ttb()[,2], "at", ttb()[,1], "<br/>"),
                options = popupOptions())
    
  }
  else if(input$map_pin == "pin") {
    
    leaflet(wmap) %>%
      #fitBounds(~min(wwd$ave_Longitude), ~min(wwd$ave_Latitude), ~max(wwd$ave_Longitude), ~max(wwd$ave_Latitude))
      setView(lng = -1, lat = 1, zoom = 12) %>% 
      addProviderTiles(providers$OpenStreetMap) %>%  #basemap 
      clearBounds() %>%                              #world view
      addMarkers(
        lng=~  as.numeric(ttb()[,3]),      #%in%  if not single element
        lat=~  as.numeric(ttb()[,4]),
        popup=~paste(
          "suppliers: ", ttb()[,2], "at", ttb()[,1], "<br/>"
        )
      ) %>%  
      addPopups(lng = as.numeric(ttb()[,3]), lat = as.numeric(ttb()[,4]),
                popup =~paste("suppliers: ", ttb()[,2], "at", ttb()[,1], "<br/>"),
                options = popupOptions())
    
    
  }
  
  
})
