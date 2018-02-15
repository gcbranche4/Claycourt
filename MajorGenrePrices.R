CSP<-`17.Season.prices`
##Name data set
head(CSP)
##view first 5 rows of data set
library(ggplot2)
##load library ggplot for graphing
ggplot(CSP, aes(Price, NumSeats)) + geom_point()
##creates scatterplot of Price on x, NumSeats on y. geom_point is type of mark
ggplot(CSP, aes(Price, NumSeats, color = Genre)) + geom_point()
##creates new scatterplot, colorcoded by Genre
set.seed(5)
##set number of clusters you want
PriceCluster <- kmeans(CSP[, 6:5], 5, nstart = 5)
##creates cluster analysis from columns 6 and 5 of CSP data set with 5 clusters
table(PriceCluster$cluster, CSP$Price)
##prints tables showing all occurences of each price in a given cluster
PriceCluster$cluster <- as.factor(PriceCluster$cluster)
##transforms cluster classifications into a factor
ggplot(CSP, aes(Price, NumSeats, color = PriceCluster$cluster)) + geom_point()
##creates new scatterplot, colorcoded by cluster
prfq<- ggplot(CSP, aes (x= Price, y= NumSeats))
##create basic scatter object (makes mods easier)
prfq + geom_point(aes(color = Genre)) + facet_wrap(~Genre)
##group plots by Genre
library(plyr)
##load plyr library
aggregate(NumSeats ~ Price + Genre, CSP, sum)
##Sum NumSeats in a Genre to create an total NumSeats sold per price in a Genre
TSAP<- aggregate(NumSeats ~ Price + Genre, CSP, sum) 
##create object which contains aggregated price level NumSeats
Aggprfq<- ggplot(TSAP, aes(x= Price, y= NumSeats))
##create basic scatter object of Genre aggregated data (makes mods easier)
Aggprfq + geom_point(aes(color = Genre)) + facet_wrap(~Genre)
##color by Genre, group by Genre
Aggprfq + geom_smooth(aes(color = Genre)) + facet_wrap(~Genre)
##create trendline overlaid on scatterplot
Aggprfq + geom_point(aes(color = Genre))
##All genres on one scatter plot, colored by Genre
aggregate(NumSeats ~ Price, TSAP, sum)
##Sum NumSeats to create an total NumSeats sold per price across Genres
MGSAP<-aggregate(NumSeats ~ Price, TSAP, sum)
##create object which contains Global aggregated price level NumSeats
Globprfq<- ggplot(MGSAP, aes(x= Price, y= NumSeats))
##create basic scatter object of Globally aggregated data (makes mods easier)
Globprfq + geom_smooth()
##create trendline overlaid on scatterplot
Globprfq + geom_point()
##show scatterplot
BGprfq<- ggplot(MGSAP, aes(Price))
##create object for bar graph
rm(BGpfrq)
##removes wrongly named object 'BGpfrq'
BGprfq + geom_bar() 
##create bar graph
set.seed(5)
##set number of clusters you want
GPCluster <- kmeans(MGSAP[, 1:2], 5, nstart = 5)
##creates cluster analysis from columns 2 and 3 of CSP data set with 5 clusters
table(GPCluster$cluster, MGSAP$Price)
##prints tables showing all occurences of each price in a given cluster
GPCluster$cluster <- as.factor(GPCluster$cluster)
##transforms cluster classifications into a factor
ggplot(MGSAP, aes(Price, NumSeats, color = GPCluster$cluster)) + geom_point()
##creates new scatterplot, colorcoded by cluster
ggplot(MGSAP, aes(Price, NumSeats)) + geom_line()
##creates line graph
ggplot(MGSAP, aes(Price, NumSeats)) + geom_line() + ggtitle("Frequency of Prices Across Major Genres")
##adds title to graph
ggplot(MGSAP, aes(Price, NumSeats)) + geom_line() + ggtitle("Frequency of Prices Across Major Genres") + scale_x_continuous(breaks = pretty(MGSAP$Price, n = 20)) + scale_y_continuous(breaks = pretty(MGSAP$NumSeats, n = 10))
##alters scales on graph by how many ticks you want on each axis
DB <- ggplot(TSAP[TSAP$Genre == "Ballet", ], aes(Price, NumSeats)) + geom_line(color="red", size=1.5)
##create Ballet only Price frequency
DB + ggtitle("Frequency of Ballet Prices") + scale_x_continuous(breaks = pretty(TSAP$Price, n = 100)) + scale_y_continuous(breaks = pretty(TSAP$NumSeats, n = 50))
##add tick marks and title to DB
CM <- ggplot(TSAP[TSAP$Genre == "Comedy", ], aes(Price, NumSeats)) + geom_line(color="orange", size=1.5)
##create Comedy only Price frequency
CM + ggtitle("Frequency of Comedy Prices") + scale_x_continuous(breaks = pretty(TSAP$Price, n = 100)) + scale_y_continuous(breaks = pretty(TSAP$NumSeats, n = 100))
##add tick marks and title to CM
DM <- ggplot(TSAP[TSAP$Genre == "Dance", ], aes(Price, NumSeats)) + geom_line(color="pink", size=1.5)
##create Dance only Price frequency
DM + ggtitle("Frequency of Dance Prices") + scale_x_continuous(breaks = pretty(TSAP$Price, n = 100)) + scale_y_continuous(breaks = pretty(TSAP$NumSeats, n = 50))
##add tick marks and title to DM
MJ <- ggplot(TSAP[TSAP$Genre == "Jazz", ], aes(Price, NumSeats)) + geom_line(color="green", size=1.5)
##create Jazz only Price frequency
MJ + ggtitle("Frequency of Jazz Prices") + scale_x_continuous(breaks = pretty(TSAP$Price, n = 200)) + scale_y_continuous(breaks = pretty(TSAP$NumSeats, n = 100))
##add tick marks and title to MJ
NC <- ggplot(TSAP[TSAP$Genre == "NSO", ], aes(Price, NumSeats)) + geom_line(color="blue", size=1.5)
##create NSO Classical only Price frequency
NC + ggtitle("Frequency of NSO Classical Prices") + scale_x_continuous(breaks = pretty(TSAP$Price, n = 100)) + scale_y_continuous(breaks = pretty(TSAP$NumSeats, n = 25))
##add tick marks and title to NC
TT <- ggplot(TSAP[TSAP$Genre == "Theater", ], aes(Price, NumSeats)) + geom_line(color="purple", size=1.5)
##create Theater only Price frequency
TT + ggtitle("Frequency of Theater Prices") + scale_x_continuous(breaks = pretty(TSAP$Price, n = 100)) + scale_y_continuous(breaks = pretty(TSAP$NumSeats, n = 30))
##add tick marks and title to TT
WO <- ggplot(TSAP[TSAP$Genre == "Opera", ], aes(Price, NumSeats)) + geom_line(color="brown", size=1.5)
##create Opera only Price frequency
WO + ggtitle("Frequency of Opera Prices") + scale_x_continuous(breaks = pretty(TSAP$Price, n = 30)) + scale_y_continuous(breaks = pretty(TSAP$NumSeats, n = 50))
##add tick marks and title to WO
















