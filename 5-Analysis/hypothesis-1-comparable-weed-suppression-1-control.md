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


<div class="figure">
<img src="hypothesis-1-comparable-weed-suppression-1-control_files/figure-html/nls-plot-labeled-1.jpeg" alt="Weed suppression from Brassicaceae biomass"  />
<p class="caption">(\#fig:nls-plot-labeled)Weed suppression from Brassicaceae biomass</p>
</div>

<div class="figure">
<img src="hypothesis-1-comparable-weed-suppression-1-control_files/figure-html/nls-plot-labeled2-1.jpeg" alt="Weed suppression from Brassicaceae biomass"  />
<p class="caption">(\#fig:nls-plot-labeled2)Weed suppression from Brassicaceae biomass</p>
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
<template id="ed30f562-48c2-4c53-90ec-6d44c8a1376e"><style>
.tabwid table{
  border-spacing:0px !important;
  border-collapse:collapse;
  line-height:1;
  margin-left:auto;
  margin-right:auto;
  border-width: 0;
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
.tabwid td, .tabwid th {
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
</style><div class="tabwid"><style>.cl-0e07adf0{}.cl-0dffd2ec{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-0e024f86{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-0e026174{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-0e02617e{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-0e02617f{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-0e07adf0'>

```

<caption>(\#tab:ancova-weeds)<span>ANCOVA for weed biomass response. Weed biomass was transformed with ln(x + 1) to maintain data normality.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><th class="cl-0e026174"><p class="cl-0e024f86"><span class="cl-0dffd2ec">model term             </span></p></th><th class="cl-0e026174"><p class="cl-0e024f86"><span class="cl-0dffd2ec">df1</span></p></th><th class="cl-0e026174"><p class="cl-0e024f86"><span class="cl-0dffd2ec">df2</span></p></th><th class="cl-0e026174"><p class="cl-0e024f86"><span class="cl-0dffd2ec">F.ratio</span></p></th><th class="cl-0e026174"><p class="cl-0e024f86"><span class="cl-0dffd2ec">p.value</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-0e02617e"><p class="cl-0e024f86"><span class="cl-0dffd2ec">block                  </span></p></td><td class="cl-0e02617e"><p class="cl-0e024f86"><span class="cl-0dffd2ec">  3</span></p></td><td class="cl-0e02617e"><p class="cl-0e024f86"><span class="cl-0dffd2ec"> 32</span></p></td><td class="cl-0e02617e"><p class="cl-0e024f86"><span class="cl-0dffd2ec">  7.342</span></p></td><td class="cl-0e02617e"><p class="cl-0e024f86"><span class="cl-0dffd2ec"> 0.0007</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-0e02617e"><p class="cl-0e024f86"><span class="cl-0dffd2ec">species.y              </span></p></td><td class="cl-0e02617e"><p class="cl-0e024f86"><span class="cl-0dffd2ec"> 11</span></p></td><td class="cl-0e02617e"><p class="cl-0e024f86"><span class="cl-0dffd2ec"> 32</span></p></td><td class="cl-0e02617e"><p class="cl-0e024f86"><span class="cl-0dffd2ec">  1.541</span></p></td><td class="cl-0e02617e"><p class="cl-0e024f86"><span class="cl-0dffd2ec"> 0.1652</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-0e02617f"><p class="cl-0e024f86"><span class="cl-0dffd2ec">crop.biomass.g.per.sq.m</span></p></td><td class="cl-0e02617f"><p class="cl-0e024f86"><span class="cl-0dffd2ec">  1</span></p></td><td class="cl-0e02617f"><p class="cl-0e024f86"><span class="cl-0dffd2ec"> 32</span></p></td><td class="cl-0e02617f"><p class="cl-0e024f86"><span class="cl-0dffd2ec"> 13.111</span></p></td><td class="cl-0e02617f"><p class="cl-0e024f86"><span class="cl-0dffd2ec"> 0.0010</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="0711f9c4-6178-462a-bb30-5819572d86c9"></div>
<script>
var dest = document.getElementById("0711f9c4-6178-462a-bb30-5819572d86c9");
var template = document.getElementById("ed30f562-48c2-4c53-90ec-6d44c8a1376e");
var fantome = dest.attachShadow({mode: 'open'});
var templateContent = template.content;
fantome.appendChild(templateContent);
</script>

```

```{=html}
<template id="95527796-4bad-4cec-bcb1-c100e70543bf"><style>
.tabwid table{
  border-spacing:0px !important;
  border-collapse:collapse;
  line-height:1;
  margin-left:auto;
  margin-right:auto;
  border-width: 0;
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
.tabwid td, .tabwid th {
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
</style><div class="tabwid"><style>.cl-0e1797ec{}.cl-0e0fed80{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-0e12a4f8{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-0e12b42a{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-0e12b434{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-0e12b435{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-0e1797ec'>

```

<caption>(\#tab:ancova-crops)<span>ANCOVA for crop biomass response. Crop biomass was analyzed on the original scale.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><th class="cl-0e12b42a"><p class="cl-0e12a4f8"><span class="cl-0e0fed80">model term             </span></p></th><th class="cl-0e12b42a"><p class="cl-0e12a4f8"><span class="cl-0e0fed80">df1</span></p></th><th class="cl-0e12b42a"><p class="cl-0e12a4f8"><span class="cl-0e0fed80">df2</span></p></th><th class="cl-0e12b42a"><p class="cl-0e12a4f8"><span class="cl-0e0fed80">F.ratio</span></p></th><th class="cl-0e12b42a"><p class="cl-0e12a4f8"><span class="cl-0e0fed80">p.value</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-0e12b434"><p class="cl-0e12a4f8"><span class="cl-0e0fed80">block                  </span></p></td><td class="cl-0e12b434"><p class="cl-0e12a4f8"><span class="cl-0e0fed80">  3</span></p></td><td class="cl-0e12b434"><p class="cl-0e12a4f8"><span class="cl-0e0fed80"> 29</span></p></td><td class="cl-0e12b434"><p class="cl-0e12a4f8"><span class="cl-0e0fed80">  7.072</span></p></td><td class="cl-0e12b434"><p class="cl-0e12a4f8"><span class="cl-0e0fed80"> 0.0010</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-0e12b434"><p class="cl-0e12a4f8"><span class="cl-0e0fed80">species.y              </span></p></td><td class="cl-0e12b434"><p class="cl-0e12a4f8"><span class="cl-0e0fed80"> 10</span></p></td><td class="cl-0e12b434"><p class="cl-0e12a4f8"><span class="cl-0e0fed80"> 29</span></p></td><td class="cl-0e12b434"><p class="cl-0e12a4f8"><span class="cl-0e0fed80"> 10.365</span></p></td><td class="cl-0e12b434"><p class="cl-0e12a4f8"><span class="cl-0e0fed80"> &lt;.0001</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-0e12b435"><p class="cl-0e12a4f8"><span class="cl-0e0fed80">weed.biomass.g.per.sq.m</span></p></td><td class="cl-0e12b435"><p class="cl-0e12a4f8"><span class="cl-0e0fed80">  1</span></p></td><td class="cl-0e12b435"><p class="cl-0e12a4f8"><span class="cl-0e0fed80"> 29</span></p></td><td class="cl-0e12b435"><p class="cl-0e12a4f8"><span class="cl-0e0fed80">  8.706</span></p></td><td class="cl-0e12b435"><p class="cl-0e12a4f8"><span class="cl-0e0fed80"> 0.0062</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="11b729c7-af5c-49f3-bc39-228327fb668f"></div>
<script>
var dest = document.getElementById("11b729c7-af5c-49f3-bc39-228327fb668f");
var template = document.getElementById("95527796-4bad-4cec-bcb1-c100e70543bf");
var fantome = dest.attachShadow({mode: 'open'});
var templateContent = template.content;
fantome.appendChild(templateContent);
</script>

```





```{=html}
<template id="c2743d9a-34f1-4529-91fa-4b8f8784daf3"><style>
.tabwid table{
  border-spacing:0px !important;
  border-collapse:collapse;
  line-height:1;
  margin-left:auto;
  margin-right:auto;
  border-width: 0;
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
.tabwid td, .tabwid th {
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
</style><div class="tabwid"><style>.cl-0e4189c6{}.cl-0e38a0ae{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-0e3c38f4{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-0e3c49d4{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-0e3c49de{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-0e3c49e8{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-0e4189c6'>

```

<caption>(\#tab:anova-weeds)<span>ANOVA for weed biomass response. Weed biomass was transformed with ln(x + 1) to maintain data normality.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><th class="cl-0e3c49d4"><p class="cl-0e3c38f4"><span class="cl-0e38a0ae">model term</span></p></th><th class="cl-0e3c49d4"><p class="cl-0e3c38f4"><span class="cl-0e38a0ae">df1</span></p></th><th class="cl-0e3c49d4"><p class="cl-0e3c38f4"><span class="cl-0e38a0ae">df2</span></p></th><th class="cl-0e3c49d4"><p class="cl-0e3c38f4"><span class="cl-0e38a0ae">F.ratio</span></p></th><th class="cl-0e3c49d4"><p class="cl-0e3c38f4"><span class="cl-0e38a0ae">p.value</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-0e3c49de"><p class="cl-0e3c38f4"><span class="cl-0e38a0ae">block     </span></p></td><td class="cl-0e3c49de"><p class="cl-0e3c38f4"><span class="cl-0e38a0ae">  3</span></p></td><td class="cl-0e3c49de"><p class="cl-0e3c38f4"><span class="cl-0e38a0ae"> 33</span></p></td><td class="cl-0e3c49de"><p class="cl-0e3c38f4"><span class="cl-0e38a0ae">  3.264</span></p></td><td class="cl-0e3c49de"><p class="cl-0e3c38f4"><span class="cl-0e38a0ae"> 0.0335</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-0e3c49e8"><p class="cl-0e3c38f4"><span class="cl-0e38a0ae">species.y </span></p></td><td class="cl-0e3c49e8"><p class="cl-0e3c38f4"><span class="cl-0e38a0ae"> 11</span></p></td><td class="cl-0e3c49e8"><p class="cl-0e3c38f4"><span class="cl-0e38a0ae"> 33</span></p></td><td class="cl-0e3c49e8"><p class="cl-0e3c38f4"><span class="cl-0e38a0ae">  1.869</span></p></td><td class="cl-0e3c49e8"><p class="cl-0e3c38f4"><span class="cl-0e38a0ae"> 0.0814</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="6682da26-fb45-432f-9b80-8795b59b8b24"></div>
<script>
var dest = document.getElementById("6682da26-fb45-432f-9b80-8795b59b8b24");
var template = document.getElementById("c2743d9a-34f1-4529-91fa-4b8f8784daf3");
var fantome = dest.attachShadow({mode: 'open'});
var templateContent = template.content;
fantome.appendChild(templateContent);
</script>

```



![](hypothesis-1-comparable-weed-suppression-1-control_files/figure-html/anova-weeds-1.jpeg)<!-- -->

```{=html}
<template id="65be1583-f58f-4cd9-a231-567bc95651f2"><style>
.tabwid table{
  border-spacing:0px !important;
  border-collapse:collapse;
  line-height:1;
  margin-left:auto;
  margin-right:auto;
  border-width: 0;
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
.tabwid td, .tabwid th {
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
</style><div class="tabwid"><style>.cl-0ef24e78{}.cl-0eeb73dc{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-0eef15a0{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-0eef218a{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-0eef2194{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-0eef2195{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-0ef24e78'>

```

<caption>(\#tab:anova-crops)<span>ANOVA for crop biomass response. Crop biomass was analyzed on the original scale.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><th class="cl-0eef218a"><p class="cl-0eef15a0"><span class="cl-0eeb73dc">model term</span></p></th><th class="cl-0eef218a"><p class="cl-0eef15a0"><span class="cl-0eeb73dc">df1</span></p></th><th class="cl-0eef218a"><p class="cl-0eef15a0"><span class="cl-0eeb73dc">df2</span></p></th><th class="cl-0eef218a"><p class="cl-0eef15a0"><span class="cl-0eeb73dc">F.ratio</span></p></th><th class="cl-0eef218a"><p class="cl-0eef15a0"><span class="cl-0eeb73dc">p.value</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-0eef2194"><p class="cl-0eef15a0"><span class="cl-0eeb73dc">block     </span></p></td><td class="cl-0eef2194"><p class="cl-0eef15a0"><span class="cl-0eeb73dc">  3</span></p></td><td class="cl-0eef2194"><p class="cl-0eef15a0"><span class="cl-0eeb73dc"> 30</span></p></td><td class="cl-0eef2194"><p class="cl-0eef15a0"><span class="cl-0eeb73dc">  3.846</span></p></td><td class="cl-0eef2194"><p class="cl-0eef15a0"><span class="cl-0eeb73dc"> 0.0193</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-0eef2195"><p class="cl-0eef15a0"><span class="cl-0eeb73dc">species.y </span></p></td><td class="cl-0eef2195"><p class="cl-0eef15a0"><span class="cl-0eeb73dc"> 10</span></p></td><td class="cl-0eef2195"><p class="cl-0eef15a0"><span class="cl-0eeb73dc"> 30</span></p></td><td class="cl-0eef2195"><p class="cl-0eef15a0"><span class="cl-0eeb73dc"> 10.793</span></p></td><td class="cl-0eef2195"><p class="cl-0eef15a0"><span class="cl-0eeb73dc"> &lt;.0001</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="b816ef16-f15f-425a-b95e-68cd44361076"></div>
<script>
var dest = document.getElementById("b816ef16-f15f-425a-b95e-68cd44361076");
var template = document.getElementById("65be1583-f58f-4cd9-a231-567bc95651f2");
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
