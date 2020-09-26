# Iowa Probation Project

In the last several years I have been growing more and more interested in crime data and statistics so when perusing the internet looking for data to use in this project I gravitated towards crime related data.  That led me to government websites and eventually to the website of my home state Iowa.  Here I found what would become my subject for this assignment, data on recidivism rates within 3 years of being placed on probation.  This data comes from people placed on probation from 2010-2015 and tracks probationers through 2018.  

My goal with this project is to offer some new insights into the decision making that leads to one being placed on probation.  Particularly offering some new tools and presenting some ways of thinking that might not be commonly addressed.  This will be broken into two parts, the first was crafted in R and the second was built in Tableau.  

The data file as it appears in the project files is 3-Year_Recidivism_for_Offenders_Admitted_to_Probation_in_Iowa.csv

## Part One

My first idea was to tackle something that seemed rather far-fetched when it first crossed my mind as I was taking my first glances at this data.  That idea was to see if I could predict whether or not someone placed on probation would re-offend within 3 years based on the data provided to me.  My goal here was to get a high enough accuracy that my model could potentially be used as a tool when making a decision about whether an offender should be placed on probation.  This (and the project as a whole) is designed to be used in conjunction with the subjective judgement of a court. 

Within this project's docs folder is the rendered R-Markdown document showing the development of this model and the finished product.  You can view this file at: https://michaeltruelsen.github.io/Capstone-Project/  I have also included a version of this knitted markdown document that contains the code along with the results of it, that html document is called Capstone_Project_R_Code.html and can be found in the project files.

My most successful model was a Naive Bayes model which was able to predict whether or not a probationer would re-offend within 3 years with an accuracy of 86%.  This is better than I had expected I'd be able to do going into this, but again I would like to specify this is designed to possibly serve as a supplemental tool, not as a decision maker.    

The project files associated with this objective and their purpose are as follows:

Capstone_Project_R_Code.Rmd is the R-Markdown document that when knitted produces an html page that contains the R code that built the model along with it's results.

Capstone_Project_R.Rmd is the R-Markdown document that when knitted produces the index.html file found at the link above.

Within the docs folder is index.html which is the html page showing the development of the predictive model without showing the code I used to get there. 

Import and Packages.R is the R script that loads the packages required for the execution of the remaining R scripts and pulls the data into R.

ProbationPred.R is the R script that contains the coding for the predictive model itself and that code can be found in the knitted R-Markdown file above. 

## Part Two 

One of the things I noticed when doing my model in R was that the most important factor when predicting recidivism was the supervision level that the probationer was under.  When coming into my Tableau section of the project this became the thing I wanted to look into first.  My findings were that on the surface  the most ineffective type of supervision is intensive supervision.  I say "on the surface" because when we separate out felons we see that most of the felons are put under intensive supervision.  I think in this case it is also fair to assume that the most serious offenders, including felons, are the most likely to be under intensive supervision and the least likely of the probationers to learn from the experience of probation.  So while we see the most recidivism in intense supervision we can not objectively say that it is the least effective method of probation because a lot of subjective factors are not represented here.  That being said, I do not feel this portion of the project would serve any practical purpose.  

The second thing I looked into using Tableau that had piqued my interest was what type of crime was most likely to be committed by a probationer both to get them on probation and as the charge in their re-offense.  What I ended up seeing was that the two most common types of crime that fit there parameters were assault and theft.  There were 649 offenders in our data that committed assault to get them on probation and as the crime violating their probation and 445 that committed theft.  After making this discovery my next question was about the types of supervision these offenders were put under and the efficacy of them in preventing re-offense.  By comparing both the data of our 649 assaulters and 445 thieves and their supervision types with the overall instances of assault and theft in our data I was able to see that the most common supervision type for both types of criminals we are analyzing was intensive supervision.  However, we see much higher numbers of other types of supervision, namely high normal and low normal, relative to the intensive cases in our overall data than we do in the recidivist data.  This leads me to believe that while what I've said about this being subjective data I am analyzing objectively, there is certainly truth in saying that the number of offenders who commit assault and theft placed under intensive supervision needs to be reevaluated based on the success of other types of probation.

The tableau project can be found and downloaded here: https://public.tableau.com/profile/michael.truelsen#!/  

The project files associated with this objective and their purpose are as follows:

prob.csv is a slightly altered version of the original data with 2 added fields for use in Tableau.

Wrangling for Tableau.R is the R script that adds the two fields to the prob.csv dataset.

blue-abstract-background-2.jpg is the background used in my Tableau dashboards.

## Conclusion

My goal of gaining insight that could aid in probation sentencing was, I feel, a success.  I was able to create a viable tool in predicting whether or not an offender placed on probation would re-offend and I was able to point out a flaw in the way people who commit assault and theft are placed on probation.  I had a lot of fun doing this project and finding the next unexpected and interesting thing.  I look forward to continuing to analyze this type of data, this project has made me even more enthusiastic about analyzing crime data, prison data and all things that come along with that!

Thank you so much for your time and attention! 

I can be reached at michaeltruelsen4@gmail.com with any questions or inquiries. 

## Bibliography

Data was procured from https://data.iowa.gov/Correctional-System/3-Year-Recidivism-for-Offenders-Admitted-to-Probat/e9zy-uibf