prob$Recidivism <- ifelse(prob$Recidivism.Type=='New Charge'|prob$Recidivism.Type=='Technical Violation',1,0)

prob$Felony <- ifelse(prob$Offense.Classification=="B Felony"|prob$Offense.Classification=="C Felony"|prob$Offense.Classification=="D Felony"|
                        prob$Offense.Classification=="Felony - Enhancement to Original Penalty",1,0)

write.csv(prob,"prob.csv")