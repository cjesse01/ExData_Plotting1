###############################
## Exploratory Data Analysis
## Week 1, Project 1
## prg: plot4.R
## author: cjesse01
###############################

###############################
## Inputs: ./ExData_Plotting1/household_power_consumption.txt
##
## Outputs: plot4.png 
###############################

###############################
## Instructions from Coursera
#Create one R script called plotn.R that does the following.
#1) read/shape the raw data
#2) create plotn.png
###############################

# Plot4 requirements:
# width=480 pixels heigth=480 pixels
# a 2x2 grid of 4 plots
# plot in c1 r1 is plot2.png
# plot in c1 r2 is plot3.png
# c2 plots are new and created here

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
#       str(EPCfull) # 20752559 x 9 as expected, Date and Time are chr
#       head(EPCfull,n=10)

# subset the dataframe down to the first 2 days of FEB 2007
EPCsub <- EPCfull[EPCfull$Date=="1/2/2007" | EPCfull$Date=="2/2/2007",]
# diagnostics
#       str(EPCsub) # 2880 x 9, as expected

# concatenate (paste) the character Date and Time,
# then use strptime to make it a true date time
EPCsub$DateTime <- strptime(paste(EPCsub$Date, EPCsub$Time), format="%d/%m/%Y %H:%M:%S")
# diagnostics
#       str(EPCsub) # # 2880 x 10, DateTime is a POSIXlt format YYYY-MM-DD HH:MM:SS
#       head(EPCsub, n=20)

#######################################
## 2) create PLOT 4
#######################################
# this is 2x2 grid of 4 plots.
# the plot in the (r1, c1) is Plot 2, new ylab
# the plot in the (r2, c1) is Plot 3, no border on legend
# the plot in the (r1, c2) is new Plot 5
# the plot in the (r2, c2) is new Plot 6

#?png
png(filename = "plot4.png",
    width = 480, height = 480, units = "px"
)

# setup the layout
# mfcol, fills cols in order from left to right
#?par
#?legend
par(mfcol = c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(EPCsub, {
        plot(x=EPCsub$DateTime, y=EPCsub$Global_active_power, 
             type="l",
             main="",
             xlab="",
             ylab="Global Active Power"
        )
        
        plot(x=EPCsub$DateTime, y=EPCsub$Sub_metering_1, 
             col="black", 
             xlab="",
             ylab="Energy sub metering",
             type="l"
        )
        points(x=EPCsub$DateTime, y=EPCsub$Sub_metering_2,
               col="red",
               type="l"
        )
        points(x=EPCsub$DateTime, y=EPCsub$Sub_metering_3,
               col="blue",
               type="l"
        )
        legend("topright", 
               bty="n",
               lty=1,
               lwd=1,
               col=c("black","red","blue"), 
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
        )
        
        
        plot(x=EPCsub$DateTime, y=EPCsub$Voltage, 
             type="l",
             main="",
             xlab="datetime",
             ylab="Voltage"
        )
        
        plot(x=EPCsub$DateTime, y=EPCsub$Global_reactive_power, 
             type="l",
             main="",
             xlab="datetime",
             ylab="Global_reactive_power"
        )
        
})

dev.off() #close png device