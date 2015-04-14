\name{assessment}
\alias{assessment}

\title{
Performs the assessment component of a r2dRue analysis as specified by its associated parameters
}
\description{
Computes Mean Observed RUE, Mean Observed Aridity, Extreme Observed RUE and Extreme Observed Aridity, and saves the results to corresponding raster files. 
A batch operation is parameterised from the r2dRue current memory settings (see read2dRfile and showInfo).  

Rudimentary bars show the computation in progress.
}
\usage{
assessment(o)
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
The following raster files are created resulting from the assessment operation. They belong to the SpatialGridDataFrame class
  \item{rueObsMe }{Mean Observed rain Use Efficiency}
  \item{rueObsEx }{Extreme Observed Rain Use Efficiency}
  \item{aiObsMe }{Mean Observed Aridity Index}
  \item{aiObsEx }{Extreme Observed Aridity Index}
}
\references{
del Barrio, G., Puigdefabregas, J. Sanjuan, M.E., Stellmes, M. & Ruiz, A. (2010). Assessment and monitoring of land condition in the Iberian Peninsula, 1989-2000. Remote Sensing of Environment, 114: 1817-1832 \url{http://dx.doi.org/10.1016/j.rse.2010.03.009}
}
