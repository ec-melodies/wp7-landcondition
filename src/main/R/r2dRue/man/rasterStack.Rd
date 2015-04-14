\name{rasterStack}
\Rdversion{1.1}
\alias{rasterStack}
\title{
Stacks bands from raster image files
}
\description{
Concatenates multiple raster files into a single file. Provides support to several interleaved schemas: BIP (Bands Interleaved by Pixel), BIL (Band Interleaved by Line) or BSQ (Band Sequential). The output concatenated file may be saved in Ascii or binary format.
}
\usage{
rasterStack(inFl, outFN, asc = FALSE, zip = FALSE, dec = 3, 
interleave = "BIP", silent = FALSE)
}
\arguments{
  \item{inFl}{
List with the name of the files to be concatenated
}
  \item{outFN}{
Name for the output file
}
  \item{asc}{
Logical. If TRUE the output is an ASCII file
}
  \item{zip}{
Logical. If TRUE the output is zipped. Only used if asc is TRUE.
}
  \item{dec}{
Integer. If present, the output values are rounded to the specified number of decimal places. Only used if asc is TRUE.
}
  \item{interleave}{
The interleave format. BIP, BIL or BSQ.
}
  \item{silent}{
Logical. If TRUE, comment and non-fatal CPL driver errors are suppressed.
}
}
\details{
In binary mode (default), the data is stored as 32bit floating point number.
Only the first band of each image is used.
This function is not intended to be of general utility. It is used in internal processes to arrange image data into a format that is optimum for the process.

}
\value{
An ASCII or binary file.
}

\author{
Alberto Ruiz. aruiz@eeza.csic.es
}
