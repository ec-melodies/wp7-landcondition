#!/usr/bin/Rscript --vanilla --slave --quiet -ee

################## 
### WP7LC - JOB 6 
### CALCULATE INDICE DE ARIDEZ OBSERVADO MEDIO
###  
### INPUTS    : o OBJECTS
### OUTPUTS   : 
### SCOPE			: published
### 
### started - aruiz  - 7/4/2015
###

# load rciop library to access the developer cloud sandbox functions
# load gdal library
library("rciop")
library("rgdal")

# install or/and load r2dRue library
if (length(find.package("r2dRue",quiet=TRUE))==0)
{
	install.packages("/application/libs/R/r2dRue_1.0.4.tar.gz", repos = NULL, type="source")
}
# load r2dRue package
if (length(find.package("r2dRue",quiet=TRUE))>0)
{	
	library("r2dRue")
} else { rciop.log("ERROR", "package r2dRue not found") }

# change working directory
setwd(TMPDIR)

### 
# copy and load rdata file 
##

# read the inputs coming from stdin (name of the rdata file)
f <- file("stdin")
open(f)
f.stdin=readLines(f)

# copy the rdata file to local dir
res <- rciop.copy(f.stdin, TMPDIR, uncompress=TRUE)

# try to load rdata file
if (res$exit.code==0) {		
	rciop.log("DEBUG", paste("Reading",f.stdin))
	load(res$output)
}	else {rciop.log("ERROR",paste("error.code =",res$exit.code))}

close(f)

### 
# copy sources to TMPDIR
###

res=rciop.copy(o$svi,TMPDIR)
if (res$exit.code!=0) return()
res=rciop.copy(o$srain,TMPDIR)
if (res$exit.code!=0) return()
res=rciop.copy(o$spet,TMPDIR)
if (res$exit.code!=0) return()

###
# set output dir 
###
o$pOut=TMPDIR
o$driver="GTiff"

### 
# proccess Job 
###

# set outfiles
outFiles=paste(o$pOut,'/aiObsMed','.',o$driver,sep='')
# call function
iaMe=aiObsMe(o$rain,o$pet)
# write output
writeGDAL(iaMe, outFiles, drivername = o$driver, mvFlag = o$flag)

###
# PUBLISH OUTPUT
###

res <- rciop.publish(outFiles, recursive=FALSE, metalink=TRUE)
if (res$exit.code==0) { 
	published <- res$output 
	} else {rciop.log("ERROR",paste("error.code =",res$exit.code))
