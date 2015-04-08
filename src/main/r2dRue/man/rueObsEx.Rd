\name{rueObsEx}
\Rdversion{1.1}
\alias{aiObsMe}
\alias{aiObsEx}
\alias{rueObsMe}
\alias{rueObsEx}

\title{
Functions to perform the assessment component of a r2dRue analysis through direct specification of parameters
}
\description{
These functions compute Mean Observed RUE, Mean Observed Aridity, Extreme Observed RUE and Extreme Observed Aridity, and save the results to corresponding raster files.

Their arguments can be manually specified, or they are piped from the assessment function.
}
\usage{
rueObsMe(rainFl, viFl, silent = FALSE)
aiObsMe(rainFl, petFl, FAO = FALSE, silent = FALSE)
rueObsEx(rainFl, viFl, preRainFl, nMonths = 6, silent = FALSE)
aiObsEx(rainFl, viFl, petFl, preRainFl, prePetFl, FAO=FALSE, nMonths = 6, silent = FALSE)
}
\arguments{
  \item{rainFl}{
Raster group file with the file names of the precipitation grids
}
  \item{viFl}{
Raster group file with the file names of the vegetation index grids
}
  \item{petFl}{
Raster group file with the file names of the evapotranspiration grids
}
  \item{preRainFl}{
Raster group file with the file names of the precipitation files preceding the given period
}
  \item{prePetFl}{
Raster group file with the file names of the evapotranspiration files preceding the given period
}
  \item{FAO}{
logical; If TRUE the index is according with the FAO definition
}
  \item{nMonths}{
A integer value representing the number of cumulative months for preceding precipitation.
If a valid image filename is supplied, the value is read from the file.
}
  \item{silent}{
Logical. If TRUE, comment and non-fatal CPL driver errors are suppressed
}
}
\details{
rueObsMe compute mean observed RUE.
aiObsMe compute mean observed aridity index.
rueObsEx compute extreme observed RUE.
aiObsEx compute extreme observed aridity index.
}
\value{
The following raster files are created resulting from the assessment operation. They belong to the SpatialGridDataFrame class
  \item{rueObsMe }{Mean Observed rain Use Efficiency}
  \item{rueObsEx }{Extreme Observed Rain Use Efficiency}
  \item{aiObsMe }{Mean Observed Aridity Index}
  \item{aiObsEx }{Extreme Observed Aridity Index}
}
\references{
del Barrio, G., Puigdefabregas, J. Sanjuan, M.E., Stellmes, M. & Ruiz, A. (2010). Assessment and monitoring of land condition in the Iberian Peninsula, 1989-2000. Remote Sensing of Environment, 114: 1817-1832 \url{http://dx.doi.org/10.1016/j.rse.2010.03.009}
}
\author{
Gabriel del Barrio, Juan Puigdefabregas, Maria E. Sanjuan & Alberto Ruiz
}
\examples{
#not work...
#frain=rgf.read('rain.rgf')
#fpet=rgf.read('pet.rgf')
#fvi=rgf.read('ndvi.rgf')
#rome=rueObsMe(frain,fvi)
#summary(rome)
#image(rome)
#writeGDAL(rome,'rome.rst',drivername='RST',mvFlag=-99)
#aiome=rueObsMe(frain,fvi,fpet)
#writeGDAL(aiome,'aiome.rst',drivername='RST',mvFlag=-99)

#fprain=read.rgf('prerain.rgf')
#fppet=read.rgf('prepet.rgf')
#roex=rueObsEx(frain,fvi,fprain)
#aioex=rueObsEx(frain,fvi,fprain,fppet)
#writeGDAL(roex,'roex.rst',drivername='RST',mvFlag=-99)
#writeGDAL(aioex,'aioex.rst',drivername='RST',mvFlag=-99)

}