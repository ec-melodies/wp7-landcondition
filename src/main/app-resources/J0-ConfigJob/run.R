#!/usr/bin/Rscript --vanilla --slave --quiet -ee

################## 
### WP7LC - JOB 0 
### CREATE JOB CONFIGURATION FILE AND R OBJECT
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

# install/load r2dRue library
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

# write configuration file
# txt=paste("comment",rciop.getparam("comment"),sep="=")
#txt[2]=paste("viRgf",rciop.getparam("ndviList"),sep="=")
#txt[3]=paste("rainRgf",rciop.getparam("rainList"),sep="=")
#txt[4]=paste("petRgf",rciop.getparam("petList"),sep="=")
#txt[5]=paste("mHidro",rciop.getparam("mHidro"),sep="=")
#txt[6]=paste("acum",rciop.getparam("acum"),sep="=")
#txt[7]=paste("sYear",rciop.getparam("sYear"),sep="=")
#txt[8]=paste("sMonth",rciop.getparam("sMonth"),sep="=")
#txt[9]=paste("yIni",rciop.getparam("yIni"),sep="=")
#txt[10]=paste("yEnd",rciop.getparam("yEnd"),sep="=")
#txt[11]=paste("driver",rciop.getparam("driver"),sep="=")
#txt[12]=paste("flag",rciop.getparam("flag"),sep="=")
#txt[13]=paste("pout",TMPDIR,sep="=")

# as alternative to read parameter
# read the inputs coming from stdin 
f <- file("stdin")
open(f)
txt <- readLines(f)
close(f)

# generate confJob.conf
aux.file <- paste(tempfile(pattern = "confJob", tmpdir=TMPDIR), ".conf", sep="")
writeLines(txt,aux.file)

### 
# proccessing Job 0
###
rciop.log("DEBUG", "processing Job 0")  	

# read Configuration file
rciop.log("DEBUG", paste("Reading",aux.file))
o=readr2dRfile(aux.file)
rciop.log("DEBUG", "Reading OK")

###
# PUBLISH OUTPUT
###

rda.file <- paste(tempfile(pattern = "confJob", tmpdir=TMPDIR), ".RData", sep="")
rciop.log("DEBUG", paste("Saving to",rda.file))
save(o,file=rda.file)
rciop.log("DEBUG", "Saving OK")

# publish the RData file generated 
res=rciop.publish(rda.file, recursive=FALSE)
rciop.log("DEBUG", res)
