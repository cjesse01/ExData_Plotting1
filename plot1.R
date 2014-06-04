###############################
## Exploratory Data Analysis
## Week 1, Project 1
## prg: plot1.R
## author: cjesse01
###############################

###############################
## Inputs:
## 
## Outputs: 
###############################

###############################
## Instructions from Coursera
#Create one R script called plot1.R that does the following.
#1) reads and shapes the raw data
#2) creates plot1.png
###############################

#######################################
## 1) Read/Shape .txt ##
#######################################
## Read and Process the Electric Power Consumption data
## NOTE: data downloaded and unzipped manually
EPCfull<-read.table("?.?", sep="?", header=FALSE)
str(EPCfull)
names(EPCfull)<-c("activityNBR","activityDESC")
# diagnotics
#head(EPCfull,n=10)
#str(EPCfull) # 2,075,259 x 9, expected

# only want the 2 months days of data 2007-02-01 and 2007-02-02
# convert the date/time columns using strptime() and as.Date()
EPC_2days<-EPCfull[rowcondition, all columns]
str(EPC_2days)


