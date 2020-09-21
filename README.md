# Multiple-Linear-Regression-of-Consumer-Loan-Data
This R code is a simple example of finding the best fit multiple regression of covariates on days delinquent. The outputs should be below.

Credit Score: As credit score increases by one, we can expect days delinquent to decrease by .73
City: If the loan is originated in Westland, we would it expect it to be around 56 days more delinquent.
These are likely the two best predictors of delinquency.


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
