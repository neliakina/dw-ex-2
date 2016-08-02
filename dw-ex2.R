#load packages
library(dplyr)

#0: Load the data in RStudio
titanic <- read.csv("titanic_original.csv", stringsAsFactors = FALSE)
head(titanic)


#1: Port of embarkation
titanic$embarked <- gsub("^$", "S", titanic$embarked)

#2: Age
titanic$age[is.na(titanic$age)] <- round(mean(titanic$age, na.rm = TRUE), 
                                         digits = 0)

#3: Lifeboat
titanic$boat <- gsub("^$", "NA", titanic$boat)

#4: Cabin
titanic <- titanic %>% 
              mutate(has_cabin_number = ifelse(titanic$cabin != "", 1, 0))

#6: Submit the project on Github
#Not sure why item 5 is missing in the task list

write.csv(titanic, file = "titanic_clean.csv")

