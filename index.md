---
title       : Developing Data Products Project
subtitle    : Presentation on my Shiny App named TwinCitiesPop
author      : Sean Molloy
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

# Application Description

This Shiny Application shows the growth of the Minnesota Twin Cites Counties. 

The user chooses to examine Population or Household data. The user also chooses which Year we should start with.
The values for each county are adjusted by subtracting the start year's value from all the other data. 

Two Tabs are provided. The 'Growth' tab shows the numerical increase since the chosen base year. The 'Totals' tab shows the Total values since the chosen year.

The URL for the application is <a href="http://seanm95.shinyapps.io/TwinCitiesPop">http://seanm95.shinyapps.io/TwinCitiesPop</a>

Slide 3 shows the application with the 'Growth' tab shown.

Slide 4 shows the application with the 'Totals' tab shown

Slide 5 provides an explanation of where the data came from.

---
# Application with the 'Growth' tab shown
<img height=480 width=900 src="assets\img\Growth.png"></img>

---
# Application with the 'Totals' tab shown
<img height=480 width=900 src="assets\img\Totals.png"></img>

---
# Where did then data come from?

The data used came from the <a href="http://metrocouncil.org/">Minnesota Metropolitan Council</a>. 
The Council's data download page is at 
<a href="http://stats.metc.state.mn.us/data_download/DD_start.aspx">http://stats.metc.state.mn.us/data_download/DD_start.aspx</a>. 
The Population data itself originated from the US Census Bureau. 

A summary of the data used follows:

```r
summary(pop[,c("CO_NAME","YEAR","POPULATION","HOUSEHOLDS")])
```

```
##               CO_NAME        YEAR        POPULATION        HOUSEHOLDS    
##  Anoka County     :17   Min.   :1970   Min.   :  28331   Min.   :  7937  
##  Carver County    :17   1st Qu.:2001   1st Qu.: 126118   1st Qu.: 41881  
##  Dakota County    :17   Median :2005   Median : 308171   Median :110733  
##  Hennepin County  :17   Mean   :2002   Mean   : 382379   Mean   :147599  
##  Ramsey County    :17   3rd Qu.:2009   3rd Qu.: 509725   3rd Qu.:201624  
##  Scott County     :17   Max.   :2013   Max.   :1195058   Max.   :491535  
##  Washington County:17
```


