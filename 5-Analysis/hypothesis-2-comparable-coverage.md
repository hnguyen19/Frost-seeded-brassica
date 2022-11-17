---
output: 
  bookdown::html_document2: 
#  bookdown::pdf_document2:
    keep_tex: yes
    keep_md: yes
    toc: false
    number_sections: false
#bibliography: NECCC-test.bib
---





Arithmetic means of speculative coverage are in Figure \@ref(fig:summ-coverage).  
<div class="figure">
<img src="hypothesis-2-comparable-coverage_files/figure-html/summ-coverage-1.jpeg" alt="Arithmetic means of crop speculative coverage."  />
<p class="caption">(\#fig:summ-coverage)Arithmetic means of crop speculative coverage.</p>
</div>

```r
coverage.lm1 <- lm(speculative.pct.coverage   ~ as.factor(block) + species , data = coverage)
resid_panel(coverage.lm1)
```

![](hypothesis-2-comparable-coverage_files/figure-html/unnamed-chunk-2-1.jpeg)<!-- -->

```r
joint_tests(coverage.lm1)
```

```
##  model term df1 df2 F.ratio p.value
##  block        3  33   8.267  0.0003
##  species     11  33  13.630  <.0001
```


```r
plot(emmeans(coverage.lm1 , "species"), comparisons = TRUE) + 
  xlab("Speculative coverage (%)" ) +
  ylab("Species") #+ scale_y_discrete(labels = crops_labels)
```

![](hypothesis-2-comparable-coverage_files/figure-html/unnamed-chunk-3-1.jpeg)<!-- -->
