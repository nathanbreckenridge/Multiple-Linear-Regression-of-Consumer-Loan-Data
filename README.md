# Multiple-Linear-Regression-of-Consumer-Loan-Data
This R code is a simple example of finding the best fit multiple regression of covariates on days delinquent. The outputs if using demoData should be below.

Credit Score: As credit score increases by one, we can expect days delinquent to decrease by .73
City: Categorical values are a bit different. Here we say that if the loan is originated in Westland, we would it expect it to be around 56 days more delinquent.
We can conclude that these are likely the two best predictors of delinquency.

View(demoData)
> library(readr)
> demoData <- read_csv("C:/Users/nbreckenridge/Downloads/demoData.csv",
+ col_types = cols(City = col_factor(levels = c("Eastland",
+ "Westland"))))
> View(demoData)
> plot(LTV.Original,Days.Delinquent)
> 
> ltv<-lm(Days.Delinquent~LTV.Original)
> abline(ltv)
> summary(ltv)

Call:
lm(formula = Days.Delinquent ~ LTV.Original)

Residuals:
    Min      1Q  Median      3Q     Max 
-49.682 -22.315   5.527  18.153  54.325 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept)   -190.21      50.62  -3.758 0.005564 ** 
LTV.Original   209.93      39.61   5.300 0.000729 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 33.26 on 8 degrees of freedom
Multiple R-squared:  0.7783,	Adjusted R-squared:  0.7506 
F-statistic: 28.09 on 1 and 8 DF,  p-value: 0.0007288

> 
> fit<-lm(Days.Delinquent~
+              Interest.Rate+Original.Credit.Score+LTV.Original+ City, data=demoData)
> summary(fit)

Call:
lm(formula = Days.Delinquent ~ Interest.Rate + Original.Credit.Score + 
    LTV.Original + City, data = demoData)

Residuals:
       1        2        3        4        5        6        7        8        9       10 
 24.2858  -9.5879 -11.1723  -9.7409   0.3847 -10.1403  -6.2139 -10.7862  11.0126  21.9585 

Coefficients:
                       Estimate Std. Error t value Pr(>|t|)  
(Intercept)           1106.2202   586.4129   1.886   0.1179  
Interest.Rate          459.9070  1013.5659   0.454   0.6690  
Original.Credit.Score   -1.3685     0.6585  -2.078   0.0923 .
LTV.Original          -147.1405   145.4584  -1.012   0.3582  
CityWestland            59.8188    23.4795   2.548   0.0514 .
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 18.78 on 5 degrees of freedom
Multiple R-squared:  0.9558,	Adjusted R-squared:  0.9205 
F-statistic: 27.06 on 4 and 5 DF,  p-value: 0.001389

> 
> 
> backward<-step(fit,data=demoData,direction='backward')
Start:  AIC=61.72
Days.Delinquent ~ Interest.Rate + Original.Credit.Score + LTV.Original + 
    City

                        Df Sum of Sq    RSS    AIC
- Interest.Rate          1     72.59 1835.4 60.124
- LTV.Original           1    360.76 2123.6 61.583
<none>                               1762.8 61.721
- Original.Credit.Score  1   1522.63 3285.4 65.947
- City                   1   2288.41 4051.2 68.042

Step:  AIC=60.12
Days.Delinquent ~ Original.Credit.Score + LTV.Original + City

                        Df Sum of Sq    RSS    AIC
- LTV.Original           1     290.4 2125.8 59.593
<none>                               1835.4 60.124
- Original.Credit.Score  1    1765.6 3601.0 64.864
- City                   1    3199.7 5035.1 68.216

Step:  AIC=59.59
Days.Delinquent ~ Original.Credit.Score + City

                        Df Sum of Sq    RSS    AIC
<none>                               2125.8 59.593
- City                   1    2971.0 5096.8 66.338
- Original.Credit.Score  1    7216.8 9342.7 72.398
> summary(backward)

Call:
lm(formula = Days.Delinquent ~ Original.Credit.Score + City, 
    data = demoData)

Residuals:
    Min      1Q  Median      3Q     Max 
-19.585 -10.419  -5.651  10.023  27.472 

Coefficients:
                      Estimate Std. Error t value Pr(>|t|)   
(Intercept)           526.4765   100.8297   5.221  0.00122 **
Original.Credit.Score  -0.7321     0.1502  -4.875  0.00180 **
CityWestland           56.0019    17.9047   3.128  0.01666 * 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 17.43 on 7 degrees of freedom
Multiple R-squared:  0.9467,	Adjusted R-squared:  0.9315 
F-statistic: 62.22 on 2 and 7 DF,  p-value: 3.485e-05

> summary(backward)

Call:
lm(formula = Days.Delinquent ~ Original.Credit.Score + City, 
    data = demoData)

Residuals:
    Min      1Q  Median      3Q     Max 
-19.585 -10.419  -5.651  10.023  27.472 

Coefficients:
                      Estimate Std. Error t value Pr(>|t|)   
(Intercept)           526.4765   100.8297   5.221  0.00122 **
Original.Credit.Score  -0.7321     0.1502  -4.875  0.00180 **
CityWestland           56.0019    17.9047   3.128  0.01666 * 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 17.43 on 7 degrees of freedom
Multiple R-squared:  0.9467,	Adjusted R-squared:  0.9315 
F-statistic: 62.22 on 2 and 7 DF,  p-value: 3.485e-05
