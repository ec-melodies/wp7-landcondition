\name{petHgsm}
\Rdversion{1.1}
\alias{batchPetHgsm}
\alias{petHgsm}
\title{
Computes Potential Evapo-Transpiration (PET)
}
\description{
PET (mm) is computed from mean maximum, mean and mean minimum air temperatures in Celsius degree and extra-terrestrial solar radiation (cal/cm2/day) using the Hargreaves-Samani equation.

batchPet () provides a batch process to compute PET over sets of images, typically time-series, specified as raster groups.
}
\usage{
petHgsm(Tmin,Tmax,Tmed,Rad,month)
batchPetHgsm(outFl, monthIni, Tmin, Tmed, Tmax, Rad, ...)
}
\arguments{
  \item{monthIni}{
The month order-number of the first image in the time-series. An integer between 1 and 12.
}
  \item{month}{
The target month order-number to compute PET An integer between 1 and 12.
}
  \item{Tmin}{
In petHgsm, a SpatialGridDataFrame with mean minimum air temperature in Celsius degrees.
In batchpetHgsm, a raster group with the file names containing mean minimum air temperature.
}
  \item{Tmax}{
In petHgsm a SpatialGridDataFrame with mean maximum air temperature in Celsius degrees.
In batchpetHgsm, a raster group with the file names containing mean maximum air temperature.
}
  \item{Tmed}{
In petHgsm a SpatialGridDataFrame with mean air temperature (Celsius degree).
In batchpetHgsm, a raster group with the file names containing mean air temperature.
}
  \item{Rad}{
In petHgsm a SpatialGridDataFrame with extra-terrestial solar radiation (cal/cm2/day).
In batchpetHgsm a raster group with the file names containing extra-terrestial solar radiation.
}
  \item{outFl}{
A raster group with file names to save the results
}
  \item{\dots}{
Any unmatched parameter will be passed to the writeGDAL routine.
}
}

\value{
petHgsm returns a spatialGridDataFrame representing the potential evapotranspiration.
batchEtp writes to disc the computed rasters as SpatialGridDataFrame objects.
}
\references{
Estimating potential evapotranspiration.
Hargreaves, G.H., Samani, Z.A. 
Journal of the Irrigation & Drainage Division - ASCE 
Volume 108, Issue IR3, 1982, Pages 225-230  
}
\author{
Gabriel del Barrio, Marieta E. SanJuan & Alberto Ruiz
}
\examples{
#not run
## Read  the temperature and radiation data 
#tmin=readGDAL('Tmin_Ene1990')
#tmax=readGDAL('Tmax_Ene1990')
#tmea=readGDAL('Tmea_Ene1990')
#rad=readGDAL('SolarRad_Ene1990')
## Calc the PET for Ene 1990
#PetEne=petHgsm(tmin,tmax,tmea,rad, 1)
#writeGDAL(PetEne,'PetEne1990')
## Or to calculate and write to disk, in a batch process, a set of PETs
## create the Input file list
#Flmin=c('Tmin_Ene1990','Tmin_Feb1990', 'Tmin_Mar1990')
#Flmax=c('Tmax_Ene1990','Tmax_Feb1990', 'Tmax_Mar1990')
#Flmea=c('Tmea_Ene1990','Tmea_Feb1990', 'Tmea_Mar1990')
#Flrad=c('Rad_Ene','Rad_Feb', 'Rad_Mar')
#PETFileNames=c('PET_Ene1990','PET_Feb1990', 'PET_Mar1990')
##define the date of the first image
#iniDate=c(1,1990)
#batchPET(iniDate, Flmin, Flmax, Flmea, Flrad, PETFileNames)

}
