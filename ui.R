
#
# Minnesota USA, Twin Cities Population/Household Growth by County
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Minnesota USA, Twin Cities Population/Household Growth by County"),

  p("This Shiny Application shows the growth of the Minnesota Twin Cites Counties. Choose whether you wish to examine Population or Household data. Also choose which Year we should start with."),
  p("Two Tabs are provided. The 'Growth' tab shows the numerical increase since the chosen base year. The 'Totals' tab shows the Total values since the chosen year."),
  sidebarLayout(
    sidebarPanel(
      selectInput("subjectChoice", "Population or Households:",
                  choices=c("Population", "Households"), selected="Population"),
      br(),
      selectInput("absYear", "Start Year:",
                  choices = c("1970","1980","1990","2000","2010"), selected="1970")
    ),
    # Show a plot of the generated distribution
    mainPanel(
        tabsetPanel(
            tabPanel("Growth", plotOutput("popPlotGrowth")),
            tabPanel("Totals", plotOutput("popPlotTotals"))     
        )
    )
  )
))
