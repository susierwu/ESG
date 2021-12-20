flightdata <- shiny::reactive(matrix(rep(c("PVG", "PEK", 2, 1, 1), each=10), nrow = 10, ncol = 5, dimnames = list(seq(1,10,1), c("Departure", "Arrival", "Passenger_number", "class(1/2/3/4)", "return(1/2)"))))

output$downloadData <- downloadHandler(
  filename = function() {
    paste("test.csv")
  },
  content = function(file) {
    write.csv(flightdata(), file, row.names = FALSE)
  }
)



data_set <- reactive({
  req(input$file1)
  inFile <- input$file1
  filedir <<- file.path(inFile$datapath)
  data_set <- fread(inFile$datapath)
})

output$contents <- renderDataTable({
  data_set()
})


output$errormsg <- renderDataTable(err())
err <-   eventReactive(input$validate, {
  from <- data_set()[,1]
  to <- data_set()[,2]
  w <- r<- c()
  for (i in 1:nrow(data_set())) {
    if (is.error(airport_distance(as.character(from[i]), as.character(to[i]))) == T ) {
      w <- append(w, i)
    } else {
      r <- append(r,i)
    }
  }
  errormsg <- cbind(as.matrix (c(rep("this row is wrong",length(w)), "total number of wrong rows", "total number of right rows")) , c(w, length(w), length(r)) ) 
  colnames(errormsg) <- c("Validation output", "which_wrong row(s) || total#_wrong/correct rows")
  errormsg
}, ignoreNULL = TRUE)



output$GHGtable <- renderDataTable(GHGdf(), options = list(pageLength = 15))
GHGdf <- eventReactive(input$calculate, {
  dist_km <- total_km <- c()
  from <- data_set()[,1]
  to <- data_set()[,2]
  ppl <- data_set()[,3]
  trip <- data_set()[,5]
  
  for (i in 1:nrow(data_set())) {
    if (is.error(airport_distance(as.character(from[i]), as.character(to[i]))) == F ) {
      dist_km[i] <- round(airport_distance(as.character(from[i]), as.character(to[i])), 1)
      total_km[i] <- dist_km[i] * ppl[i] * trip[i]  
    }
    else {
      print(paste("the wrong IATA code found in row:", i))
    }
    #dist_km[i] <- round(airport_distance(as.character(from[i]), as.character(to[i])), 1) 
    #total_km[i] <- dist_km[i] * ppl[i] * trip[i]  
  }
  GHGtable <- cbind(from, to, ppl, trip, as.matrix(dist_km), as.matrix(total_km))
  names(GHGtable) <- c("from", "to", "passenger#", "return", "single_trip_dist", "total_dist(km)")
  GHGtable
}, ignoreNULL = TRUE)


output$GHG_final_table <- renderDataTable(GHGtb(), options = list(pageLength = 15))
GHGtb <<- eventReactive(input$calculation, {
  GHG_EF_econ <- 0.1392452   #for economy class, class 1, 0.139965 for 2018, 0.1384453 for 2019
  GHG_EF_prem <- 0.22278     #for premium economy, class 2, 0.22395 for 2018, 0.22151 for 2019
  GHG_EF_bizclass <- 0.40379 
  GHG_EF_firstclass <- 0.55695
  class <- data_set()[,4]
  dist_km <- total_km <- c()
  GHG_kg <- matrix(NA, nrow=nrow(data_set()),  ncol = 1, byrow = TRUE)
  from <- data_set()[,1]
  to <- data_set()[,2]
  ppl <- data_set()[,3]
  trip <- data_set()[,5]
  
  for (i in 1:nrow(data_set())) {
    validate(
      need(is.error(airport_distance(as.character(from[i]), as.character(to[i]))) == F, paste("The first wrong IATA code was found in row:", i, 
                                                                                              "\n Please refer to the Validation output in step 1 and find which rows have wrong entries
                                                                                                \n Please correct, upload CSV again in step 1."), i)
    )
  }
  
  for (i in 1:nrow(data_set())) {
    if(class[i] == 1) {
      GHG_kg[i] = round( round(airport_distance(as.character(from[i]), as.character(to[i])), 1) * ppl[i] * trip[i] * GHG_EF_econ, 1)
    }
    else if (class[i] == 2) {
      GHG_kg[i] = round( round(airport_distance(as.character(from[i]), as.character(to[i])), 1) * ppl[i] * trip[i] * GHG_EF_prem, 1)
    } 
    else if (class[i] == 3) {
      GHG_kg[i] = round( round(airport_distance(as.character(from[i]), as.character(to[i])), 1) * ppl[i] * trip[i] * GHG_EF_bizclass, 1)
    }
    else {
      GHG_kg[i] = round( round(airport_distance(as.character(from[i]), as.character(to[i])), 1) * ppl[i] * trip[i] * GHG_EF_firstclass, 1)
    }
  }
  GHG_final_table <- cbind(data_set()[,1], data_set()[,2], class, as.matrix(GHG_kg), rep(sum(as.numeric(GHG_kg[])),nrow(data_set())))
  names(GHG_final_table) <- c("from", "to", "flight_class", "for_the_trip_GHG_kg", "summed_alltrips_GHG_kg")
  GHG_final_table
}, ignoreNULL = TRUE)



output$save <- downloadHandler(
  filename = function() {
    "GHGoutput.csv"
  },
  content = function(file) {
    fwrite(GHGtb(), file)
    #write.csv(GHGtb(), file, row.names = FALSE)
  }
)
