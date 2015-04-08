\name{rgf.summary}
\Rdversion{1.1}
\alias{rgf.summary}
\alias{rgf.when}
\title{
Extract summaries from time-series specified as raster group files.
}
\description{
These functions query the time-series specified in a raster group file and save the selected summary in a new raster.
Summaries refer to the population of values of each grid cell across the time-series.

rgf.summary computes summaries, and rgf.when finds at which moment (ie. order No. in the time-series) the selected summary is located.

}
\usage{
rgf.summary(inFl, outFl, step= length(inFl), fun = "SUM", silent = FALSE, ...)
rgf.when(inFl, ref, order = "FIRST", silent = FALSE)
}

\arguments{
  \item{inFl}{
Raster group file with the file names of the input time-series.
}
  \item{outFl}{
Raster group file with the file names of the output time-series.
}
  \item{step}{
Number of images taken for each summary.
If a value is not supplied, the summary is made on the complete time-series.
}
  \item{fun}{
Summary function SUM, MAX, MIN, MEAN, COUNT, RANGE, SD, VAR,MEDIAN.
}
  \item{ref}{
The reference image.
}
  \item{order}{
"FIRST" or "LAST"; to find the first or the last occurrence in the time-series. 
}
  \item{silent}{
logical; if TRUE, comment and non-fatal CPL driver errors are suppressed.
}
  \item{\dots}{
Any unmatched parameter will be passed to the writeGDAL function.
}
}
\details{
Any summary can be computed for the entire set, or for a subset of images.
For example, let a time-series made of 36 images representing monthly NDVI.
The maximum NDVI found at each grid cell could be computed for the entire series (step not specified), for each year of the series (step = 12), or quarterly (step = 3).
The corresponding summary images are then saved to raster files.

rgf.when compares a reference image with the images in the time-series (or a subset of it), and returns a composite image where each grid cell contains the order-number at which its reference value is found.  

}
\value{
rgf.summary does not returns any value, but writes to disk the solicited summaries.

rgf.when returns a composite raster image as a SpatialGridDataFrame.
}
\seealso{
\code{\link{rgf.create}}
}
\author{
Alberto Ruiz, aruiz@eeza.csic.es
}
\examples{
#not work...
#rgf.create('ndvi','.rst',1970,1975,output='ndvi.rgf')
#ndvifiles=rgf.read('ndvi.rgf')
#rgf.summary(ndvifiles,'maxNdvi.rst',fun='MAX', drivername='RST')
#Anualnames=paste('maxNdvi',1970:1975,sep='_')
#maxNdvi=rgf.summary(ndvifiles,AnualNames, step=12,fun='MAX',drivername='RST')

}
