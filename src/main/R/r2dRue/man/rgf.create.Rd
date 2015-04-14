\name{rgf.create}
\Rdversion{1.1}
\alias{rgf.create}
\alias{rgf.read}

\title{
Functions to read and write raster group files. 
}
\description{
Raster group files are essential elements for managing information on time-series in r2dRue.
They are simply text lists containing the names of the files of a given time-series.
Because names in such lists follow many times regular and sequential patterns, these functions may facilitate their creation.
}
\usage{
rgf.read(inFl)
rgf.create(prefix,suffix='',ini,fin=ini,monthini=1,output)
}

\arguments{
  \item{inFl}{
Filename of the raster group file to be read.
}
  \item{prefix}{
Prefix for the output filenames.
}
  \item{suffix}{
Suffix for the output filenames.
}
  \item{ini}{
Start year.
}
  \item{fin}{
End year.
}
  \item{monthini}{
Number-order of the start month (integer in the 1 to 12 range).
}
  \item{output}{
Filename to be written to disk.
}
}
\details{
rgf.read reads a raster group file and returns a character vector with the read values.

rgf.create is useful to generate sequences of file names that contain an indicator of the month and year. For example, take the sequence:

Ndvi199001.tif, Ndvi199002.tif ... Ndvi199012.tif, Ndvi199101.tif, Ndvi199102.tif ...

In it, a prefix ("Ndvi") is concatenated to a sequence of years (1990,1991) and months (01,02,...,12), and it ends with a suffix (".tif").
}
\value{
Rgf.read returns a character vector with the filenames in the rgf file.

Rgf.create returns a character vector. If an output file name parameter is specified, then the list is writen to disc.
}
\author{
Alberto Ruiz, aruiz@eeza.csic.es
}
\examples{
rgf.create('ndvi','.rst',1970,1975,output='ndvi.rgf')
ndvifiles=rgf.read('ndvi.rgf')

}
