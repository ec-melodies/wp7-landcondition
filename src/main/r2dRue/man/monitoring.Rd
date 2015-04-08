\name{monitoring}
\alias{monitoring}

\title{
Performs the monitoring component of a r2dRue analysis as specified by its associated parameters
}
\description{
Compute a stepwise regression of vegetation index over aridity index and year order-number. As many points as available hydrological years are made from annual means of these variables, which are first computed from their respective time-series. The results are then saved to corresponding raster files. A batch operation is parameterised from the r2dRue current memory settings (see read2dRfile and showInfo). Rudimentary bars show the computation in progress.
}
\usage{
monitoring(o)
}

\arguments{
  \item{o}{
A r2dRue Object
}
}
\details{
The following r2dRue functions are involved in this computation. Local parameters are left with their respective default values, except those specified in the parameters file as displayed by showInfo:

}
\value{
The following raster files are created resulting from the monitoring operation. They belong to the SpatialGridDataFrame class
  \item{index }{individual label for each grid cell}	
  \item{effect_time }{rate of change in std.dev. of vegetation index per one std.dev. of time; zero if non significant}
  \item{effect_arid }{rate of change in std.dev. of vegetation index per one std.dev. of aridity; zero if non significant}
  \item{veg_response }{significant response of vegetation index to time (1), aridity (2), both (3) or none (4)}
  \item{ta_single }{single correlation coefficient of time and aridity; zero if non significant}
  \item{tv_single }{single correlation coefficient of time and vegetation index; zero if non significant}
  \item{av_single }{single correlation coefficient of aridity and vegetation index; zero if non significant}
  \item{viMe yyyy }{mean annual vegetation index corresponding to year yyyy}
  \item{aiMeyyyy }{mean annual aridity index corresponding to year yyyy}
  \item{timeyyyy }{dummy raster containing year yyyy in each grid cell}
}
\references{
del Barrio, G., Puigdefabregas, J. Sanjuan, M.E., Stellmes, M. & Ruiz, A. (2010). Assessment and monitoring of land condition in the Iberian Peninsula, 1989-2000. Remote Sensing of Environment, 114: 1817-1832 \url{http://dx.doi.org/10.1016/j.rse.2010.03.009}

Sokal, R. R., & Rohlf, F. J. (1995). Biometry. New York: W.H. Freeman and Co.
}
\author{
Gabriel del Barrio, Marieta SanJuan & Alberto Ruiz
}
\seealso{
\code{\link{regStepRaster}}, \code{\link{editr2dRfile}}, \code{\link{readr2dRfile}}, \code{\link{showInfo}}
}
