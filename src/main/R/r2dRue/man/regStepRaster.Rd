\name{regStepRaster}
\Rdversion{1.1}
\alias{regStepRaster}
\title{
Stepwise regression over raster images
}
\description{
This function performs a stepwise regression with two predictors.

The regression is made in standard form, therefore the reported regression coefficients are in standard deviation units.
Multiple regression is accepted only if the second variable produces a significant increment of determination.
Else, single correlations are explored and correlation coefficients are reported if significant.
Significance is set to p<=0.1.

In r2dRue, the predictors are typically time (year order-number) and mean annual Aridity Index, whilst mean annual Vegetation Index is the dependent variable.
The regression is fitted using as many points as available hydrological years.
However, other variables could be used whilst the format and rationale of the procedure is respected. 
}
\usage{
regStepRaster(ndviFl, timeFl, aridFl, outFl, silent = FALSE, ...)
}

\arguments{
  \item{ndviFl}{
Raster group with the file names of the annual Vegetation Index rasters.
}
  \item{timeFl}{
Raster group with the file names of the annual year number-order rasters.
}
  \item{aridFl}{
Raster group with the file names of the annual Aridity Index rasters.
}
  \item{outFl}{
A list of 7 file names to save the results.
}
  \item{silent}{
Logical. If TRUE, comment and non-fatal CPL driver errors are suppressed.
}
  \item{\dots}{
Any unmatched parameter will be passed to the writeGDAL routine. Usually drivername=..., or mvFlag=...
}
}
\details{
The rasters specified in argument timeFL are dummy images with the year number-order, or simply the year, in each grid cell. This is used as one of the predictors.

The rationale is explained in del Barrio et al. below.

The regression procedure has been taken from Box 9.1 of Sokal below.
}
\value{
Returns no value, but saves to disk the following raster files. They belong to the SpatialGridDataFrame class
  \item{index }{individual label for each grid cell}	
  \item{effect_time }{rate of change in std.dev. of vegetation index per one std.dev. of time; zero if non significant}
  \item{effect_arid }{rate of change in std.dev. of vegetation index per one std.dev. of aridity; zero if non significant}
  \item{veg_response }{significant response of vegetation index to time (1), aridity (2), both (3) or none (4)}
  \item{ta_single }{single correlation coefficient of time and aridity; zero if non significant}
  \item{tv_single }{single correlation coefficient of time and vegetation index; zero if non significant}
  \item{av_single }{single correlation coefficient of aridity and vegetation index; zero if non significant}
  \item{viMeyyyy }{mean annual vegetation index corresponding to year yyyy}
  \item{aiMeyyyy }{mean annual aridity index corresponding to year yyyy}
  \item{timeyyyy }{dummy raster containing year yyyy in each grid cell}
}
\seealso{
\code{\link{rgf.create}}
}
\references{
del Barrio, G., Puigdefabregas, J. Sanjuan, M.E., Stellmes, M. & Ruiz, A. (2010). Assessment and monitoring of land condition in the Iberian Peninsula, 1989-2000. Remote Sensing of Environment, 114: 1817-1832 \url{http://dx.doi.org/10.1016/j.rse.2010.03.009}

Sokal, R. R., & Rohlf, F. J. (1995). Biometry. New York: W.H. Freeman and Co.
}
\author{
Gabriel del Barrio, Marieta SanJuan & Alberto Ruiz
}

