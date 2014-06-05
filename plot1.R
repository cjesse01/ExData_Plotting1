###############################
## Exploratory Data Analysis
## Week 1, Project 1
## prg: plot1.R
## author: cjesse01
###############################

###############################
## Inputs: ./ExData_Plotting1/household_power_consumption.txt
##
## Outputs: plot1.png 
###############################

###############################
## Instructions from Coursera
#Create one R script called plotn.R that does the following.
#1) read/shape the raw data
#2) create plotn.png
###############################

# Plot1 is a histogram of Global_active_power
# Plot1 requirements:
# width=480 pixels heigth=480 pixels
# horizontal label "Global Active Power (kilowatts)"
# title "Global Active Power"

#######################################
## 1) Read/Shape the Electric Power Consumption data ##
#######################################
## Read and Process household_power_consumption.txt
## NOTE: data downloaded and unzipped manually
?read.table
# NOTES: 1st row header, separator is semicolon, NA is a ?
EPCfull<-read.table(
                    "./ExData_Plotting1/household_power_consumption.txt", 
                    sep=";", 
                    header=TRUE,
                    na.strings = "?",
                    stringsAsFactors=FALSE
                    )
# diagnostics
#        str(EPCfull) # 20752559 x 9 as expected, Date and Time are chr
#        head(EPCfull,n=10)

# subset the dataframe down to the first 2 days of FEB 2007
EPCsub <- EPCfull[EPCfull$Date=="1/2/2007" | EPCfull$Date=="2/2/2007",]
# diagnostics
#        str(EPCsub) # 2880 x 9, as expected

# concatenate (paste) the character Date and Time,
# then use strptime to make it a true date time
EPCsub$DateTime <- strptime(paste(EPCsub$Date, EPCsub$Time), format="%d/%m/%Y %H:%M:%S")
# diagnostics
#        str(EPCsub) # # 2880 x 10, DateTime is a POSIXlt format YYYY-MM-DD HH:MM:SS
#        head(EPCsub, n=20)

#######################################
## 2) create PLOT 1
#######################################
#?png
png(filename = "plot1.png",
    width = 480, height = 480, units = "px"
    )

#?hist
hist(EPCsub$Global_active_power, 
     breaks=12, 
     main="Global Active Power", 
     col="red",
     xlab="Global Active Power (kilowatts)"
        )

dev.off() #close png device