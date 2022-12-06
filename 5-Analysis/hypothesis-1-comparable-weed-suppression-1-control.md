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
<template id="24a5fb54-660b-4e0b-b1de-9e476b2326f0"><style>
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
</style><div class="tabwid"><style>.cl-e0072b14{}.cl-e0010766{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-e0039b5c{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-e003abec{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-e003abf6{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-e003abf7{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-dffca2de{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}</style><table class='cl-e0072b14'>

```

<caption>(\#tab:ancova-weeds)<span class="cl-dffca2de">ANCOVA for weed biomass response. Weed biomass was transformed with ln(x + 1) to maintain data normality.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><td class="cl-e003abec"><p class="cl-e0039b5c"><span class="cl-e0010766">model term             </span></p></td><td class="cl-e003abec"><p class="cl-e0039b5c"><span class="cl-e0010766">df1</span></p></td><td class="cl-e003abec"><p class="cl-e0039b5c"><span class="cl-e0010766">df2</span></p></td><td class="cl-e003abec"><p class="cl-e0039b5c"><span class="cl-e0010766">F.ratio</span></p></td><td class="cl-e003abec"><p class="cl-e0039b5c"><span class="cl-e0010766">p.value</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-e003abf6"><p class="cl-e0039b5c"><span class="cl-e0010766">block                  </span></p></td><td class="cl-e003abf6"><p class="cl-e0039b5c"><span class="cl-e0010766">  3</span></p></td><td class="cl-e003abf6"><p class="cl-e0039b5c"><span class="cl-e0010766"> 32</span></p></td><td class="cl-e003abf6"><p class="cl-e0039b5c"><span class="cl-e0010766">  7.342</span></p></td><td class="cl-e003abf6"><p class="cl-e0039b5c"><span class="cl-e0010766"> 0.0007</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-e003abf6"><p class="cl-e0039b5c"><span class="cl-e0010766">species.y              </span></p></td><td class="cl-e003abf6"><p class="cl-e0039b5c"><span class="cl-e0010766"> 11</span></p></td><td class="cl-e003abf6"><p class="cl-e0039b5c"><span class="cl-e0010766"> 32</span></p></td><td class="cl-e003abf6"><p class="cl-e0039b5c"><span class="cl-e0010766">  1.541</span></p></td><td class="cl-e003abf6"><p class="cl-e0039b5c"><span class="cl-e0010766"> 0.1652</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-e003abf7"><p class="cl-e0039b5c"><span class="cl-e0010766">crop.biomass.g.per.sq.m</span></p></td><td class="cl-e003abf7"><p class="cl-e0039b5c"><span class="cl-e0010766">  1</span></p></td><td class="cl-e003abf7"><p class="cl-e0039b5c"><span class="cl-e0010766"> 32</span></p></td><td class="cl-e003abf7"><p class="cl-e0039b5c"><span class="cl-e0010766"> 13.111</span></p></td><td class="cl-e003abf7"><p class="cl-e0039b5c"><span class="cl-e0010766"> 0.0010</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="55685833-d381-4295-b34d-3fe87ea8e36d"></div>
<script>
var dest = document.getElementById("55685833-d381-4295-b34d-3fe87ea8e36d");
var template = document.getElementById("24a5fb54-660b-4e0b-b1de-9e476b2326f0");
var caption = template.content.querySelector("caption");
var fantome = dest.attachShadow({mode: 'open'});
var templateContent = template.content;
fantome.appendChild(templateContent);
</script>

```

```{=html}
<template id="dd687ed3-e048-4757-a6de-5c9e0c54a17b"><style>
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
</style><div class="tabwid"><style>.cl-e01c91f2{}.cl-e0119c66{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-e013a4ac{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-e013b0c8{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-e013b0d2{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-e013b0dc{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-e00e948a{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}</style><table class='cl-e01c91f2'>

```

<caption>(\#tab:ancova-crops)<span class="cl-e00e948a">ANCOVA for crop biomass response. Crop biomass was analyzed on the original scale.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><td class="cl-e013b0c8"><p class="cl-e013a4ac"><span class="cl-e0119c66">model term             </span></p></td><td class="cl-e013b0c8"><p class="cl-e013a4ac"><span class="cl-e0119c66">df1</span></p></td><td class="cl-e013b0c8"><p class="cl-e013a4ac"><span class="cl-e0119c66">df2</span></p></td><td class="cl-e013b0c8"><p class="cl-e013a4ac"><span class="cl-e0119c66">F.ratio</span></p></td><td class="cl-e013b0c8"><p class="cl-e013a4ac"><span class="cl-e0119c66">p.value</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-e013b0d2"><p class="cl-e013a4ac"><span class="cl-e0119c66">block                  </span></p></td><td class="cl-e013b0d2"><p class="cl-e013a4ac"><span class="cl-e0119c66">  3</span></p></td><td class="cl-e013b0d2"><p class="cl-e013a4ac"><span class="cl-e0119c66"> 29</span></p></td><td class="cl-e013b0d2"><p class="cl-e013a4ac"><span class="cl-e0119c66">  7.072</span></p></td><td class="cl-e013b0d2"><p class="cl-e013a4ac"><span class="cl-e0119c66"> 0.0010</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-e013b0d2"><p class="cl-e013a4ac"><span class="cl-e0119c66">species.y              </span></p></td><td class="cl-e013b0d2"><p class="cl-e013a4ac"><span class="cl-e0119c66"> 10</span></p></td><td class="cl-e013b0d2"><p class="cl-e013a4ac"><span class="cl-e0119c66"> 29</span></p></td><td class="cl-e013b0d2"><p class="cl-e013a4ac"><span class="cl-e0119c66"> 10.365</span></p></td><td class="cl-e013b0d2"><p class="cl-e013a4ac"><span class="cl-e0119c66"> &lt;.0001</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-e013b0dc"><p class="cl-e013a4ac"><span class="cl-e0119c66">weed.biomass.g.per.sq.m</span></p></td><td class="cl-e013b0dc"><p class="cl-e013a4ac"><span class="cl-e0119c66">  1</span></p></td><td class="cl-e013b0dc"><p class="cl-e013a4ac"><span class="cl-e0119c66"> 29</span></p></td><td class="cl-e013b0dc"><p class="cl-e013a4ac"><span class="cl-e0119c66">  8.706</span></p></td><td class="cl-e013b0dc"><p class="cl-e013a4ac"><span class="cl-e0119c66"> 0.0062</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="4ad846f2-a397-49ad-9db7-9943a29458f8"></div>
<script>
var dest = document.getElementById("4ad846f2-a397-49ad-9db7-9943a29458f8");
var template = document.getElementById("dd687ed3-e048-4757-a6de-5c9e0c54a17b");
var caption = template.content.querySelector("caption");
var fantome = dest.attachShadow({mode: 'open'});
var templateContent = template.content;
fantome.appendChild(templateContent);
</script>

```





```{=html}
<template id="ae09ba58-4002-4143-9f7c-a317b42c5e44"><style>
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
</style><div class="tabwid"><style>.cl-e03c812e{}.cl-e0365d8a{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-e0394e78{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-e0395a9e{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-e0395aa8{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-e0395aa9{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-e033642c{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}</style><table class='cl-e03c812e'>

```

<caption>(\#tab:anova-weeds)<span class="cl-e033642c">ANOVA for weed biomass response. Weed biomass was transformed with ln(x + 1) to maintain data normality.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><td class="cl-e0395a9e"><p class="cl-e0394e78"><span class="cl-e0365d8a">model term</span></p></td><td class="cl-e0395a9e"><p class="cl-e0394e78"><span class="cl-e0365d8a">df1</span></p></td><td class="cl-e0395a9e"><p class="cl-e0394e78"><span class="cl-e0365d8a">df2</span></p></td><td class="cl-e0395a9e"><p class="cl-e0394e78"><span class="cl-e0365d8a">F.ratio</span></p></td><td class="cl-e0395a9e"><p class="cl-e0394e78"><span class="cl-e0365d8a">p.value</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-e0395aa8"><p class="cl-e0394e78"><span class="cl-e0365d8a">block     </span></p></td><td class="cl-e0395aa8"><p class="cl-e0394e78"><span class="cl-e0365d8a">  3</span></p></td><td class="cl-e0395aa8"><p class="cl-e0394e78"><span class="cl-e0365d8a"> 33</span></p></td><td class="cl-e0395aa8"><p class="cl-e0394e78"><span class="cl-e0365d8a">  3.264</span></p></td><td class="cl-e0395aa8"><p class="cl-e0394e78"><span class="cl-e0365d8a"> 0.0335</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-e0395aa9"><p class="cl-e0394e78"><span class="cl-e0365d8a">species.y </span></p></td><td class="cl-e0395aa9"><p class="cl-e0394e78"><span class="cl-e0365d8a"> 11</span></p></td><td class="cl-e0395aa9"><p class="cl-e0394e78"><span class="cl-e0365d8a"> 33</span></p></td><td class="cl-e0395aa9"><p class="cl-e0394e78"><span class="cl-e0365d8a">  1.869</span></p></td><td class="cl-e0395aa9"><p class="cl-e0394e78"><span class="cl-e0365d8a"> 0.0814</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="ae86b50d-f8f0-475f-b9a9-f46665955c0f"></div>
<script>
var dest = document.getElementById("ae86b50d-f8f0-475f-b9a9-f46665955c0f");
var template = document.getElementById("ae09ba58-4002-4143-9f7c-a317b42c5e44");
var caption = template.content.querySelector("caption");
var fantome = dest.attachShadow({mode: 'open'});
var templateContent = template.content;
fantome.appendChild(templateContent);
</script>

```



![](hypothesis-1-comparable-weed-suppression-1-control_files/figure-html/anova-weeds-1.jpeg)<!-- -->

```{=html}
<template id="6c4096de-33c8-4f77-a7b4-688091c22092"><style>
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
</style><div class="tabwid"><style>.cl-e0c6bc22{}.cl-e0c1bfec{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-e0c3d796{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-e0c3e560{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-e0c3e56a{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-e0c3e56b{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-e0bf1a4e{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}</style><table class='cl-e0c6bc22'>

```

<caption>(\#tab:anova-crops)<span class="cl-e0bf1a4e">ANOVA for crop biomass response. Crop biomass was analyzed on the original scale.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><td class="cl-e0c3e560"><p class="cl-e0c3d796"><span class="cl-e0c1bfec">model term</span></p></td><td class="cl-e0c3e560"><p class="cl-e0c3d796"><span class="cl-e0c1bfec">df1</span></p></td><td class="cl-e0c3e560"><p class="cl-e0c3d796"><span class="cl-e0c1bfec">df2</span></p></td><td class="cl-e0c3e560"><p class="cl-e0c3d796"><span class="cl-e0c1bfec">F.ratio</span></p></td><td class="cl-e0c3e560"><p class="cl-e0c3d796"><span class="cl-e0c1bfec">p.value</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-e0c3e56a"><p class="cl-e0c3d796"><span class="cl-e0c1bfec">block     </span></p></td><td class="cl-e0c3e56a"><p class="cl-e0c3d796"><span class="cl-e0c1bfec">  3</span></p></td><td class="cl-e0c3e56a"><p class="cl-e0c3d796"><span class="cl-e0c1bfec"> 30</span></p></td><td class="cl-e0c3e56a"><p class="cl-e0c3d796"><span class="cl-e0c1bfec">  3.846</span></p></td><td class="cl-e0c3e56a"><p class="cl-e0c3d796"><span class="cl-e0c1bfec"> 0.0193</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-e0c3e56b"><p class="cl-e0c3d796"><span class="cl-e0c1bfec">species.y </span></p></td><td class="cl-e0c3e56b"><p class="cl-e0c3d796"><span class="cl-e0c1bfec"> 10</span></p></td><td class="cl-e0c3e56b"><p class="cl-e0c3d796"><span class="cl-e0c1bfec"> 30</span></p></td><td class="cl-e0c3e56b"><p class="cl-e0c3d796"><span class="cl-e0c1bfec"> 10.793</span></p></td><td class="cl-e0c3e56b"><p class="cl-e0c3d796"><span class="cl-e0c1bfec"> &lt;.0001</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="1918a1dc-d3d7-4e69-af20-61977d97f4e9"></div>
<script>
var dest = document.getElementById("1918a1dc-d3d7-4e69-af20-61977d97f4e9");
var template = document.getElementById("6c4096de-33c8-4f77-a7b4-688091c22092");
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
