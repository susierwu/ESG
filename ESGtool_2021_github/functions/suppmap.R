drawmap <- function(n_countries, supp_loc, supp_num, worldmap) {
  Supplier_location <- Supplier_numbers <- Longitude <- Latitude <- c()
  for (i in 1:n_countries){
    Supplier_location[i] <- supp_loc[i]
    Supplier_numbers[i] <- round(as.numeric(unlist(strsplit(supp_num,","))),0)[i]
    Longitude[i] = subset(worldmap, worldmap@data$NAME  %in% supp_loc[i])$LON
    Latitude[i] = subset(worldmap, worldmap@data$NAME  %in% supp_loc[i])$LAT
  }
  ttbb <- cbind(Supplier_location, Supplier_numbers,as.numeric(Longitude), as.numeric(Latitude)) 
  
  return(ttbb)
}