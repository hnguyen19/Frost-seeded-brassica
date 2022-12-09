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
<template id="59a32ef8-8adb-43b9-a22b-6a825b43ea6b"><style>
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
</style><div class="tabwid"><style>.cl-cf15e1c2{}.cl-cf0fa438{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-cf1211c8{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-cf12221c{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-cf122226{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-cf122230{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-cf15e1c2'>

```

<caption>(\#tab:ancova-weeds)<span>ANCOVA for weed biomass response. Weed biomass was transformed with ln(x + 1) to maintain data normality.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><th class="cl-cf12221c"><p class="cl-cf1211c8"><span class="cl-cf0fa438">model term             </span></p></th><th class="cl-cf12221c"><p class="cl-cf1211c8"><span class="cl-cf0fa438">df1</span></p></th><th class="cl-cf12221c"><p class="cl-cf1211c8"><span class="cl-cf0fa438">df2</span></p></th><th class="cl-cf12221c"><p class="cl-cf1211c8"><span class="cl-cf0fa438">F.ratio</span></p></th><th class="cl-cf12221c"><p class="cl-cf1211c8"><span class="cl-cf0fa438">p.value</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-cf122226"><p class="cl-cf1211c8"><span class="cl-cf0fa438">block                  </span></p></td><td class="cl-cf122226"><p class="cl-cf1211c8"><span class="cl-cf0fa438">  3</span></p></td><td class="cl-cf122226"><p class="cl-cf1211c8"><span class="cl-cf0fa438"> 32</span></p></td><td class="cl-cf122226"><p class="cl-cf1211c8"><span class="cl-cf0fa438">  7.342</span></p></td><td class="cl-cf122226"><p class="cl-cf1211c8"><span class="cl-cf0fa438"> 0.0007</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-cf122226"><p class="cl-cf1211c8"><span class="cl-cf0fa438">species.y              </span></p></td><td class="cl-cf122226"><p class="cl-cf1211c8"><span class="cl-cf0fa438"> 11</span></p></td><td class="cl-cf122226"><p class="cl-cf1211c8"><span class="cl-cf0fa438"> 32</span></p></td><td class="cl-cf122226"><p class="cl-cf1211c8"><span class="cl-cf0fa438">  1.541</span></p></td><td class="cl-cf122226"><p class="cl-cf1211c8"><span class="cl-cf0fa438"> 0.1652</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-cf122230"><p class="cl-cf1211c8"><span class="cl-cf0fa438">crop.biomass.g.per.sq.m</span></p></td><td class="cl-cf122230"><p class="cl-cf1211c8"><span class="cl-cf0fa438">  1</span></p></td><td class="cl-cf122230"><p class="cl-cf1211c8"><span class="cl-cf0fa438"> 32</span></p></td><td class="cl-cf122230"><p class="cl-cf1211c8"><span class="cl-cf0fa438"> 13.111</span></p></td><td class="cl-cf122230"><p class="cl-cf1211c8"><span class="cl-cf0fa438"> 0.0010</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="2de75b5f-f70c-4a32-911e-925f99d626fd"></div>
<script>
var dest = document.getElementById("2de75b5f-f70c-4a32-911e-925f99d626fd");
var template = document.getElementById("59a32ef8-8adb-43b9-a22b-6a825b43ea6b");
var fantome = dest.attachShadow({mode: 'open'});
var templateContent = template.content;
fantome.appendChild(templateContent);
</script>

```

```{=html}
<template id="d83ea148-4130-40ff-b043-3f54edc196cd"><style>
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
</style><div class="tabwid"><style>.cl-cf24eaa0{}.cl-cf1fd042{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-cf21fa48{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-cf2205e2{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-cf2205ec{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-cf2205f6{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-cf24eaa0'>

```

<caption>(\#tab:ancova-crops)<span>ANCOVA for crop biomass response. Crop biomass was analyzed on the original scale.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><th class="cl-cf2205e2"><p class="cl-cf21fa48"><span class="cl-cf1fd042">model term             </span></p></th><th class="cl-cf2205e2"><p class="cl-cf21fa48"><span class="cl-cf1fd042">df1</span></p></th><th class="cl-cf2205e2"><p class="cl-cf21fa48"><span class="cl-cf1fd042">df2</span></p></th><th class="cl-cf2205e2"><p class="cl-cf21fa48"><span class="cl-cf1fd042">F.ratio</span></p></th><th class="cl-cf2205e2"><p class="cl-cf21fa48"><span class="cl-cf1fd042">p.value</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-cf2205ec"><p class="cl-cf21fa48"><span class="cl-cf1fd042">block                  </span></p></td><td class="cl-cf2205ec"><p class="cl-cf21fa48"><span class="cl-cf1fd042">  3</span></p></td><td class="cl-cf2205ec"><p class="cl-cf21fa48"><span class="cl-cf1fd042"> 29</span></p></td><td class="cl-cf2205ec"><p class="cl-cf21fa48"><span class="cl-cf1fd042">  7.072</span></p></td><td class="cl-cf2205ec"><p class="cl-cf21fa48"><span class="cl-cf1fd042"> 0.0010</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-cf2205ec"><p class="cl-cf21fa48"><span class="cl-cf1fd042">species.y              </span></p></td><td class="cl-cf2205ec"><p class="cl-cf21fa48"><span class="cl-cf1fd042"> 10</span></p></td><td class="cl-cf2205ec"><p class="cl-cf21fa48"><span class="cl-cf1fd042"> 29</span></p></td><td class="cl-cf2205ec"><p class="cl-cf21fa48"><span class="cl-cf1fd042"> 10.365</span></p></td><td class="cl-cf2205ec"><p class="cl-cf21fa48"><span class="cl-cf1fd042"> &lt;.0001</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-cf2205f6"><p class="cl-cf21fa48"><span class="cl-cf1fd042">weed.biomass.g.per.sq.m</span></p></td><td class="cl-cf2205f6"><p class="cl-cf21fa48"><span class="cl-cf1fd042">  1</span></p></td><td class="cl-cf2205f6"><p class="cl-cf21fa48"><span class="cl-cf1fd042"> 29</span></p></td><td class="cl-cf2205f6"><p class="cl-cf21fa48"><span class="cl-cf1fd042">  8.706</span></p></td><td class="cl-cf2205f6"><p class="cl-cf21fa48"><span class="cl-cf1fd042"> 0.0062</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="4ec6fc6c-0d25-4402-851e-8b004c8c6234"></div>
<script>
var dest = document.getElementById("4ec6fc6c-0d25-4402-851e-8b004c8c6234");
var template = document.getElementById("d83ea148-4130-40ff-b043-3f54edc196cd");
var fantome = dest.attachShadow({mode: 'open'});
var templateContent = template.content;
fantome.appendChild(templateContent);
</script>

```





```{=html}
<template id="9a01667a-7c52-4051-964f-18c49edcb94d"><style>
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
</style><div class="tabwid"><style>.cl-cf442744{}.cl-cf3f24f6{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-cf4119e6{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-cf412634{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-cf412635{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-cf41263e{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-cf442744'>

```

<caption>(\#tab:anova-weeds)<span>ANOVA for weed biomass response. Weed biomass was transformed with ln(x + 1) to maintain data normality.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><th class="cl-cf412634"><p class="cl-cf4119e6"><span class="cl-cf3f24f6">model term</span></p></th><th class="cl-cf412634"><p class="cl-cf4119e6"><span class="cl-cf3f24f6">df1</span></p></th><th class="cl-cf412634"><p class="cl-cf4119e6"><span class="cl-cf3f24f6">df2</span></p></th><th class="cl-cf412634"><p class="cl-cf4119e6"><span class="cl-cf3f24f6">F.ratio</span></p></th><th class="cl-cf412634"><p class="cl-cf4119e6"><span class="cl-cf3f24f6">p.value</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-cf412635"><p class="cl-cf4119e6"><span class="cl-cf3f24f6">block     </span></p></td><td class="cl-cf412635"><p class="cl-cf4119e6"><span class="cl-cf3f24f6">  3</span></p></td><td class="cl-cf412635"><p class="cl-cf4119e6"><span class="cl-cf3f24f6"> 33</span></p></td><td class="cl-cf412635"><p class="cl-cf4119e6"><span class="cl-cf3f24f6">  3.264</span></p></td><td class="cl-cf412635"><p class="cl-cf4119e6"><span class="cl-cf3f24f6"> 0.0335</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-cf41263e"><p class="cl-cf4119e6"><span class="cl-cf3f24f6">species.y </span></p></td><td class="cl-cf41263e"><p class="cl-cf4119e6"><span class="cl-cf3f24f6"> 11</span></p></td><td class="cl-cf41263e"><p class="cl-cf4119e6"><span class="cl-cf3f24f6"> 33</span></p></td><td class="cl-cf41263e"><p class="cl-cf4119e6"><span class="cl-cf3f24f6">  1.869</span></p></td><td class="cl-cf41263e"><p class="cl-cf4119e6"><span class="cl-cf3f24f6"> 0.0814</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="d556673d-b0ed-436a-b233-16062281fbc8"></div>
<script>
var dest = document.getElementById("d556673d-b0ed-436a-b233-16062281fbc8");
var template = document.getElementById("9a01667a-7c52-4051-964f-18c49edcb94d");
var fantome = dest.attachShadow({mode: 'open'});
var templateContent = template.content;
fantome.appendChild(templateContent);
</script>

```



![](hypothesis-1-comparable-weed-suppression-1-control_files/figure-html/anova-weeds-1.jpeg)<!-- -->

```{=html}
<template id="41484b7a-6f64-4346-876a-1e2c2737bcc7"><style>
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
</style><div class="tabwid"><style>.cl-cfeacda6{}.cl-cfe51b04{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-cfe751ee{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-cfe75d6a{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-cfe75d74{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-cfe75d75{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-cfeacda6'>

```

<caption>(\#tab:anova-crops)<span>ANOVA for crop biomass response. Crop biomass was analyzed on the original scale.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><th class="cl-cfe75d6a"><p class="cl-cfe751ee"><span class="cl-cfe51b04">model term</span></p></th><th class="cl-cfe75d6a"><p class="cl-cfe751ee"><span class="cl-cfe51b04">df1</span></p></th><th class="cl-cfe75d6a"><p class="cl-cfe751ee"><span class="cl-cfe51b04">df2</span></p></th><th class="cl-cfe75d6a"><p class="cl-cfe751ee"><span class="cl-cfe51b04">F.ratio</span></p></th><th class="cl-cfe75d6a"><p class="cl-cfe751ee"><span class="cl-cfe51b04">p.value</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-cfe75d74"><p class="cl-cfe751ee"><span class="cl-cfe51b04">block     </span></p></td><td class="cl-cfe75d74"><p class="cl-cfe751ee"><span class="cl-cfe51b04">  3</span></p></td><td class="cl-cfe75d74"><p class="cl-cfe751ee"><span class="cl-cfe51b04"> 30</span></p></td><td class="cl-cfe75d74"><p class="cl-cfe751ee"><span class="cl-cfe51b04">  3.846</span></p></td><td class="cl-cfe75d74"><p class="cl-cfe751ee"><span class="cl-cfe51b04"> 0.0193</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-cfe75d75"><p class="cl-cfe751ee"><span class="cl-cfe51b04">species.y </span></p></td><td class="cl-cfe75d75"><p class="cl-cfe751ee"><span class="cl-cfe51b04"> 10</span></p></td><td class="cl-cfe75d75"><p class="cl-cfe751ee"><span class="cl-cfe51b04"> 30</span></p></td><td class="cl-cfe75d75"><p class="cl-cfe751ee"><span class="cl-cfe51b04"> 10.793</span></p></td><td class="cl-cfe75d75"><p class="cl-cfe751ee"><span class="cl-cfe51b04"> &lt;.0001</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="4d33b07a-1a3d-4357-91e7-87c973117204"></div>
<script>
var dest = document.getElementById("4d33b07a-1a3d-4357-91e7-87c973117204");
var template = document.getElementById("41484b7a-6f64-4346-876a-1e2c2737bcc7");
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
