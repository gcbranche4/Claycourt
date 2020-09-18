getwd()
setwd("C:/Users/gcbra/OneDrive/Documents/R_WD")

PPF<-read.delim("MA_Exer_PikesPeak_Females.txt", header=TRUE, sep="\t")
PPM<-read.delim("MA_Exer_PikesPeak_Males.txt", header=TRUE, sep="\t");

#get source files

head(PPF)
head(PPM)

summary(PPF)
summary(PPM);

#preview data

install.packages("tidyverse")
library(tidyverse)
library(stringr)
library(dplyr)
library(lubridate);

#install needed packages

Cleaned_FGun<-gsub("[^0-9:]", "", PPF$Gun.Tim)
Cleaned_FTB<-gsub("[^0-9:]", "", PPF$Net.Tim)
CleanPPF<-transmute(PPF, Place, Div.Tot, Num, Name, Ag, Hometown, Cleaned_FGun, Cleaned_FTB)

Cleaned_MGun<-gsub("[^0-9:]", "", PPM$Gun.Tim)
Cleaned_MTB<-gsub("[^0-9:]", "", PPM$Net.Tim)
CleanPPM<-transmute(PPM, Place, Div.Tot, Num, Name, Ag, Hometown, Cleaned_MGun, Cleaned_MTB)
summary(CleanPPM);

#strip non-numerical characters from Gun and Net Times; add new column to Female and Male datasets

write.csv(CleanPPF,"CleanPPF.csv")
write.csv(CleanPPM,"CleanPPM.csv");

#Save cleaned files

CFGN<-ms(CleanPPF$Cleaned_FGun)
CFGNM<-as.numeric(CFGN)/60
CFGNMh<-hms(CleanPPF$Cleaned_FGun)
CFGNMh<-as.numeric(CFGNMh)/60

CFNT<-ms(CleanPPF$Cleaned_FTB)
CFNTM<-as.numeric(CFNT)/60
CFNTMh<-hms(CleanPPF$Cleaned_FTB)
CFNTMh<-as.numeric(CFNTMh)/60;

#Convert hh:mm:ss from character to number, show as minutes

write.csv(CFGNM, "CFGNM.csv")
write.csv(CFGNMh, "CFGNMh.csv")

write.csv(CFNTM, "CFNTM.csv")
write.csv(CFNTMh, "CFNTMh.csv");

#save files


CMGN<-ms(CleanPPM$Cleaned_MGun)
CMGNM<-as.numeric(CMGN)/60
CMGNMh<-hms(CleanPPM$Cleaned_MGun)
CMGNMh<-as.numeric(CMGNMh)/60

CMNT<-ms(CleanPPM$Cleaned_MTB)
CMNTM<-as.numeric(CMNT)/60
CMNTMh<-hms(CleanPPM$Cleaned_MTB)
CMNTMh<-as.numeric(CMNTMh)/60;

#Convert hh:mm:ss from character to number, show as minutes

write.csv(CMGNM, "CMGNM.csv")
write.csv(CMGNMh, "CMGNMh.csv")

write.csv(CMNTM, "CMNTM.csv")
write.csv(CMNTMh, "CMNTMh.csv");

#save files

FGun_clean<-read.csv("FGun_clean.csv")
FNet_clean<-read.csv("FNet_clean.csv")

MGun_clean<-read.csv("MGun_clean.csv")
MNet_clean<-read.csv("MNet_clean.csv")

PPF_final<-transmute(CleanPPF, Place, Div.Tot, Num, Name, Ag, Hometown, FGun_clean, FNet_clean)
PPM_final<-transmute(CleanPPM, Place, Div.Tot, Num, Name, Ag, Hometown, MGun_clean, MNet_clean)

summary(PPF_final$FGun_clean)
summary(PPM_final$MGun_clean);

#edit files to include cleaned data, preview new datasets

install.packages("modeest")
library(modeest)


mfv(PPF_final$FNet_clean)
mfv(PPM_final$MNet_clean)

mfv(PPF_final$FGun_clean)
mfv(PPM_final$MGun_clean);

#calculate mode


dplyr::filter(PPM_final, grepl('Chris Doe', Name))
M44Net<-dplyr::filter(PPM_final, grepl("*/214", Div.Tot))
quantile(M44Net$MNet_clean, probs = seq(0,1, .10));

#solve Q3

PPF_final
F15Net<-dplyr::filter(PPF_final, grepl("*/15", Div.Tot))
F19Net<-dplyr::filter(PPF_final, grepl("*/26", Div.Tot))
F24Net<-dplyr::filter(PPF_final, grepl("*/86", Div.Tot))
F29Net<-dplyr::filter(PPF_final, grepl("*/142", Div.Tot))
F35to39Net<-dplyr::filter(PPF_final, grepl("*/247", Div.Tot))
F30to44Net<-dplyr::filter(PPF_final, grepl("*/173", Div.Tot))
F49Net<-dplyr::filter(PPF_final, grepl("*/110", Div.Tot))
F54Net<-dplyr::filter(PPF_final, grepl("*/76", Div.Tot))
F59Net<-dplyr::filter(PPF_final, grepl("*/28", Div.Tot))
F64Net<-dplyr::filter(PPF_final, grepl("*/19", Div.Tot))
F69Net<-dplyr::filter(PPF_final, grepl("*/5", Div.Tot))
F74Net<-dplyr::filter(PPF_final, grepl("*/3", Div.Tot));


PPM_final
M15Net<-dplyr::filter(PPM_final, grepl("*/28", Div.Tot))
M19Net<-dplyr::filter(PPM_final, grepl("*/45", Div.Tot))
M24Net<-dplyr::filter(PPM_final, grepl("*/48", Div.Tot))
M29Net<-dplyr::filter(PPM_final, grepl("*/96", Div.Tot))
M34Net<-dplyr::filter(PPM_final, grepl("*/143", Div.Tot))
M39Net<-dplyr::filter(PPM_final, grepl("*/203", Div.Tot))
M44Net<-dplyr::filter(PPM_final, grepl("*/214", Div.Tot))
M49Net<-dplyr::filter(PPM_final, grepl("*/201", Div.Tot))
M54Net<-dplyr::filter(PPM_final, grepl("*/132", Div.Tot))
M59Net<-dplyr::filter(PPM_final, grepl("*/73", Div.Tot))
M64Net<-dplyr::filter(PPM_final, grepl("*/50", Div.Tot))
M69Net<-dplyr::filter(PPM_final, grepl("*/19", Div.Tot))
M74Net<-dplyr::filter(PPM_final, grepl("*/3", Div.Tot))
M79Net<-dplyr::filter(PPM_final, grepl("*/2", Div.Tot))
M84Net<-dplyr::filter(PPM_final, grepl("*/6", Div.Tot));


#create objects for each race division

FDiv.Cnt<-sub(".*/", "", PPF_final$Div.Tot)
FDiv.Nam<-str_replace(FDiv.Cnt, "15", "F_uFifteen")
FDiv.Nam0<-str_replace(FDiv.Nam, "26", "F_uNineteen")
FDiv.Nam1<-str_replace(FDiv.Nam0, "86", "F_uTwentyfour")
FDiv.Nam2<-str_replace(FDiv.Nam1, "142", "F_uTwentyNine")
FDiv.Nam3<-str_replace(FDiv.Nam2, "247", "F_uThirtyNine")
FDiv.Nam4<-str_replace(FDiv.Nam3, "173", "F_Thirty_Fortyfour")
FDiv.Nam5<-str_replace(FDiv.Nam4, "110", "F_uFortynine")
FDiv.Nam6<-str_replace(FDiv.Nam5, "76", "F_uFiftyfour")
FDiv.Nam7<-str_replace(FDiv.Nam6, "28", "F_uFiftynine")
FDiv.Nam8<-str_replace(FDiv.Nam7, "19", "F_uSixtyfour")
FDiv.NamS<-str_replace(FDiv.Nam8, "5", "F_uSixtynine")
FDiv.NamF<-str_replace(FDiv.NamS, "3", "F_uSeventyfour");


MDiv.Cnt<-sub(".*/","", PPM_final$Div.Tot)
MDiv.Nam<-str_replace(MDiv.Cnt, "28", "M_uFifteen")
MDiv.Nam0<-str_replace(MDiv.Nam, "45", "M_uNineteen")
MDiv.Nam1<-str_replace(MDiv.Nam0, "48", "M_uTwentyfour")
MDiv.Nam2<-str_replace(MDiv.Nam1, "96", "M_uTwentynine")
MDiv.Nam3<-str_replace(MDiv.Nam2, "143", "M_uThirtyfour")
MDiv.Nam4<-str_replace(MDiv.Nam3, "203", "M_uThirtynine")
MDiv.Nam5<-str_replace(MDiv.Nam4, "214", "M_uFortyfour")
MDiv.Nam6<-str_replace(MDiv.Nam5, "201", "M_uFortynine")
MDiv.Nam7<-str_replace(MDiv.Nam6, "132", "M_uFiftyfour")
MDiv.Nam8<-str_replace(MDiv.Nam7, "73", "M_uFiftynine")
MDiv.Nam9<-str_replace(MDiv.Nam8, "50", "M_uSixtyfour")
MDiv.NamS<-str_replace(MDiv.Nam9, "19", "M_uSixtynine")
MDiv.NamS1<-str_replace(MDiv.NamS, "3", "M_uSeventyfour")
MDiv.NamS2<-str_replace(MDiv.NamS1, "2", "M_uSeventynine")
MDiv.NamF<-str_replace(MDiv.NamS2, "6", "M_uEightyfive");

PPF_finalfactor<-transmute(CleanPPF, Place, FDiv.NamF, Num, Name, Ag, Hometown, FGun_clean, FNet_clean)
PPF_finalfactor$FDiv.NamF<-as.factor(PPF_finalfactor$FDiv.NamF)

PPM_finalfactor<-transmute(CleanPPM, Place, MDiv.NamF, Num, Name, Ag, Hometown, MGun_clean, MNet_clean)
PPM_finalfactor$MDiv.NamF<-as.factor(PPM_finalfactor$MDiv.NamF)

summary(PPF_finalfactor)
summary(PPM_finalfactor);

#Replace Div.Tot denominators with Age Group Name, sub in new columns to datasets; preview files

library(ggplot2)

FPP_GunvNet<-ggplot(PPF_finalfactor, aes(FGun_clean, FNet_clean, color = FDiv.NamF)) + geom_point() + labs(title ="Gun Time vs Net Time for Female Pikes Peak Racers")
MPP_GunvNet<-ggplot(PPM_finalfactor, aes(MGun_clean, MNet_clean, color = MDiv.NamF)) + geom_point() + labs(title ="Gun Time vs Net Time for Male Pikes Peak Racers")
cor(PPF_finalfactor$FGun_clean, PPF_finalfactor$FNet_clean)
cor(PPM_finalfactor$MGun_clean, PPM_finalfactor$MNet_clean)

FPP_NetvPl<-ggplot(PPF_finalfactor, aes(Place, FNet_clean, color = FDiv.NamF)) + geom_point() + labs(title ="Place vs Net Time, by Division for Female Pikes Peak Racers") + facet_wrap(~FDiv.NamF)
MPP_NetvPl<-ggplot(PPM_finalfactor, aes(Place, MNet_clean, color = MDiv.NamF)) + geom_point() + labs(title ="Place vs Net Time, by Division for Male Pikes Peak Racers") + facet_wrap(~MDiv.NamF)

FPP_AgvNet<-ggplot(PPF_finalfactor, aes(Ag, FNet_clean, color = FDiv.NamF)) + geom_smooth() + scale_y_continuous(limits=c(1,90)) + labs(title ="Average Net Time by Age for Female Pikes Peak Racers")
MPP_AgvNet<-ggplot(PPM_finalfactor, aes(Ag, MNet_clean, color = MDiv.NamF)) + geom_point() + scale_y_continuous(limits=c(1,90)) + labs(title ="Net Time by Age for Male Pikes Peak Racers")

#create scatter plots for Gun vs Net Times and correlation, Net Time vs Place, and Age vs Net Time

dplyr::filter(PPM_finalfactor, grepl("6", MDiv.NamF))

#search for unassigned factors

summary(F19Net)
summary(F24Net)
summary(F29Net)
summary(F35to39Net)
summary(F30to44Net)
summary(F49Net)
summary(F54Net)
summary(F59Net)
summary(F60pNet)

summary(M19Net)
summary(M24Net)
summary(M29Net)
summary(M34Net)
summary(M39Net)
summary(M44Net)
summary(M49Net)
summary(M54Net)
summary(M59Net)
summary(M60pNet)

#summary statistics for each age division