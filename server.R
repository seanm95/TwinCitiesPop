
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(scales)

pop <- read.csv("data-population.csv")


shinyServer(function(input, output) {

  output$popPlotGrowth <- renderPlot({

  if (input$subjectChoice == "Households")
      pop_selected <- pop[,c("CO_NAME","YEAR","HOUSEHOLDS")]
  else  # Population is the default
      pop_selected <- pop[,c("CO_NAME","YEAR","POPULATION")]
  
  # set numeric variable name to Xnum
  names(pop_selected) <- c("CO_NAME","YEAR","Xnum")
  
  # Only include data from the absolute year chosen
  pop_selected_abs <- pop_selected[pop_selected[,"YEAR"]>=input$absYear,]
  # do delta calculation for absolute year
  # county value for any year = county value minus county value for selected absolute year
  for( co_name in unique(pop_selected_abs$CO_NAME))
      { 
          pop_selected_abs[pop_selected_abs[,"CO_NAME"]==co_name,"XnumBegin"] <-
              pop_selected_abs[pop_selected_abs[,"CO_NAME"]==co_name,"Xnum"] -
              pop_selected_abs[pop_selected_abs[,"CO_NAME"]==co_name & pop_selected_abs[,"YEAR"]==input$absYear,"Xnum"] 
      }
   
  # select 2013 data for geom_text in ggplot, so label on graph appears just once for last value
  pop_selected_2013 <- pop_selected_abs[pop_selected_abs[,"YEAR"]=="2013",]
  # Take " County" out of name to shorten label
  pop_selected_2013[,"CO_NAME"] <- sub(" County","", pop_selected_2013[,"CO_NAME"] )
  
  # Construct graph
   gabs <- ggplot( pop_selected_abs, aes(YEAR, XnumBegin))
   gabs <- gabs + geom_point(aes(colour=CO_NAME)) + geom_line(aes(colour=CO_NAME)) + labs(title =
    paste("Twin Cities", input$subjectChoice, "Growth by County since", input$absYear)) + 
       labs(x="Year") + labs(y=paste("Absolute", input$subjectChoice, "Growth"))
   gabs <- gabs + geom_text(aes(label=CO_NAME, size=6, alpha=2, x=2012.5, group=NULL, parse=T, position="Jitter"),
                            data=pop_selected_2013, show_guide=F)
   gabs <- gabs + scale_y_continuous(labels = comma)
   print(gabs)
   
   })

  output$popPlotTotals <- renderPlot({
      
      if (input$subjectChoice == "Households")
          pop_selected <- pop[,c("CO_NAME","YEAR","HOUSEHOLDS")]
      else  # Population is the default
          pop_selected <- pop[,c("CO_NAME","YEAR","POPULATION")]
      
      # set numeric variable name to Xnum
      names(pop_selected) <- c("CO_NAME","YEAR","Xnum")
      
      # Only include data from the absolute year chosen
      pop_selected_abs <- pop_selected[pop_selected[,"YEAR"]>=input$absYear,]
      
      # select 2013 data for geom_text in ggplot, so label on graph appears just once for last value
      pop_selected_2013 <- pop_selected_abs[pop_selected_abs[,"YEAR"]=="2013",]
      # Take " County" out of name to shorten label
      pop_selected_2013[,"CO_NAME"] <- sub(" County","", pop_selected_2013[,"CO_NAME"] )
      
      # Construct graph
      gabs <- ggplot( pop_selected_abs, aes(YEAR, Xnum))
      gabs <- gabs + geom_point(aes(colour=CO_NAME)) + geom_line(aes(colour=CO_NAME)) + labs(title =
                                                                                                 paste("Twin Cities", input$subjectChoice, "Totals by County since", input$absYear)) + 
          labs(x="Year") + labs(y=paste(input$subjectChoice, "Totals"))
      gabs <- gabs + geom_text(aes(label=CO_NAME, size=6, alpha=2, x=2012.5, group=NULL, parse=T, position="Jitter"),
                               data=pop_selected_2013, show_guide=F)
      gabs <- gabs + scale_y_continuous(labels = comma)
      print(gabs)
      
  })
  
})
