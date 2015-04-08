#!/usr/bin/Rscript --vanilla --slave --quiet -ee

################## 
### WP7LC - JOB 1 
### CALCULATE TIME ANNUAL VALUES
###
### INPUTS    : 
### OUTPUTS   :
### PARAMETERS: startYear	- 
###							endYear		-
### started - aruiz  - 7/4/2015
###


# load rciop library to access the developer cloud sandbox functions
# load gdal library
library("rciop")
library("rgdal")

# change working directory
setwd(TMPDIR)

rciop.log("DEBUG", paste("working directory ", TMPDIR)) 

# populate o with initial values  
o.yIni <- as.numeric(rciop.getparam("startYear"))
o.yEnd <- as.numeric(rciop.getparam("endYear"))
o.pOut <- TMPDIR
o.driver <- "RST"
o.flag <- 0

# read the inputs coming from stdin 
f <- file("stdin")
open(f)

rst.ref <- readLines(f, n=1)

#retrieve local files and copy to TMPDIR
rciop.log("INFO", paste("copy local file", rst.ref))    
res <- rciop.copy(rst.ref, TMPDIR, uncompress=TRUE)
if (res$exit.code==0) 
{
	rst.ref <- res$output
	rciop.log("INFO", "Copied file.")  
}	else {rciop.log("ERROR",paste("error.code =",res$exit.code))}

### 
# proccessing Job 1
###
rciop.log("INFO", paste("processing Job 1 over ", rst.ref))  
annualTimes=paste(o.pOut,'/time',o.yIni:o.yEnd,'.',o.driver,sep='')
    
#make annual time files		
aux=readGDAL(rst.ref,silent=T)

# nºyears
n <- o.yEnd-o.yIni+1

# writes annual times files
for (i in 0:(n-1)) {
	aux$band1=o.yIni+i
	writeGDAL(aux,annualTimes[i+1],drivername=o.driver,mvFlag=o.flag)
	rciop.log("INFO", paste("writed ", annualTimes[i+1]))  
}

###
# PUBLISH OUTPUT
###
rciop.log("INFO","publishing Time Annual Series")

# publish it
res <- rciop.publish(annualTimes, recursive=FALSE, metalink=TRUE)
if (res$exit.code==0) { 
	published <- res$output 
} else {rciop.log("ERROR",paste("error.code =",res$exit.code))}

