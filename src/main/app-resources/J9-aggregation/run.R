#!/usr/bin/Rscript --vanilla --slave --quiet -ee

################## 
### WP7LC - JOB 9 
### AGGREGATE RESULT
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


print(f.stdin)

close(f)