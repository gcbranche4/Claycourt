NSOsubs<-NSO.subs.ticket.forecaster.data
##create dataset object
head(NSOsubs)
#read first few lines of object
library(ggplot2)
##load ggplot library
plot(Subscriber.Tickets ~ Week.Number, data = NSOsubs)
##create standard scatterplot
ggplot(NSOsubs, aes(x= Week.Number, y= Subscriber.Tickets)) + geom_point()
##create ggplot scatter point diagram Subscriber.Tickets by Week.Number
WKsubs<- ggplot(NSOsubs, aes (x= Week.Number, y= Subscriber.Tickets))
##create basic scatter object (makes mods easier)
WKsubs + geom_point(aes(color = SeasonName))
##color by SeasonName
WKsubs + geom_point(aes(color = SeasonName)) + facet_wrap(~SeasonName)
##group plots by SeasonName
library(plyr)
##load plyr library
aggregate(Subscriber.Tickets ~ Week.Number + SeasonName, NSOsubs, mean)
##Average Week.Number in a season to create an average Substix sold per concert in a Production
NSOprod<- aggregate(Subscriber.Tickets ~ Week.Number + SeasonName, NSOsubs, mean) 
##create object which contains aggregated prod level Substix
Prodsubs<- ggplot(NSOprod, aes(x= Week.Number, y= Subscriber.Tickets))
##create basic scatter object for aggregated data
Prodsubs + geom_point(aes(color = SeasonName)) + facet_wrap(~SeasonName)
##color by SeasonName, group by SeasonName
Prodsubs + geom_smooth(aes(color = SeasonName)) + facet_wrap(~SeasonName)
##create trendline overlaid on scatterplot
