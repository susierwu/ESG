observeEvent(input$navbar,{
})

##-- below social is the value for "SOC" tab - not the tab name ----
observeEvent(input$click_mat,{
  updateTabsetPanel(session = session, inputId = "navbar", selected = "mat")
})
observeEvent(input$click_environ,{
  updateTabsetPanel(session = session, inputId = "navbar", selected = "environ")
})
observeEvent(input$click_social,{
  updateTabsetPanel(session = session, inputId = "navbar", selected = "social")    
})

observeEvent(input$click_opr,{
  updateTabsetPanel(session = session, inputId = "navbar", selected = "operation")    
})
