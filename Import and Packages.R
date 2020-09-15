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

#Importing needed datasets
offrel <- read.csv("Offenders_Released_from_Iowa_Prisons.csv")
prob <- read.csv("3-Year_Recidivism_for_Offenders_Admitted_to_Probation_in_Iowa.csv")
paro <- read.csv("3-Year_Recidivism_for_Offenders_Released_from_Prison_in_Iowa.csv")




