#!/usr/bin/Rscript --vanilla --slave --quiet -ee

################## 
### WP7LC - JOB 1
### CALCULATE MONITORING
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

outNames=c('index','effect_time','effect_arid','veg_response','ta_single','tv_single','av_single')
outNames=paste(o$pOut,'/',outNames,'.',o$driver,sep='')
annualVis=paste(o$pOut,'/viMed',o$yIni:o$yEnd,'.',o$driver,sep='')
annualIaMed=paste(o$pOut,'/aiMed',o$yIni:o$yEnd,'.',o$driver,sep='')
annualTimes=paste(o$pOut,'/time',o$yIni:o$yEnd,'.',o$driver,sep='')
#try to make Indices	
print('---------- Make annuals Vegetation Index Means')		
rgf.summary(o$vi,annualVis,step=12,fun='MEAN',drivername=o$driver,mvFlag=o$flag)		
#make aiObsMed by hidrologic years	
print('---------- Make annuals Aridity Index')				
n=o$rYears
for (i in 0:(n-1)) {
	etp12=o$pet[(1:12)+i*12]
	rain12=o$rain[(1:12)+i*12]
	aiMe=aiObsMe(rain12,etp12,silent=T)
	writeGDAL(aiMe,annualIaMed[i+1],drivername=o$driver,mvFlag=o$flag)
}		
print('---------- Make annuals time series')
#make annual time files		
aux=readGDAL(annualVis[1],silent=T)	
for (i in 0:(n-1)) {
	aux$band1=o$yIni+i
	writeGDAL(aux,annualTimes[i+1],drivername=o$driver,mvFlag=o$flag)
}
#make step by step regresion
print('---------- Make Step by Step regresion')
regStepRaster(annualVis,annualTimes,annualIaMed	,outNames,drivername=o$driver,mvFlag=o$flag)


###
# PUBLISH OUTPUT
###

res <- rciop.publish(outNames, recursive=FALSE, metalink=TRUE)
if (res$exit.code==0) { 
	published <- res$output 
	} else {rciop.log("ERROR",paste("error.code =",res$exit.code))
