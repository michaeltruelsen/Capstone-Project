if(!require(ggplot2)){install.packages('ggplot2')}
if(!require(lubridate)){install.packages('lubridate')}
if(!require(ggthemes)){install.packages('ggthemes')}
if(!require(dplyr)){install.packages('dplyr')}
if(!require(caret)){install.packages('caret')}
if(!require(kknn)){install.packages('kknn')}
if(!require(nnet)){install.packages('nnet')}
if(!require(randomForest)){install.packages('randomForest')}
if(!require(e1071)){install.packages('e1071')}
if(!require(adabag)){install.packages('adabag')}
if(!require(gridExtra)){install.packages('grid_Extra')}
if(!require(outliers)){install.packages('outliers')}
if(!require(psych)){install.packages('psych')}
if(!require(stats)){install.packages('stats')}

library(ggplot2)
library(lubridate)
library(ggthemes)
library(dplyr)
library(caret)
library(kknn)
library(nnet)
library(randomForest)
library(e1071)
library(adabag)
library(gridExtra)
library(outliers)
library(psych)
library(stats)

offrel <- read.csv("Offenders_Released_from_Iowa_Prisons.csv")
prob <- read.csv("3-Year_Recidivism_for_Offenders_Admitted_to_Probation_in_Iowa.csv")
paro <- read.csv("3-Year_Recidivism_for_Offenders_Released_from_Prison_in_Iowa.csv")

table(paro$Release.Type)

paro$parole <- ifelse(paro$Release.Type=='Parole'|paro$Release.Type=='Interstate Compact Parole'|paro$Release.Type=='Parole Granted'|paro$Release.Type=='Paroled to Detainer - INS'|
                             paro$Release.Type=='Paroled to Detainer - Iowa'|paro$Release.Type=='Paroled to Detainer - Out of State'|paro$Release.Type=='Paroled to Detainer - U.S. Marshall'|
                             paro$Release.Type=='Paroled w/Immediate Discharge','1','0')

table(paro$Sex)

paru <- paro %>% select(Sex,Race...Ethnicity,Age.At.Release,Offense.Classification,Offense.Type,Offense.Subtype,Return.to.Prison) %>% filter(Sex=='Male'|Sex=='Female')

table(paru$Sex)

head(paru)

paru$Return.to.Prison <- as.factor(paru$Return.to.Prison)

set.seed(2020)
model1 <- randomForest(Return.to.Prison ~ ., data=paru,family=binomial)
  
V <- varImp(model1)

ggplot2::ggplot(V, aes(x=reorder(rownames(V),Overall), y=Overall)) +
  geom_point( color="blue", size=4, alpha=0.6)+
  geom_segment( aes(x=rownames(V), xend=rownames(V), y=0, yend=Overall), 
                color='skyblue') +
  xlab('Variable')+
  ylab('Overall Importance')+
  theme_light() +
  coord_flip() 



