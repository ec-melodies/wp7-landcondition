\name{editr2dRfile}
\alias{editr2dRfile}

\title{
Enter the parameters of a concrete r2dRue analysis and store them in a file.
}
\description{
This function facilitates the at once specification of all the parameters corresponding to a given r2dRue analysis. The parameters are saved to a text file that may be subsequently read by read2dRfile() to perform the analysis in batch mode.
}
\usage{
editr2dRfile(conf = "")
}

\arguments{
  \item{conf}{Name of the parameters file to be created or edited.}
}
\details{
	\enumerate{
		\item{The user is prompted with questions to enter the following parameters. Default values are suggested if editing an existing parameters file.
			\describe{
  			\item{comment	}{Description of this run. 255 characters maximum} 
  			\item{pOut }{Output directory. Specify the full path}
  			\item{viRgf }{Name of the Vegetation Index raster group}
  			\item{rainRgf }{Name of the precipitation raster group}
  			\item{petRgf }{Name of the Potential Evapo-Transpiration raster group}
  			\item{sYear }{Start moment (year) of these raster groups. Format: yyyy}
  			\item{sMonth }{Start moment (month) of these raster groups. Format: mm}
  			\item{mHidro }{Start month of hydrological year}
  			\item{acum }{Number of cumulative months for preceding rain}
  			\item{yIni }{Start year of this run}
  			\item{yEnd }{End year of this run}
  			\item{driver }{GIS format for raster images. A GDAL driver name}
  			\item{flag }{Missing value flag for raster images}
  		}
		}
		\item{
			The output file can be also edited with a text editor.
		}
		\item{
			It is recommended to set a new output directory if any parameter is changed for a new analysis of the same dataset. Otherwise, existing results will be overwritten.
		}
		\item{
			Raster groups contain sequences of file names associated with their respective time-series. It is assumed here that time-series: start at the same moment and match in length ; are at a monthly resolution; and have no gaps in between.
		}
		\item{
			A summary of the available time-series and number of hydrological years is offered just before the user is prompted to enter the parameters of a particular run.
		}
	}
}
\seealso{
\code{\link{batchPetHgsm}}, \code{\link{rgf.create}}, \code{\link{readr2dRfile}}, \code{\link{showInfo}}
}
