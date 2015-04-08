\name{readr2dRfile}
\alias{readr2dRfile}

\title{
Reads metadata for a concrete r2dRue analysis as specified in its corresponding parameters file
}
\description{
The analysis parameters (names of the raster groups, number of images per time-series, available and analysis periods, number of hydrological years, etc.) are read from the parameters file. Then, the file names within each raster group are read to memory. All that information is also reported to the R console along with basic spatial data such as raster dimensions and resolution, and the PROJ.4 coordinate reference system specification.
}
\usage{
readr2dRfile(conf)
}

\arguments{
  \item{conf}{
Name of an existing parameters file
}
}
\details{
This function is intended to be executed at the beginning of an analysis. For that reason, the sections on assessment and monitoring always report "results not updated". If read2dRfile is executed again within the same session, and a previous analysis has yielded any of these sections updated (which can be checked using showInfo), such information will be erased.
}
\value{
Data are read to memory. Nothing is returned.
}
\author{
Alberto Ruiz, aruiz@eeza.csic.es
}
\seealso{
\code{\link{showInfo}}, \code{\link{editr2dRfile}}, \code{\link{assessment}}, \code{\link{monitoring}}
}
