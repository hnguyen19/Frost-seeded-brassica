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
<template id="ff8c1c8f-692a-4e6b-9679-86eeccf156ff"><style>
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
</style><div class="tabwid"><style>.cl-539243ec{}.cl-538c7fa2{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-538f0b5a{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-538f1d48{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-538f1d5c{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-538f1d5d{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-5388a58a{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}</style><table class='cl-539243ec'>

```

<caption>(\#tab:ancova-weeds)<span class="cl-5388a58a">ANCOVA for weed biomass response. Weed biomass was transformed with ln(x + 1) to maintain data normality.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><td class="cl-538f1d48"><p class="cl-538f0b5a"><span class="cl-538c7fa2">model term             </span></p></td><td class="cl-538f1d48"><p class="cl-538f0b5a"><span class="cl-538c7fa2">df1</span></p></td><td class="cl-538f1d48"><p class="cl-538f0b5a"><span class="cl-538c7fa2">df2</span></p></td><td class="cl-538f1d48"><p class="cl-538f0b5a"><span class="cl-538c7fa2">F.ratio</span></p></td><td class="cl-538f1d48"><p class="cl-538f0b5a"><span class="cl-538c7fa2">p.value</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-538f1d5c"><p class="cl-538f0b5a"><span class="cl-538c7fa2">block                  </span></p></td><td class="cl-538f1d5c"><p class="cl-538f0b5a"><span class="cl-538c7fa2">  3</span></p></td><td class="cl-538f1d5c"><p class="cl-538f0b5a"><span class="cl-538c7fa2"> 32</span></p></td><td class="cl-538f1d5c"><p class="cl-538f0b5a"><span class="cl-538c7fa2">  7.342</span></p></td><td class="cl-538f1d5c"><p class="cl-538f0b5a"><span class="cl-538c7fa2"> 0.0007</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-538f1d5c"><p class="cl-538f0b5a"><span class="cl-538c7fa2">species.y              </span></p></td><td class="cl-538f1d5c"><p class="cl-538f0b5a"><span class="cl-538c7fa2"> 11</span></p></td><td class="cl-538f1d5c"><p class="cl-538f0b5a"><span class="cl-538c7fa2"> 32</span></p></td><td class="cl-538f1d5c"><p class="cl-538f0b5a"><span class="cl-538c7fa2">  1.541</span></p></td><td class="cl-538f1d5c"><p class="cl-538f0b5a"><span class="cl-538c7fa2"> 0.1652</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-538f1d5d"><p class="cl-538f0b5a"><span class="cl-538c7fa2">crop.biomass.g.per.sq.m</span></p></td><td class="cl-538f1d5d"><p class="cl-538f0b5a"><span class="cl-538c7fa2">  1</span></p></td><td class="cl-538f1d5d"><p class="cl-538f0b5a"><span class="cl-538c7fa2"> 32</span></p></td><td class="cl-538f1d5d"><p class="cl-538f0b5a"><span class="cl-538c7fa2"> 13.111</span></p></td><td class="cl-538f1d5d"><p class="cl-538f0b5a"><span class="cl-538c7fa2"> 0.0010</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="8fa8f6ac-eac9-4b9e-bdc1-57e903040eea"></div>
<script>
var dest = document.getElementById("8fa8f6ac-eac9-4b9e-bdc1-57e903040eea");
var template = document.getElementById("ff8c1c8f-692a-4e6b-9679-86eeccf156ff");
var caption = template.content.querySelector("caption");
var fantome = dest.attachShadow({mode: 'open'});
var templateContent = template.content;
fantome.appendChild(templateContent);
</script>

```

```{=html}
<template id="c189c6f4-8bd8-45de-b338-a7211b838cb4"><style>
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
</style><div class="tabwid"><style>.cl-53a532b8{}.cl-53a09f46{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-53a2863a{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-53a291ac{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-53a291ad{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-53a291b6{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-539d870c{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}</style><table class='cl-53a532b8'>

```

<caption>(\#tab:ancova-crops)<span class="cl-539d870c">ANCOVA for crop biomass response. Crop biomass was analyzed on the original scale.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><td class="cl-53a291ac"><p class="cl-53a2863a"><span class="cl-53a09f46">model term             </span></p></td><td class="cl-53a291ac"><p class="cl-53a2863a"><span class="cl-53a09f46">df1</span></p></td><td class="cl-53a291ac"><p class="cl-53a2863a"><span class="cl-53a09f46">df2</span></p></td><td class="cl-53a291ac"><p class="cl-53a2863a"><span class="cl-53a09f46">F.ratio</span></p></td><td class="cl-53a291ac"><p class="cl-53a2863a"><span class="cl-53a09f46">p.value</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-53a291ad"><p class="cl-53a2863a"><span class="cl-53a09f46">block                  </span></p></td><td class="cl-53a291ad"><p class="cl-53a2863a"><span class="cl-53a09f46">  3</span></p></td><td class="cl-53a291ad"><p class="cl-53a2863a"><span class="cl-53a09f46"> 29</span></p></td><td class="cl-53a291ad"><p class="cl-53a2863a"><span class="cl-53a09f46">  7.072</span></p></td><td class="cl-53a291ad"><p class="cl-53a2863a"><span class="cl-53a09f46"> 0.0010</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-53a291ad"><p class="cl-53a2863a"><span class="cl-53a09f46">species.y              </span></p></td><td class="cl-53a291ad"><p class="cl-53a2863a"><span class="cl-53a09f46"> 10</span></p></td><td class="cl-53a291ad"><p class="cl-53a2863a"><span class="cl-53a09f46"> 29</span></p></td><td class="cl-53a291ad"><p class="cl-53a2863a"><span class="cl-53a09f46"> 10.365</span></p></td><td class="cl-53a291ad"><p class="cl-53a2863a"><span class="cl-53a09f46"> &lt;.0001</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-53a291b6"><p class="cl-53a2863a"><span class="cl-53a09f46">weed.biomass.g.per.sq.m</span></p></td><td class="cl-53a291b6"><p class="cl-53a2863a"><span class="cl-53a09f46">  1</span></p></td><td class="cl-53a291b6"><p class="cl-53a2863a"><span class="cl-53a09f46"> 29</span></p></td><td class="cl-53a291b6"><p class="cl-53a2863a"><span class="cl-53a09f46">  8.706</span></p></td><td class="cl-53a291b6"><p class="cl-53a2863a"><span class="cl-53a09f46"> 0.0062</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="055774cb-6fbd-4d9f-8c6a-106bc39a1f5b"></div>
<script>
var dest = document.getElementById("055774cb-6fbd-4d9f-8c6a-106bc39a1f5b");
var template = document.getElementById("c189c6f4-8bd8-45de-b338-a7211b838cb4");
var caption = template.content.querySelector("caption");
var fantome = dest.attachShadow({mode: 'open'});
var templateContent = template.content;
fantome.appendChild(templateContent);
</script>

```





```{=html}
<template id="fbe4b855-f527-43b7-82bb-378bd7a5a321"><style>
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
</style><div class="tabwid"><style>.cl-53c5648e{}.cl-53c0e42c{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-53c2cd82{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-53c2d9a8{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-53c2d9b2{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-53c2d9b3{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-53bde3f8{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}</style><table class='cl-53c5648e'>

```

<caption>(\#tab:anova-weeds)<span class="cl-53bde3f8">ANOVA for weed biomass response. Weed biomass was transformed with ln(x + 1) to maintain data normality.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><td class="cl-53c2d9a8"><p class="cl-53c2cd82"><span class="cl-53c0e42c">model term</span></p></td><td class="cl-53c2d9a8"><p class="cl-53c2cd82"><span class="cl-53c0e42c">df1</span></p></td><td class="cl-53c2d9a8"><p class="cl-53c2cd82"><span class="cl-53c0e42c">df2</span></p></td><td class="cl-53c2d9a8"><p class="cl-53c2cd82"><span class="cl-53c0e42c">F.ratio</span></p></td><td class="cl-53c2d9a8"><p class="cl-53c2cd82"><span class="cl-53c0e42c">p.value</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-53c2d9b2"><p class="cl-53c2cd82"><span class="cl-53c0e42c">block     </span></p></td><td class="cl-53c2d9b2"><p class="cl-53c2cd82"><span class="cl-53c0e42c">  3</span></p></td><td class="cl-53c2d9b2"><p class="cl-53c2cd82"><span class="cl-53c0e42c"> 33</span></p></td><td class="cl-53c2d9b2"><p class="cl-53c2cd82"><span class="cl-53c0e42c">  3.264</span></p></td><td class="cl-53c2d9b2"><p class="cl-53c2cd82"><span class="cl-53c0e42c"> 0.0335</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-53c2d9b3"><p class="cl-53c2cd82"><span class="cl-53c0e42c">species.y </span></p></td><td class="cl-53c2d9b3"><p class="cl-53c2cd82"><span class="cl-53c0e42c"> 11</span></p></td><td class="cl-53c2d9b3"><p class="cl-53c2cd82"><span class="cl-53c0e42c"> 33</span></p></td><td class="cl-53c2d9b3"><p class="cl-53c2cd82"><span class="cl-53c0e42c">  1.869</span></p></td><td class="cl-53c2d9b3"><p class="cl-53c2cd82"><span class="cl-53c0e42c"> 0.0814</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="e7284837-26d9-4565-893e-856d04724849"></div>
<script>
var dest = document.getElementById("e7284837-26d9-4565-893e-856d04724849");
var template = document.getElementById("fbe4b855-f527-43b7-82bb-378bd7a5a321");
var caption = template.content.querySelector("caption");
var fantome = dest.attachShadow({mode: 'open'});
var templateContent = template.content;
fantome.appendChild(templateContent);
</script>

```



![](hypothesis-1-comparable-weed-suppression-1-control_files/figure-html/anova-weeds-1.jpeg)<!-- -->

```{=html}
<template id="123eb4c6-2633-42cd-8d2f-9d37d0fa67ae"><style>
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
</style><div class="tabwid"><style>.cl-5452ec0a{}.cl-544d5ac4{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-5450100c{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-54501fca{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-54501fde{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-54501fe8{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-5449db9c{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}</style><table class='cl-5452ec0a'>

```

<caption>(\#tab:anova-crops)<span class="cl-5449db9c">ANOVA for crop biomass response. Crop biomass was analyzed on the original scale.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><td class="cl-54501fca"><p class="cl-5450100c"><span class="cl-544d5ac4">model term</span></p></td><td class="cl-54501fca"><p class="cl-5450100c"><span class="cl-544d5ac4">df1</span></p></td><td class="cl-54501fca"><p class="cl-5450100c"><span class="cl-544d5ac4">df2</span></p></td><td class="cl-54501fca"><p class="cl-5450100c"><span class="cl-544d5ac4">F.ratio</span></p></td><td class="cl-54501fca"><p class="cl-5450100c"><span class="cl-544d5ac4">p.value</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-54501fde"><p class="cl-5450100c"><span class="cl-544d5ac4">block     </span></p></td><td class="cl-54501fde"><p class="cl-5450100c"><span class="cl-544d5ac4">  3</span></p></td><td class="cl-54501fde"><p class="cl-5450100c"><span class="cl-544d5ac4"> 30</span></p></td><td class="cl-54501fde"><p class="cl-5450100c"><span class="cl-544d5ac4">  3.846</span></p></td><td class="cl-54501fde"><p class="cl-5450100c"><span class="cl-544d5ac4"> 0.0193</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-54501fe8"><p class="cl-5450100c"><span class="cl-544d5ac4">species.y </span></p></td><td class="cl-54501fe8"><p class="cl-5450100c"><span class="cl-544d5ac4"> 10</span></p></td><td class="cl-54501fe8"><p class="cl-5450100c"><span class="cl-544d5ac4"> 30</span></p></td><td class="cl-54501fe8"><p class="cl-5450100c"><span class="cl-544d5ac4"> 10.793</span></p></td><td class="cl-54501fe8"><p class="cl-5450100c"><span class="cl-544d5ac4"> &lt;.0001</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="c6afb508-07a3-4a0a-9da7-767415abcd7d"></div>
<script>
var dest = document.getElementById("c6afb508-07a3-4a0a-9da7-767415abcd7d");
var template = document.getElementById("123eb4c6-2633-42cd-8d2f-9d37d0fa67ae");
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
