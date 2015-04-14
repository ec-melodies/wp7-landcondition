\name{showInfo}
\alias{showInfo}

\title{
Shows the metadata and status of a concrete r2dRue analysis as specified by its associated parameters
}
\description{
Reports to the R console the details stored in memory (not in a file) of the current r2dRue analysis. Five types of information are displayed: analysis parameters (names of the raster groups, number of images per time-series, available and analysis periods, number of hydrological years, etc.), raster group information (location and names of all the files making the different time-series), spatial information (raster dimensions and resolution, and the PROJ.4 coordinate reference system), assessment results if any (basic statistics of the main four output rasters), and monitoring results if any (basic statistics of the main seven output rasters).
}
\usage{
showInfo(o)
}

\arguments{
  \item{o}{A r2dRue Object}
}
\details{
In contrast with read2dRfile, showInfo can be executed at any moment within an analysis, and its details will be updated as assessment and monitoring are executed.

The information displayed by showInfo (not the output data, only the status report) will be lost if read2dRfile is executed again.

The status report will be lost anyway after closing the current session. If that information must be preserved, for example for documentation purposes, save it to a text file. If the analysis itself is to be preserved, write the r2dRue object (see Arguments section) to a file.

The information reported by showInfo and read2dRfile is very similar. The difference is that the former mirrors the memory settings, whilst the latter reads data from a file .
}

\seealso{
\code{\link{readr2dRfile}}, \code{\link{editr2dRfile}}, \code{\link{assessment}}, \code{\link{monitoring}}
}
