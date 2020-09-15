#Showing and reorganizing release.type column
table(paro$Release.Type)

paro$parole <- ifelse(paro$Release.Type=='Parole'|paro$Release.Type=='Interstate Compact Parole'|paro$Release.Type=='Parole Granted'|paro$Release.Type=='Paroled to Detainer - INS'|
                        paro$Release.Type=='Paroled to Detainer - Iowa'|paro$Release.Type=='Paroled to Detainer - Out of State'|paro$Release.Type=='Paroled to Detainer - U.S. Marshall'|
                        paro$Release.Type=='Paroled w/Immediate Discharge','1','0')

#Showing error in sex column and fixing it while creating testable dataset in the process
table(paro$Sex)

paru <- paro %>% select(Sex,Race...Ethnicity,Age.At.Release,Offense.Classification,Offense.Type,Offense.Subtype,Return.to.Prison) %>% filter(Sex=='Male'|Sex=='Female')

table(paru$Sex)

head(paru)

#Making field to be tested a factor
paru$Return.to.Prison <- as.factor(paru$Return.to.Prison)

#Creating model to show variable importance and charting it
set.seed(2020)
modeli <- randomForest(Return.to.Prison ~ ., data=paru,family=binomial)

V <- varImp(modeli)

ggplot2::ggplot(V, aes(x=reorder(rownames(V),Overall), y=Overall)) +
  geom_point( color="blue", size=4, alpha=0.6)+
  geom_segment( aes(x=rownames(V), xend=rownames(V), y=0, yend=Overall), 
                color='skyblue') +
  xlab('Variable')+
  ylab('Overall Importance')+
  theme_light() +
  coord_flip() 

#Partitioning data for testing
set.seed(2020)
party <- createDataPartition(paru[,"Return.to.Prison"],times=1,p=0.8,list=FALSE)
train <- paru[party,]
test <- paru[-party,]

#Creating Duplicate Partitions
train1 <- train
train2 <- train
train3 <- train

test1 <- test
test2 <- test 
test3 <- test

#Random Forest 
set.seed(2020)
model1 <- randomForest(Return.to.Prison ~ .,data=train1,family=binomial)

pred1 <- predict(model1,newdata=test1,type='response')

test1$pred <- as.factor(pred1)

test1$score <-ifelse(test1$pred==test1$Return.to.Prison,'good prediction','bad prediction')

cat(paste('Accuracy =',round(mean(pred1==test1$Return.to.Prison),3)))

table(test1$score)

#Naive Bayes
set.seed(2020)
model2 <- naiveBayes(Return.to.Prison ~ .,data=train2)

pred2 <- predict(model2,newdata=test2)

test2$pred <- pred2

test2$score <- ifelse(test2$pred==test2$Return.to.Prison,'good prediction','bad prediction')

cat(paste('Accuracy =',round(mean(pred2==test2$Return.to.Prison),3)))

table(test2$score)

#Neural Net
set.seed(2020)
model3 <- multinom(Return.to.Prison ~ .,data=train3)

pred3 <- predict(model3,newdata=test3)

test3$pred <- pred3

test3$score <- ifelse(test3$pred==test3$Return.to.Prison,'good prediction','bad prediction')

cat(paste('Accuracy =',round(mean(pred3==test3$Return.to.Prison),3)))

table(test3$score)

#Performance Test

#Random Forest
test1i <- test1 %>% filter(test1$pred=='Yes')

length(test1i$pred)

cat(paste('Accuracy =',round(mean(test1i$pred==test1i$Return.to.Prison),3)))

table(test1i$score)

#Naive Bayes
test2i <- test2 %>% filter(test2$pred=='Yes')

length(test2i$pred)

cat(paste('Accuracy =',round(mean(test2i$pred==test2i$Return.to.Prison),3)))

table(test2i$score)

#Neural Net
test3i <- test3 %>% filter(test3$pred=='Yes')

length(test3i$pred)

cat(paste('Accuracy =',round(mean(test3i$pred==test3i$Return.to.Prison),3)))

table(test3i$score)