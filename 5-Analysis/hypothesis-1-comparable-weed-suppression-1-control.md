---
output: 
  bookdown::html_document2: 
#  bookdown::pdf_document2:
#  bookdown::word_document2:
    keep_tex: yes
    keep_md: yes
    toc: false
    number_sections: false
#bibliography: NECCC-test.bib
---



Arithmetic means of crop and weed biomass (g/m$^{-2}$) are in Figure \@ref(fig:summ).  
<div class="figure">
<img src="hypothesis-1-comparable-weed-suppression-1-control_files/figure-html/summ-1.jpeg" alt="Arithmetic means of crop and weed biomass."  />
<p class="caption">(\#fig:summ)Arithmetic means of crop and weed biomass.</p>
</div>







### Results  

Crop biomass was the strongest factor affecting weed biomass (Table \@ref(tab:ancova-crops) so a non-linear regression was fitted for crop - weed competition (Figure \@ref(fig:nls-plot)). Collard's weed suppression was distinctive among all the treatments (Table \@ref(tab:anova-crops).   




A nonlinear regression was fitted with $Y = \frac{C}{1 + I_w B_c}$, where  

$Y$ is predicted weed biomass,  
$C$ is weed biomass in the control treatment,   
$I_w$ is an estimated coefficient,    
$B_c$ is crop biomass in cover crop treatment  




```
## 
## Formula: weed.biomass.g.per.sq.m ~ 148/(1 + i.w * crop.biomass.g.per.sq.m)
## 
## Parameters:
##     Estimate Std. Error t value Pr(>|t|)  
## i.w 0.008078   0.003155   2.561   0.0137 *
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 75.39 on 47 degrees of freedom
## 
## Number of iterations to convergence: 6 
## Achieved convergence tolerance: 3.688e-06
```

<div class="figure">
<img src="hypothesis-1-comparable-weed-suppression-1-control_files/figure-html/nls-plot-1.jpeg" alt="Weed suppression from Brassicaceae biomass"  />
<p class="caption">(\#fig:nls-plot)Weed suppression from Brassicaceae biomass</p>
</div>





### Linear model diagnosis 

Weed suppression from different *Brassicacaea* species was comparable among each other and with the control treatments (Table \@ref(tab:ancova-weeds)), even though crop biomass differed by species (Table \@ref(tab:ancova-crops)). 

Using `ggResidpanel` version 0.3.0 (Goode and Rey, 2019) for model diagnosis, no predictable pattern in the plots of residuals vs. predicted values suggests that the analysis models fit the data well (Figures \@ref(fig:diag-crops) and \@ref(fig:diag-weeds)), but AIC values of the ANCOVA models were lower than those of the ANOVA models: 448 vs. 459 for crop responses in ANCOVA vs. ANOVA; and 159 vs. 174 for weed biomass responses in ANCOVA vs ANOVA.   


### Crop biomass in response to treatment and weed biomass 




```r
fsb.crops <- fsb.wide  %>% filter(treatment != "N") # Control treatments had no crop
crops.lm1 <- lm(crop.biomass.g.per.sq.m  ~ as.factor(block) + species.y + weed.biomass.g.per.sq.m, data = fsb.crops)


crops.lm2 <- lm(crop.biomass.g.per.sq.m  ~ as.factor(block) + species.y , data = fsb.crops)
resid_panel(crops.lm2)
```

<div class="figure">
<img src="hypothesis-1-comparable-weed-suppression-1-control_files/figure-html/diag-crops-1.jpeg" alt="Diagnosis plot for the ANCOVA and ANOVA models of crop biomass responses"  />
<p class="caption">(\#fig:diag-crops-1)Diagnosis plot for the ANCOVA and ANOVA models of crop biomass responses</p>
</div>

```r
list(crops.lm1, crops.lm2) %>% 
  lapply(resid_panel, nrow = 2) %>% 
  wrap_plots() +
  plot_annotation(tag_levels = "A")
```

<div class="figure">
<img src="hypothesis-1-comparable-weed-suppression-1-control_files/figure-html/diag-crops-2.jpeg" alt="Diagnosis plot for the ANCOVA and ANOVA models of crop biomass responses"  />
<p class="caption">(\#fig:diag-crops-2)Diagnosis plot for the ANCOVA and ANOVA models of crop biomass responses</p>
</div>

```r
# AIC(crops.lm1, crops.lm2) 448 vs 459
```


### Weed biomass in response to treatment and crop biomass - ANCOVA

```r
weeds.lm1 <- lm(log(weed.biomass.g.per.sq.m + 1) ~ as.factor(block) + species.y + crop.biomass.g.per.sq.m, data = fsb.wide )


weeds.lm2 <- lm(log(weed.biomass.g.per.sq.m + 1) ~ as.factor(block) + species.y , data = fsb.wide )

list(weeds.lm1, weeds.lm2) %>% 
  lapply(resid_panel, nrow = 2) %>% 
  wrap_plots() +
  plot_annotation(tag_levels = "A")
```

<div class="figure">
<img src="hypothesis-1-comparable-weed-suppression-1-control_files/figure-html/diag-weeds-1.jpeg" alt="Diagnosis plot for the linear model of weed biomass responding to treatment and crop biomass"  />
<p class="caption">(\#fig:diag-weeds)Diagnosis plot for the linear model of weed biomass responding to treatment and crop biomass</p>
</div>

```r
# AIC(weeds.lm1, weeds.lm2) 159 vs 174
```

### Linear models results  





```{=html}
<template id="c139e8dc-bbde-484b-bfde-0afcda526799"><style>
.tabwid table{
  border-spacing:0px !important;
  border-collapse:collapse;
  line-height:1;
  margin-left:auto;
  margin-right:auto;
  border-width: 0;
  display: table;
  border-color: transparent;
  caption-side: top;
}
.tabwid-caption-bottom table{
  caption-side: bottom;
}
.tabwid_left table{
  margin-left:0;
}
.tabwid_right table{
  margin-right:0;
}
.tabwid td {
    padding: 0;
}
.tabwid a {
  text-decoration: none;
}
.tabwid thead {
    background-color: transparent;
}
.tabwid tfoot {
    background-color: transparent;
}
.tabwid table tr {
background-color: transparent;
}
.katex-display {
    margin: 0 0 !important;
}
</style><div class="tabwid"><style>.cl-2509d300{}.cl-25046758{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-2506b58a{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-2506c494{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-2506c495{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-2506c49e{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-250089d0{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}</style><table class='cl-2509d300'>

```

<caption>(\#tab:ancova-weeds)<span class="cl-250089d0">ANCOVA for weed biomass response. Weed biomass was transformed with ln(x + 1) to maintain data normality.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><td class="cl-2506c494"><p class="cl-2506b58a"><span class="cl-25046758">model term             </span></p></td><td class="cl-2506c494"><p class="cl-2506b58a"><span class="cl-25046758">df1</span></p></td><td class="cl-2506c494"><p class="cl-2506b58a"><span class="cl-25046758">df2</span></p></td><td class="cl-2506c494"><p class="cl-2506b58a"><span class="cl-25046758">F.ratio</span></p></td><td class="cl-2506c494"><p class="cl-2506b58a"><span class="cl-25046758">p.value</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-2506c495"><p class="cl-2506b58a"><span class="cl-25046758">block                  </span></p></td><td class="cl-2506c495"><p class="cl-2506b58a"><span class="cl-25046758">  3</span></p></td><td class="cl-2506c495"><p class="cl-2506b58a"><span class="cl-25046758"> 32</span></p></td><td class="cl-2506c495"><p class="cl-2506b58a"><span class="cl-25046758">  7.342</span></p></td><td class="cl-2506c495"><p class="cl-2506b58a"><span class="cl-25046758"> 0.0007</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-2506c495"><p class="cl-2506b58a"><span class="cl-25046758">species.y              </span></p></td><td class="cl-2506c495"><p class="cl-2506b58a"><span class="cl-25046758"> 11</span></p></td><td class="cl-2506c495"><p class="cl-2506b58a"><span class="cl-25046758"> 32</span></p></td><td class="cl-2506c495"><p class="cl-2506b58a"><span class="cl-25046758">  1.541</span></p></td><td class="cl-2506c495"><p class="cl-2506b58a"><span class="cl-25046758"> 0.1652</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-2506c49e"><p class="cl-2506b58a"><span class="cl-25046758">crop.biomass.g.per.sq.m</span></p></td><td class="cl-2506c49e"><p class="cl-2506b58a"><span class="cl-25046758">  1</span></p></td><td class="cl-2506c49e"><p class="cl-2506b58a"><span class="cl-25046758"> 32</span></p></td><td class="cl-2506c49e"><p class="cl-2506b58a"><span class="cl-25046758"> 13.111</span></p></td><td class="cl-2506c49e"><p class="cl-2506b58a"><span class="cl-25046758"> 0.0010</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="6d07ba47-3458-4920-99c1-87b228391600"></div>
<script>
var dest = document.getElementById("6d07ba47-3458-4920-99c1-87b228391600");
var template = document.getElementById("c139e8dc-bbde-484b-bfde-0afcda526799");
var caption = template.content.querySelector("caption");
var fantome = dest.attachShadow({mode: 'open'});
var templateContent = template.content;
fantome.appendChild(templateContent);
</script>

```

```{=html}
<template id="3287c2bd-3a53-4b13-911a-ea82f592f508"><style>
.tabwid table{
  border-spacing:0px !important;
  border-collapse:collapse;
  line-height:1;
  margin-left:auto;
  margin-right:auto;
  border-width: 0;
  display: table;
  border-color: transparent;
  caption-side: top;
}
.tabwid-caption-bottom table{
  caption-side: bottom;
}
.tabwid_left table{
  margin-left:0;
}
.tabwid_right table{
  margin-right:0;
}
.tabwid td {
    padding: 0;
}
.tabwid a {
  text-decoration: none;
}
.tabwid thead {
    background-color: transparent;
}
.tabwid tfoot {
    background-color: transparent;
}
.tabwid table tr {
background-color: transparent;
}
.katex-display {
    margin: 0 0 !important;
}
</style><div class="tabwid"><style>.cl-251d09a2{}.cl-2512febc{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-25150e32{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-25151d32{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-25151d3c{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-25151d46{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-2510244e{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}</style><table class='cl-251d09a2'>

```

<caption>(\#tab:ancova-crops)<span class="cl-2510244e">ANCOVA for crop biomass response. Crop biomass was analyzed on the original scale.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><td class="cl-25151d32"><p class="cl-25150e32"><span class="cl-2512febc">model term             </span></p></td><td class="cl-25151d32"><p class="cl-25150e32"><span class="cl-2512febc">df1</span></p></td><td class="cl-25151d32"><p class="cl-25150e32"><span class="cl-2512febc">df2</span></p></td><td class="cl-25151d32"><p class="cl-25150e32"><span class="cl-2512febc">F.ratio</span></p></td><td class="cl-25151d32"><p class="cl-25150e32"><span class="cl-2512febc">p.value</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-25151d3c"><p class="cl-25150e32"><span class="cl-2512febc">block                  </span></p></td><td class="cl-25151d3c"><p class="cl-25150e32"><span class="cl-2512febc">  3</span></p></td><td class="cl-25151d3c"><p class="cl-25150e32"><span class="cl-2512febc"> 29</span></p></td><td class="cl-25151d3c"><p class="cl-25150e32"><span class="cl-2512febc">  7.072</span></p></td><td class="cl-25151d3c"><p class="cl-25150e32"><span class="cl-2512febc"> 0.0010</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-25151d3c"><p class="cl-25150e32"><span class="cl-2512febc">species.y              </span></p></td><td class="cl-25151d3c"><p class="cl-25150e32"><span class="cl-2512febc"> 10</span></p></td><td class="cl-25151d3c"><p class="cl-25150e32"><span class="cl-2512febc"> 29</span></p></td><td class="cl-25151d3c"><p class="cl-25150e32"><span class="cl-2512febc"> 10.365</span></p></td><td class="cl-25151d3c"><p class="cl-25150e32"><span class="cl-2512febc"> &lt;.0001</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-25151d46"><p class="cl-25150e32"><span class="cl-2512febc">weed.biomass.g.per.sq.m</span></p></td><td class="cl-25151d46"><p class="cl-25150e32"><span class="cl-2512febc">  1</span></p></td><td class="cl-25151d46"><p class="cl-25150e32"><span class="cl-2512febc"> 29</span></p></td><td class="cl-25151d46"><p class="cl-25150e32"><span class="cl-2512febc">  8.706</span></p></td><td class="cl-25151d46"><p class="cl-25150e32"><span class="cl-2512febc"> 0.0062</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="4b3ab73b-50a3-4408-9a79-aecd40a080e9"></div>
<script>
var dest = document.getElementById("4b3ab73b-50a3-4408-9a79-aecd40a080e9");
var template = document.getElementById("3287c2bd-3a53-4b13-911a-ea82f592f508");
var caption = template.content.querySelector("caption");
var fantome = dest.attachShadow({mode: 'open'});
var templateContent = template.content;
fantome.appendChild(templateContent);
</script>

```





```{=html}
<template id="440f2e51-0c63-4d6e-aced-47c3ff86ff22"><style>
.tabwid table{
  border-spacing:0px !important;
  border-collapse:collapse;
  line-height:1;
  margin-left:auto;
  margin-right:auto;
  border-width: 0;
  display: table;
  border-color: transparent;
  caption-side: top;
}
.tabwid-caption-bottom table{
  caption-side: bottom;
}
.tabwid_left table{
  margin-left:0;
}
.tabwid_right table{
  margin-right:0;
}
.tabwid td {
    padding: 0;
}
.tabwid a {
  text-decoration: none;
}
.tabwid thead {
    background-color: transparent;
}
.tabwid tfoot {
    background-color: transparent;
}
.tabwid table tr {
background-color: transparent;
}
.katex-display {
    margin: 0 0 !important;
}
</style><div class="tabwid"><style>.cl-253d0dba{}.cl-25375b2c{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-253a27a8{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-253a33a6{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-253a33a7{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-253a33b0{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-253450ee{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}</style><table class='cl-253d0dba'>

```

<caption>(\#tab:anova-weeds)<span class="cl-253450ee">ANOVA for weed biomass response. Weed biomass was transformed with ln(x + 1) to maintain data normality.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><td class="cl-253a33a6"><p class="cl-253a27a8"><span class="cl-25375b2c">model term</span></p></td><td class="cl-253a33a6"><p class="cl-253a27a8"><span class="cl-25375b2c">df1</span></p></td><td class="cl-253a33a6"><p class="cl-253a27a8"><span class="cl-25375b2c">df2</span></p></td><td class="cl-253a33a6"><p class="cl-253a27a8"><span class="cl-25375b2c">F.ratio</span></p></td><td class="cl-253a33a6"><p class="cl-253a27a8"><span class="cl-25375b2c">p.value</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-253a33a7"><p class="cl-253a27a8"><span class="cl-25375b2c">block     </span></p></td><td class="cl-253a33a7"><p class="cl-253a27a8"><span class="cl-25375b2c">  3</span></p></td><td class="cl-253a33a7"><p class="cl-253a27a8"><span class="cl-25375b2c"> 33</span></p></td><td class="cl-253a33a7"><p class="cl-253a27a8"><span class="cl-25375b2c">  3.264</span></p></td><td class="cl-253a33a7"><p class="cl-253a27a8"><span class="cl-25375b2c"> 0.0335</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-253a33b0"><p class="cl-253a27a8"><span class="cl-25375b2c">species.y </span></p></td><td class="cl-253a33b0"><p class="cl-253a27a8"><span class="cl-25375b2c"> 11</span></p></td><td class="cl-253a33b0"><p class="cl-253a27a8"><span class="cl-25375b2c"> 33</span></p></td><td class="cl-253a33b0"><p class="cl-253a27a8"><span class="cl-25375b2c">  1.869</span></p></td><td class="cl-253a33b0"><p class="cl-253a27a8"><span class="cl-25375b2c"> 0.0814</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="9b449cdc-8798-4d11-98e3-9f351c889234"></div>
<script>
var dest = document.getElementById("9b449cdc-8798-4d11-98e3-9f351c889234");
var template = document.getElementById("440f2e51-0c63-4d6e-aced-47c3ff86ff22");
var caption = template.content.querySelector("caption");
var fantome = dest.attachShadow({mode: 'open'});
var templateContent = template.content;
fantome.appendChild(templateContent);
</script>

```



![](hypothesis-1-comparable-weed-suppression-1-control_files/figure-html/anova-weeds-1.jpeg)<!-- -->

```{=html}
<template id="22be171b-10a1-45a9-870a-cc5e491253c5"><style>
.tabwid table{
  border-spacing:0px !important;
  border-collapse:collapse;
  line-height:1;
  margin-left:auto;
  margin-right:auto;
  border-width: 0;
  display: table;
  border-color: transparent;
  caption-side: top;
}
.tabwid-caption-bottom table{
  caption-side: bottom;
}
.tabwid_left table{
  margin-left:0;
}
.tabwid_right table{
  margin-right:0;
}
.tabwid td {
    padding: 0;
}
.tabwid a {
  text-decoration: none;
}
.tabwid thead {
    background-color: transparent;
}
.tabwid tfoot {
    background-color: transparent;
}
.tabwid table tr {
background-color: transparent;
}
.katex-display {
    margin: 0 0 !important;
}
</style><div class="tabwid"><style>.cl-25c68914{}.cl-25c1d216{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-25c3ee84{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-25c3fc8a{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-25c3fc94{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-25c3fc95{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-25bf1cc4{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}</style><table class='cl-25c68914'>

```

<caption>(\#tab:anova-crops)<span class="cl-25bf1cc4">ANOVA for crop biomass response. Crop biomass was analyzed on the original scale.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><td class="cl-25c3fc8a"><p class="cl-25c3ee84"><span class="cl-25c1d216">model term</span></p></td><td class="cl-25c3fc8a"><p class="cl-25c3ee84"><span class="cl-25c1d216">df1</span></p></td><td class="cl-25c3fc8a"><p class="cl-25c3ee84"><span class="cl-25c1d216">df2</span></p></td><td class="cl-25c3fc8a"><p class="cl-25c3ee84"><span class="cl-25c1d216">F.ratio</span></p></td><td class="cl-25c3fc8a"><p class="cl-25c3ee84"><span class="cl-25c1d216">p.value</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-25c3fc94"><p class="cl-25c3ee84"><span class="cl-25c1d216">block     </span></p></td><td class="cl-25c3fc94"><p class="cl-25c3ee84"><span class="cl-25c1d216">  3</span></p></td><td class="cl-25c3fc94"><p class="cl-25c3ee84"><span class="cl-25c1d216"> 30</span></p></td><td class="cl-25c3fc94"><p class="cl-25c3ee84"><span class="cl-25c1d216">  3.846</span></p></td><td class="cl-25c3fc94"><p class="cl-25c3ee84"><span class="cl-25c1d216"> 0.0193</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-25c3fc95"><p class="cl-25c3ee84"><span class="cl-25c1d216">species.y </span></p></td><td class="cl-25c3fc95"><p class="cl-25c3ee84"><span class="cl-25c1d216"> 10</span></p></td><td class="cl-25c3fc95"><p class="cl-25c3ee84"><span class="cl-25c1d216"> 30</span></p></td><td class="cl-25c3fc95"><p class="cl-25c3ee84"><span class="cl-25c1d216"> 10.793</span></p></td><td class="cl-25c3fc95"><p class="cl-25c3ee84"><span class="cl-25c1d216"> &lt;.0001</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="91e0f30a-d065-4ea0-8565-c67bde89ec25"></div>
<script>
var dest = document.getElementById("91e0f30a-d065-4ea0-8565-c67bde89ec25");
var template = document.getElementById("22be171b-10a1-45a9-870a-cc5e491253c5");
var caption = template.content.querySelector("caption");
var fantome = dest.attachShadow({mode: 'open'});
var templateContent = template.content;
fantome.appendChild(templateContent);
</script>

```




Estimated marginal means of weed and crop biomass in each treatment are shown in Figures \@ref(fig:weed-contrast) and \@ref(fig:crop-contrast).    


<div class="figure">
<img src="hypothesis-1-comparable-weed-suppression-1-control_files/figure-html/weed-contrast-1.jpeg" alt="Estimated marginal means of weed biomass (back transformed from ln(x +1)). The error bars represent 1 sd on each side."  />
<p class="caption">(\#fig:weed-contrast)Estimated marginal means of weed biomass (back transformed from ln(x +1)). The error bars represent 1 sd on each side.</p>
</div>




<div class="figure">
<img src="hypothesis-1-comparable-weed-suppression-1-control_files/figure-html/crop-contrast-1.jpeg" alt="Estimated marginal means of crop biomass. The error bars represent 1 sd on each side."  />
<p class="caption">(\#fig:crop-contrast)Estimated marginal means of crop biomass. The error bars represent 1 sd on each side.</p>
</div>

The arrow plots below (Figures \@ref(fig:weed-emmip) and \@ref(fig:crop-emmip)) convey the same information with the bar charts, but are quicker to make. 

<div class="figure">
<img src="hypothesis-1-comparable-weed-suppression-1-control_files/figure-html/weed-emmip-1.jpeg" alt="Estimated marginal means of weed biomass (back transformed from ln(x +1)). The black dots are the estimated marginal means. The blue bars indicate the estimated 95% confidence intervals. The arrows indicate whether two estimated means were significantly different. Overlapping arrows means non-significant difference."  />
<p class="caption">(\#fig:weed-emmip)Estimated marginal means of weed biomass (back transformed from ln(x +1)). The black dots are the estimated marginal means. The blue bars indicate the estimated 95% confidence intervals. The arrows indicate whether two estimated means were significantly different. Overlapping arrows means non-significant difference.</p>
</div>

<div class="figure">
<img src="hypothesis-1-comparable-weed-suppression-1-control_files/figure-html/crop-emmip-1.jpeg" alt="Estimated marginal means of crop biomass. The blue bars indicate the estimated 95% confidence intervals. The black dots are the estimated marginal means. The arrows indicate whether two estimated means were significantly different. Overlapping arrows means non-significant difference."  />
<p class="caption">(\#fig:crop-emmip)Estimated marginal means of crop biomass. The blue bars indicate the estimated 95% confidence intervals. The black dots are the estimated marginal means. The arrows indicate whether two estimated means were significantly different. Overlapping arrows means non-significant difference.</p>
</div>
