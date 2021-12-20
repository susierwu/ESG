shinyServer(function(input, output, session){
  ##-- HOME ----
  source("tabs/server/home.R", local = TRUE)
  #mat matrix
  source("tabs/server/stkhsurvey/stkh.R", local = TRUE)
  ##-- environmental ----
  source("tabs/server/environcal/scope3ghg.R", local = TRUE)
  source("tabs/server/environcal/energyinkwh.R", local = TRUE)
  ##-- social ----
  source("tabs/server/socialcal/soclabor1.R", local = TRUE)
  source("tabs/server/socialcal/socturnover1.R", local = TRUE)
  source("tabs/server/socialcal/soclaborbyregion.R", local = TRUE)
  source("tabs/server/socialcal/soctraining.R", local = TRUE)
  #opr_supplier map
  source("tabs/server/operations/showsuppmap.R", local = TRUE)
  
})