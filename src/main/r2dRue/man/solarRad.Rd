\name{solarRad}
\Rdversion{1.1}
\alias{solarRad12M}
\alias{solarRad}
\title{
Computes extra-terrestrial solar radiation
}
\description{
solarRad computes the solar radiation received at the top of the Earth's atmosphere on a horizontal surface. 
This radiation will change during the day and will be different at different latitudes and in different seasons.
}
\usage{
solarRad(img, day)
solarRad12M(img, outFl, ...)
}

\arguments{
  \item{img}{
object of class SpatialGridDataFrame that provided a projection class and a bbox attributes.
The nature of the data.frame that contains the attribute data is not relevant.
It must be in geographic coordinates.
}
  \item{day}{
The number of the day (from 1 to 365) to compute extra-terrestrial radiation.
}
  \item{outFl}{
A list of 12 file names to save the results.
}
  \item{\dots}{
Any unmatched parameter will be passed to the writeGDAL routine.
}
}
\details{
The output is expressed in cal/cm2*day.

This function runs unnoticed within petHgsm, but can be executed manually.
}
\value{
solarRad returns a single image corresponding to the specified day, as a SpatialGridDataFrame class.
solarRad12M writes 12 images to disk in the format especified by the GDAL drivername parameter.
}
\references{
Crop evapotranspiration - Guidelines for computing crop water requirements - FAO Irrigation and drainage paper 56
}
\author{
Gabriel del Barrio, Marieta SanJuan & Alberto Ruiz
}
\seealso{
\code{\link{petHgsm}}
}
\examples{
#not run
#aux=readGDAL('iberia_mask')
#calc the extraterrestial radiation the 15-agost
#Rad=solarRad(aux,227)
#writeGDAL(Rad,'solarrad_15ago')
#or to calculate and write to disk, the radiation of the twelve months
#RadFileNames=paste('rad',month.abb,sep='')
#solarRad12M(img,RadFileNames)
}
