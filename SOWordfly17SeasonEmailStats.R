Wordfly<- X17SeasonWordfly071817SO
#Rename loaded csv
head(Wordfly)
#See top rows of Wordfly
library(ggplot2)
#Load ggplot library
ggplot(Wordfly, aes(Time, UniqueOpenRate)) + geom_point() + labs(title ="17MKT UOR ToD Scatter")
#Scatterplot of Wordfly data, x= Time y= UOR, title in quotes
ggplot(Wordfly, aes(Time, UniqueOpens)) + geom_point() + labs(title ="17MKT UO ToD Scatter")
#Scatterplot of Wordfly data, x= Time y= UO
ggplot(Wordfly, aes(Time, UniqueOpenRate)) + geom_smooth() + labs(title ="17MKT UOR ToD SmoothLine")
#Smoothed Line Wordfly data, x= Time y= UOR
ggplot(Wordfly, aes(Time, UniqueOpenRate)) + geom_point() + labs(title ="17MKT UOR ToD Scatter by Weekday") + facet_wrap(~WeekDay)
#create panels in graph by Weekday
ggplot(Wordfly, aes(Time, UniqueOpenRate)) + geom_smooth() + labs(title ="17MKT UOR ToD SmoothLine by Weekday") + scale_y_continuous(limits=c(0.15,0.45)) + facet_wrap(~WeekDay)
ggplot(Wordfly, aes(WeekDay, UniqueOpenRate)) + geom_point() + labs(title ="17MKT UOR DoW Scatter")
#Scatter Wordfly data, x= WeekDay y= UOR
ggplot(Wordfly, aes(WeekDay, UniqueOpenRate)) + geom_smooth() + labs(title ="17MKT UOR DoW SmoothLine")
#Smoothed Line Wordfly data, x= WeekDay y= UOR
ggplot(Wordfly, aes(TotalDelivered, UniqueOpenRate)) + geom_point() + labs(title ="17MKT UOR TotDev Scatter")
#Scatter Wordfly data, x= TotalDelivered y= UOR
ggplot(Wordfly, aes(TotalDelivered, UniqueOpenRate)) + geom_smooth() + labs(title ="17MKT TotDev SmoothLine")
#Smoothed Line Wordfly data, x= TotalDelivered y= UOR
summary(Wordfly$UniqueOpenRate)
#Summary Statistics of UniqueOpenRate variable in Wordfly dataset
summary(Wordfly$EngagementRate)

Opera<- subset(Wordfly, GenreTag == '17WO')
#Create object which is a subset of Wordfly based on GenreTag
head(Opera)
ggplot(Opera, aes(Time, UniqueOpenRate)) + geom_point() + labs(title ="17WO ToD Scatter")
ggplot(Opera, aes(Time, UniqueOpenRate)) + geom_smooth() + labs(title ="17WO ToD Smooth Line")
ggplot(Opera, aes(Time, UniqueOpenRate)) + geom_point() + labs(title ="17WO ToD Scatter by Weekday") + facet_wrap(~WeekDay)
ggplot(Opera, aes(Time, UniqueOpenRate)) + geom_smooth() + labs(title ="17WO ToD SmoothLine by Weekday") + scale_y_continuous(limits=c(0.15,0.45)) + facet_wrap(~WeekDay)
ggplot(Opera, aes(WeekDay, UniqueOpenRate)) + geom_point() + labs(title ="17WO DoW Scatter")
ggplot(Opera, aes(WeekDay, UniqueOpenRate)) + geom_smooth() + labs(title ="17WO DoW Smooth Line")
ggplot(Opera, aes(TotalDelivered, UniqueOpenRate)) + geom_point() + labs(title ="17WO TotDev Scatter")
ggplot(Opera, aes(TotalDelivered, UniqueOpenRate)) + geom_smooth() + labs(title ="17WO TotDev SmoothLine")
summary(Opera$UniqueOpenRate)


Ballet<- subset(Wordfly, GenreTag == '17DB')
Dance<- subset(Wordfly, GenreTag == '17DM')
Mixed<- subset(Wordfly, GenreTag == '17DX')
Steph<- rbind(Ballet, Dance, Mixed)
#Combine ojects to create a new object which contains data of all component objects
head(Steph)
ggplot(Steph, aes(Time, UniqueOpenRate)) + geom_point() + labs(title ="17Steph ToD Scatter")
ggplot(Steph, aes(Time, UniqueOpenRate)) + geom_smooth() + labs(title ="17Steph ToD SmoothLine")
ggplot(Steph, aes(Time, UniqueOpenRate)) + geom_point() + labs(title ="17Steph ToD Scatter by Weekday") + facet_wrap(~WeekDay)
ggplot(Steph, aes(Time, UniqueOpenRate)) + geom_smooth() + labs(title ="17Steph ToD SmoothLine by Weekday") + scale_y_continuous(limits=c(0.15,0.45)) + facet_wrap(~WeekDay)
ggplot(Steph, aes(WeekDay, UniqueOpenRate)) + geom_point() + labs(title ="17Steph DoW Scatter")
ggplot(Steph, aes(WeekDay, UniqueOpenRate)) + geom_smooth() + labs(title ="17Steph DoW Smooth Line")
ggplot(Steph, aes(TotalDelivered, UniqueOpenRate)) + geom_point() + labs(title ="17Steph TotDev Scatter")
ggplot(Steph, aes(TotalDelivered, UniqueOpenRate)) + geom_smooth() + labs(title ="17Steph TotDev SmoothLine")
summary(Steph$UniqueOpenRate)


NSO<- subset(Wordfly, GenreTag == '17NC')
Pops<- subset(Wordfly, GenreTag == '17NP')
NSF<- subset(Wordfly, GenreTag == '17NF')
Derek<- rbind(NSO, Pops, NSF)
ggplot(Derek, aes(Time, UniqueOpenRate)) + geom_point() + labs(title ="17Derek ToD Scatter")
ggplot(Derek, aes(Time, UniqueOpenRate)) + geom_smooth() + labs(title ="17Derek ToD SmoothLine")
ggplot(Derek, aes(Time, UniqueOpenRate)) + geom_point() + labs(title ="17Derek ToD Scatter by Weekday") + facet_wrap(~WeekDay)
ggplot(Derek, aes(Time, UniqueOpenRate)) + geom_smooth() + labs(title ="17Derek ToD SmoothLine by Weekday") + scale_y_continuous(limits=c(0.15,0.45)) + facet_wrap(~WeekDay)
ggplot(Derek, aes(WeekDay, UniqueOpenRate)) + geom_point() + labs(title ="17Derek DoW Scatter")
ggplot(Derek, aes(WeekDay, UniqueOpenRate)) + geom_smooth() + labs(title ="17Derek DoW Smooth Line")
ggplot(Derek, aes(TotalDelivered, UniqueOpenRate)) + geom_point() + labs(title ="17Derek TotDev Scatter")
ggplot(Derek, aes(TotalDelivered, UniqueOpenRate)) + geom_smooth() + labs(title ="17Derek TotDev SmoothLine")
summary(Derek$UniqueOpenRate)


Theater<- subset(Wordfly, GenreTag == '17TT')
ggplot(Theater, aes(Time, UniqueOpenRate)) + geom_point() + labs(title ="17TT ToD Scatter")
ggplot(Theater, aes(Time, UniqueOpenRate)) + geom_smooth() + labs(title ="17TT ToD SmoothLine")
ggplot(Theater, aes(Time, UniqueOpenRate)) + geom_point() + labs(title ="17TT ToD Scatter by Weekday") + facet_wrap(~WeekDay)
ggplot(Theater, aes(Time, UniqueOpenRate)) + geom_smooth() + labs(title ="17TT ToD SmoothLine by Weekday") + scale_y_continuous(limits=c(0.15,0.45)) + facet_wrap(~WeekDay) 
#edit scale of Y-axis
ggplot(Theater, aes(WeekDay, UniqueOpenRate)) + geom_point() + labs(title ="17TT DoW Scatter")
ggplot(Theater, aes(WeekDay, UniqueOpenRate)) + geom_smooth() + labs(title ="17TT DoW Smooth Line")
ggplot(Theater, aes(TotalDelivered, UniqueOpenRate)) + geom_point() + labs(title ="17TT TotDev Scatter")
ggplot(Theater, aes(TotalDelivered, UniqueOpenRate)) + geom_smooth() + labs(title ="17TT TotDev SmoothLine")
summary(Theater$UniqueOpenRate)
summary(Theater$EngagementRate)



Jazz<- subset(Wordfly, GenreTag == '17MJ')
Comedy<- subset(Wordfly, GenreTag == '17CM')
Frank<- rbind(Jazz, Comedy)
ggplot(Frank, aes(Time, UniqueOpenRate)) + geom_point() + labs(title ="17Frank ToD Scatter")
ggplot(Frank, aes(Time, UniqueOpenRate)) + geom_smooth() + labs(title ="17Frank ToD SmoothLine")
ggplot(Frank, aes(Time, UniqueOpenRate)) + geom_point() + labs(title ="17Frank ToD Scatter by Weekday") + facet_wrap(~WeekDay)
ggplot(Frank, aes(Time, UniqueOpenRate)) + geom_smooth() + labs(title ="17Frank ToD SmoothLine by Weekday") scale_x_continous(limits=c(7:00,+ scale_y_continuous(limits=c(0.15,0.45)) + facet_wrap(~WeekDay)
ggplot(Frank, aes(WeekDay, UniqueOpenRate)) + geom_point() + labs(title ="17Frank DoW Scatter")
ggplot(Frank, aes(WeekDay, UniqueOpenRate)) + geom_smooth() + labs(title ="17Frank DoW Smooth Line")
ggplot(Comedy, aes(Time, UniqueOpenRate)) + geom_smooth() + labs(title = "17Comedy ToD Scatter")
ggplot(Jazz, aes(Time, UniqueOpenRate)) + geom_smooth() + labs(title = "17Jazz ToD Scatter")
ggplot(Comedy, aes(TotalDelivered, UniqueOpenRate)) + geom_smooth() + labs(title ="17Comedy TotDev SmoothLine")
ggplot(Jazz, aes(TotalDelivered, UniqueOpenRate)) + geom_smooth() + labs(title ="17Jazz TotDev SmoothLine")
ggplot(Frank, aes(TotalDelivered, UniqueOpenRate)) + geom_smooth() + labs(title ="17Frank TotDev SmoothLine")
summary(Frank$UniqueOpenRate)

EmailStats<- lm(UniqueOpenRate ~ WeekDay + Time + GenreTag + TotalDelivered, data=Wordfly)
#linear regression to determine WeekDay, Time, GenreTag, TotalDelivered relationship to UOR in Wordfly dataset
summary(EmailStats)
#displays results of regression

OperaStats<- lm(UniqueOpenRate ~ WeekDay + Time + TotalDelivered, data=Opera)
summary(OperaStats)

StephStats<- lm(UniqueOpenRate ~ WeekDay + Time + GenreTag + TotalDelivered, data=Steph)
summary(StephStats)

DerekStats<- lm(UniqueOpenRate ~ WeekDay + Time + GenreTag + TotalDelivered, data=Derek)
summary(DerekStats)

TheaterStats<- lm(UniqueOpenRate ~ WeekDay + Time + TotalDelivered, data=Theater)
summary(TheaterStats)

FrankStats<- lm(UniqueOpenRate ~ WeekDay + Time + GenreTag + TotalDelivered, data=Frank)
summary(FrankStats)

EmailSizeLink<- lm(UniqueOpenRate ~ TotalDelivered, data=Wordfly)
summary(EmailSizeLink)
ggplot(Wordfly, aes(TotalDelivered, UniqueOpenRate)) + geom_point() + labs(title ="17MKT TotDev Scatter")
ggplot(Wordfly, aes(TotalDelivered, UniqueOpenRate)) + geom_smooth() + labs(title ="17MKT TotDev SmoothLine")
qplot(Wordfly$UniqueOpenRate, geom="histogram")
#creates frequency histogram of UOR in Wordfly dataset
qplot(Wordfly$TotalDelivered, geom="histogram")
EmailCluster<- kmeans(Wordfly[,c(16,24)], 5, nstart = 20)
#creates object based on cluster analysis of columns 16 and 24 of Wordfly dataset; 5 clusters, 20 iterations
EmailCluster
table(EmailCluster$cluster, Wordfly$GenreTag)
#display counts of clusters assigned to each GenreTag
ECQ<- as.factor(EmailCluster$cluster)
head(ECQ)
#transforms email cluster into a factor that can be used in analysis
ggplot(Wordfly, aes(UniqueOpenRate, EngagementRate, color = ECQ)) + geom_point() + labs(title ="17MKT UOR vs Engage EQR Scatter")
#scatter plot with color by ECQ factor
Doubletake<- subset(Wordfly, ECQ == 5)
#create object which only contains members of ECQ cluster 1; Doubletake means high UOR and High Engagement
table(Doubletake$GenreTag)
print(Doubletake$Campaign)
Peek<- subset(Wordfly, ECQ == 4)
#Peek means high UOR and med Engagement
table(Peek$GenreTag)
print(Peek$Campaign)

OperaCluster<- kmeans(Opera[,c(16,24)], 5, nstart = 20)
OperaCluster
WNOC<- as.factor(OperaCluster$cluster)
ggplot(Opera, aes(UniqueOpenRate, EngagementRate, color = WNOC)) + geom_point() + labs(title ="17WO UOR vs Engage WNOC Scatter")
WNODouble<- subset(Opera, WNOC == 2)
WNOPeek<- subset(Opera, WNOC == 3)
table(WNODouble$Campaign)
print(WNODouble$Campaign)
#shows Campaigns of WNODouble
print(WNOPeek$Campaign)

BalletCluster<- kmeans(Ballet[,c(16,24)], 5, nstart = 20)
DanceCluster<- kmeans(Dance[,c(16,24)], 5, nstart = 20)
MixedCluster<- kmeans(Mixed[,c(16, 24)], 5, nstart = 20)
DBC<- as.factor(BalletCluster$cluster)
DMC<- as.factor(DanceCluster$cluster)
MDC<- as.factor(MixedCluster$cluster)
StephCluster<- kmeans(Steph[,c(16,24)], 5, nstart = 20)
ADSC<- as.factor(StephCluster$cluster)
ggplot(Ballet, aes(UniqueOpenRate, EngagementRate, color = DBC)) + geom_point() + labs(title ="17DB UOR vs Engage DBC Scatter")
ggplot(Dance, aes(UniqueOpenRate, EngagementRate, color = DMC)) + geom_point() + labs(title ="17DM UOR vs Engage DMC Scatter")
ggplot(Mixed, aes(UniqueOpenRate, EngagementRate, color = MDC)) + geom_point() +labs(title ="17Mixed UOR vs Engage MDC Scatter")
ggplot(Steph, aes(UniqueOpenRate, EngagementRate, color = ADSC)) + geom_point() + labs(title ="17Steph UOR vs Engage ADSC Scatter")
BalletDouble<- subset(Ballet, DBC == 1)
BalletPeek<- subset(Ballet, DBC == 3)
DanceDouble<- subset(Dance, DMC == 2)
DancePeek<- subset(Dance, DMC == 4)
MixedDouble<-subset(Mixed, MDC == 3)
MixedPeek<-subset(Mixed, MDC == 5)
StephDouble<- subset(Steph, ADSC == 4)
StephPeek<- subset(Steph, ADSC == 1)
print(BalletDouble$Campaign)
print(DanceDouble$Campaign)
print(MixedDouble$Campaign)
print(StephDouble$Campaign)
print(StephPeek$Campaign)

NSOCluster<- kmeans(NSO[,c(16,24)], 5, nstart = 20)
PopsCluster<- kmeans(Pops[,c(16,24)], 5, nstart = 20)
NSFCluster<- kmeans(NSF[,c(16, 24)], 5, nstart = 20)
NSOC<- as.factor(NSOCluster$cluster)
PopsC<- as.factor(PopsCluster$cluster)
NSFC<- as.factor(NSFCluster$cluster)
#Not enough data to do clusters for NSF (only 1 observation)#
DerekCluster<- kmeans(Derek[,c(16,24)], 5, nstart = 20)
DOGC<- as.factor(DerekCluster$cluster)
ggplot(NSO, aes(UniqueOpenRate, EngagementRate, color = NSOC)) + geom_point() + labs(title ="17NSO UOR vs Engage DBC Scatter")
ggplot(Pops, aes(UniqueOpenRate, EngagementRate, color = PopsC)) + geom_point() + labs(title ="17Pops UOR vs Engage DMC Scatter")
ggplot(Derek, aes(UniqueOpenRate, EngagementRate, color = DOGC)) + geom_point() + labs(title ="17Derek UOR vs Engage DOGC Scatter")
NSODouble<- subset(NSO, NSOCC == 5)
NSOPeek<- subset(NSO, NSOC == 2)
PopsDouble<-subset(Pops, PopsC == 3)
PopsPeek<-subset(Pops, PopsC == 4)
DerekDouble<- subset(Derek, DOGC == 1)
DerekPeek<- subset(Derek, DOGC == 5)
print(NSODouble$Campaign)
print(NSOPeek$Campaign)
print(PopsDouble$Campaign)
print(PopsPeek$Campaign)
print(DerekDouble$Campaign)
print(DerekPeek$Campaign)

TheaterCluster<- kmeans(Theater[,c(16,24)], 5, nstart = 20)
TTC<- as.factor(TheaterCluster$cluster)
ggplot(Theater, aes(UniqueOpenRate, EngagementRate, color = TTC)) + geom_point() + labs(title ="17TT UOR vs Engage TTC Scatter")
TheaterDouble<- subset(Theater, TTC == 2)
TheaterPeek<- subset(Theater, TTC == 3)
print(TheaterDouble$Campaign)
print(TheaterPeek$Campaign)
print(TheaterOutlier$Campaign)

ComedyCluster<- kmeans(Comedy[,c(16,24)], 5, nstart = 20)
JazzCluster<- kmeans(Jazz[,c(16,24)], 5, nstart = 20)
ComC<- as.factor(ComedyCluster$cluster)
JazzC<- as.factor(JazzCluster$cluster)
FrankCluster<- kmeans(Frank[,c(16,24)], 5, nstart = 20)
FMC<- as.factor(FrankCluster$cluster)
ggplot(Comedy, aes(UniqueOpenRate, EngagementRate, color = ComC)) + geom_point() + labs(title ="17Comedy UOR vs Engage ComC Scatter")
ggplot(Jazz, aes(UniqueOpenRate, EngagementRate, color = JazzC)) + geom_point() + labs(title ="17Jazz UOR vs Engage JazzC Scatter")
ggplot(Frank, aes(UniqueOpenRate, EngagementRate, color = FMC)) + geom_point() + labs(title ="17Frank UOR vs Engage FMC Scatter")
ComedyDouble<- subset(Comedy, ComC == 2)
ComedyPeek<- subset(Comedy, ComC == 5)
JazzDouble<-subset(Jazz, JazzC == 5)
JazzPeek<-subset(Jazz, JazzC == 3)
FrankDouble<- subset(Frank, FMC == 1)
FrankPeek<- subset(Frank, FMC ==4)
print(ComedyDouble$Campaign)
print(ComedyPeek$Campaign)
print(JazzDouble$Campaign)
print(JazzPeek$Campaign)
print(FrankDouble$Campaign)
print(FrankPeek$Campaign)

print(Doubletake$Campaign)
print(Peek$Campaign)
