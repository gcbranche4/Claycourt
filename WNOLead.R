wnold<-WNOLeadDay13to16seasons
##create dataset object
library(ggplot2)
##load ggplot library
head(wnold)
##read top 5 rows of dataset
library(plyr)
##load plyr library
plot(NumTix ~ TixOrderWeeks, data = wnold)
##basic scatter plot NumTix y-axis, TixOrderWeeks x-axis
ggplot(wnold, aes(x= TixOrderWeeks, y= NumTix)) + geom_point() + scale_x_reverse()
##ggplot scatter with reversed x axis
ggplot(wnold, aes(x= TixOrderWeeks, y= NumTix)) + geom_point() + scale_x_reverse() + geom_smooth(method="glm")
##ggplot scatter with regression line
leadtix<- loess(NumTix ~ TixOrderWeeks, data = wnold)
leadtix
ggplot(wnold, aes(x= TixOrderWeeks, y= NumTix)) + geom_point() + scale_x_reverse() + geom_smooth(method="loess")
Ldl<-ggplot(data = wnold, aes(x= TixOrderWeeks, y= NumTix)) + geom_point() + scale_x_reverse() + geom_smooth(method="loess")
smooth_vals = predict(loess(NumTix~TixOrderWeeks,wnold), wnold$TixOrderWeeks)
smooth_vals
install.packages("ddply")

