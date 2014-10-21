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

The data used came from the <a href="http://metrocouncil.org/">Minnesota Metropolitan Council</a>
<br/>
<p>The Council's data download page is at <a href="http://stats.metc.state.mn.us/data_download/DD_start.aspx">http://stats.metc.state.mn.us/data_download/DD_start.aspx</a></p>
<br/>
The Population data itself originated from the US Census Bureau
<br/>
<br/>
<br/>

These pages were created on

```r
date()
```

```
## [1] "Mon Oct 20 18:15:30 2014"
```


