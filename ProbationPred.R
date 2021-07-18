#Analyzing types of recidivism for probationers
table(prob$Recidivism.Type)

prob$Recidivist <- as.factor(ifelse(prob$Recidivism.Type=='New Charge','Yes',ifelse(prob$Recidivism.Type=='Technical Violation','Yes','No')))

table(prob$Recidivist)

#Selecting columns necessary for modeling
probu <- prob %>% select(Sex,Race...Ethnicity,Offense.Classification,Offense.Type,Offense.Subtype,Supervision.Level,Recidivist)

head(probu)

#Creating model to show variable importance and charting it
set.seed(2020)
modelz <- randomForest(Recidivist ~ ., data=probu,family=binomial)

Vz <- varImp(modelz)

ggplot2::ggplot(Vz, aes(x=reorder(rownames(Vz),Overall), y=Overall)) +
  geom_point( color="blue", size=4, alpha=0.6)+
  geom_segment( aes(x=rownames(Vz), xend=rownames(Vz), y=0, yend=Overall), 
                color='skyblue') +
  xlab('Variable')+
  ylab('Overall Importance')+
  theme_light() +
  coord_flip() 

#Partitioning data for testing
set.seed(2020)
partyz <- createDataPartition(probu[,"Recidivist"],times=1,p=0.8,list=FALSE)
trainz <- probu[partyz,]
testz <- probu[-partyz,]

#Creating Duplicate Partitions
trainz1 <- trainz
trainz2 <- trainz
trainz3 <- trainz

testz1 <- testz
testz2 <- testz 
testz3 <- testz

#Random Forest 
set.seed(2020)
modelz1 <- randomForest(Recidivist ~ .,data=trainz1,family=binomial)

predz1 <- predict(modelz1,newdata=testz1,type='response')

testz1$predz <- as.factor(predz1)

confusionMatrix(testz1$Recidivist,testz1$predz)

#Naive Bayes
set.seed(2020)
modelz2 <- naiveBayes(Recidivist ~ .,data=trainz2)

predz2 <- predict(modelz2,newdata=testz2)

testz2$predz <- predz2

confusionMatrix(testz2$Recidivist,testz2$predz)

#Neural Net
set.seed(2020)
modelz3 <- multinom(Recidivist ~ .,data=trainz3)

predz3 <- predict(modelz3,newdata=testz3)

testz3$predz <- predz3

confusionMatrix(testz3$Recidivist,testz3$predz)