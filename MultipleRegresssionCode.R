View(demoData)
library(readr)
demoData <- read_csv("C:/Users/nbreckenridge/Documents/R/MultipleRegression in R/demoData.csv",
                     col_types = cols(City = col_factor(levels = c("Eastland",
                                                                   "Westland"))))
View(demoData)
plot(LTV.Original,Days.Delinquent)

ltv<-lm(Days.Delinquent~LTV.Original)
abline(ltv)
summary(ltv)

fit<-lm(Days.Delinquent~
          Interest.Rate+Original.Credit.Score+LTV.Original+ City, data=demoData)
summary(fit)


backward<-step(fit,data=demoData,direction='backward')
summary(backward)
