NSOsing<-NSO.single.ticket.forecaster.data
##create dataset object
head(NSOsing)
#read first few lines of object
library(ggplot2)
##load ggplot library
plot(Single.Tickets ~ Week.Number, data = NSOsing)
##create standard scatterplot
ggplot(NSOsing, aes(x= Week.Number, y= Single.Tickets)) + geom_point()
##create ggplot scatter point diagram Subscriber.Tickets by Week.Number
WKsing<- ggplot(NSOsing, aes (x= Week.Number, y= Single.Tickets))
##create basic scatter object (makes mods easier)
WKsing + geom_point(aes(color = SeasonName))
##color by SeasonName
WKsing + geom_point(aes(color = SeasonName)) + facet_wrap(~SeasonName)
##group plots by SeasonName
library(plyr)
##load plyr library
aggregate(Single.Tickets ~ Week.Number + SeasonName, NSOsing, mean)
##Average Week.Number in a season to create an average Substix sold per concert in a Production
NSOprodstb<- aggregate(Single.Tickets ~ Week.Number + SeasonName, NSOsing, mean) 
##create object which contains aggregated prod level Substix
Prodstb<- ggplot(NSOprodstb, aes(x= Week.Number, y= Single.Tickets))
##create basic scatter object for aggregated data
Prodstb + geom_point(aes(color = SeasonName)) + facet_wrap(~SeasonName)
##color by SeasonName, group by SeasonName
Prodstb + geom_smooth(aes(color = SeasonName)) + facet_wrap(~SeasonName)
##create trendline overlaid on scatterplot
