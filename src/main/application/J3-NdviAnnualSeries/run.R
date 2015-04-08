#!/usr/bin/Rscript --vanilla --slave

################## 
### WP7LC - JOB 3 
### CALCULATE NDVI ANNUAL SERIES
###
### INPUTS    : 
### OUTPUTS   :
### PARAMETERS: 
###							fin	- 
###							endYear		-
### started - aruiz  - 7/4/2015
###


# load rciop library to access the developer cloud sandbox functions
# load gdal library
library("rciop")
library("rgdal")

if (length(find.package("r2dRue",quiet=TRUE))==0)
{
	install.packages("/application/libs/R/r2dRue_1.0.4.tar.gz", repos = NULL, type="source")
}
# load r2dRue package
if (length(find.package("r2dRue",quiet=TRUE))>0)
{	
	library("r2dRue")
}  

# change working directory
setwd(TMPDIR)

#debug rciop.log("INFO", paste("working directory ", TMPDIR)) 

# populate o with initial values  
o.pOut <- TMPDIR
o.yIni<-
o.yEnd<-
o.driver <- "GTiff"
o.flag <- 0

# read the inputs coming from stdin 
f <- file("stdin")
open(f)

while (length(rst.ref <- readLines(f, n=12))>0) {
	
	#retrieve local files and copy to TMPDIR
	rciop.log("INFO", paste("copy local files", rst.ref))
	res <- rciop.copy(rst.ref, TMPDIR, uncompress=TRUE)
	if (res$exit.code==0) 
	{
		rst.ref <- res$output
		rciop.log("INFO", "Copied files.")  
	}	else {rciop.log("ERROR",paste("error.code =",res$exit.code))}  
	
	### 
	# proccessing Job 3
	###
	rciop.log("INFO", paste("processing Job 3 over ", rst.ref))  	
	outFiles=paste(o.pOut,'/viMed',o.yIni:o.yEnd,'.',o.driver,sep='')
	rgf.summary(o.vi,outFiles,fun='MEAN',drivername=o.driver,mvFlag=o.flag)		
}

###
# PUBLISH OUTPUT
###
rciop.log("INFO","publishing Monthly Radiations")  
# publish it
res <- rciop.publish(outFiles, recursive=FALSE, metalink=TRUE)
if (res$exit.code==0) { 
	published <- res$output 
} else {rciop.log("ERROR",paste("error.code =",res$exit.code))