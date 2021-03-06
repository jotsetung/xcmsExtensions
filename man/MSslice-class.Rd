\name{MSslice-class}
\Rdversion{1.1}
\docType{class}
\alias{MSslice-class}
\alias{MSslice}
\alias{show,MSslice-method}
\alias{intrange,MSslice-method}
\alias{msSlice}
\alias{msSlice,list-method}
\alias{msSlice,xcmsSet-method}
\alias{msSlice,xcmsRaw-method}
\alias{msSlice,MSdata-method}
\alias{mzrange,MSslice-method}
\alias{rtrange,MSslice-method}
\alias{msData,MSslice-method}
\alias{length,MSslice-method}
\alias{getChromatogram,MSslice-method}
\alias{plotChromatogram,MSslice-method}
\alias{getSpectrum,MSslice-method}
\alias{plotSpectrum,MSslice-method}
\alias{subset,MSslice-method}
\alias{names,MSslice-method}
\alias{names<-,MSslice-method}
\alias{names<-,MSslice,ANY-method}
\alias{[,MSslice,ANY,ANY,ANY-method}
\alias{[[,MSslice,ANY,ANY-method}
%% Data manipulation stuff...
\alias{binMz,MSslice-method}
\alias{binRtime,MSslice-method}
\alias{binMzRtime,MSslice-method}
%%
\alias{assayData,MSslice-method}
\alias{assayData<-,MSslice-method}
\alias{assayData<-,MSslice,ANY-method}
\alias{phenoData,MSslice-method}
\alias{phenoData<-,MSslice-method}
\alias{phenoData<-,MSslice,ANY-method}
\alias{pData,MSslice-method}
\alias{pData<-,MSslice-method}
\alias{pData<-,MSslice,ANY-method}
\alias{$,MSslice-method}

\title{MS data subsets of several samples}

\description{
  Sub-sets of an MS run across several samples can be stored in a
  \code{MSslice} object. Such a slice of the MS data is defined by an
  m/z and a retention time range in each sample. The actual data of the
  slice in each sample is stored as \code{\link{MSdata}} object, i.e. as
  intensities for each mz/rt tuple measured in a sample.
  Depending on the measurements, the actual mz/rt ranges in each
  individual \code{\link{MSdata}} can be slightly different, but all are
  within the mz and rt range of the \code{MSslice} object (that can be
  returned by the \code{mzrange} and \code{rtrange} method).
}

\section{Objects of the class}{
  While \code{MSslice} objects can be created by the constructor
  function \code{MSslice} the default way to create such an object is by
  using the \code{msSlice} method on an \code{\link[xcms]{xcmsSet}} (or
  \code{\link[xcms]{xcmsRaw}}) object.
}
\usage{


\S4method{assayData}{MSslice}(object)

\S4method{assayData}{MSslice}(object) <- value

\S4method{binMzRtime}{MSslice}(object, FUN=max, mzNbin=NULL,
          mzBinSize=NULL, rtNbin=NULL, rtBinSize=NULL)

\S4method{binRtime}{MSslice}(object, FUN=max, bins=NULL, nbin=NULL,
                            binSize=NULL)

\S4method{getChromatogram}{MSslice}(object, FUN=max, bins=NULL,
                           nbin=NULL, binSize=NULL, ...)

\S4method{getSpectrum}{MSslice}(object, FUN=max, bins=NULL,
                                nbin=NULL, binSize=NULL, ...)

\S4method{intrange}{MSslice}(object)

\S4method{length}{MSslice}(x)

MSslice(x, ...)

\S4method{msData}{MSslice}(object, ...)

\S4method{msSlice}{list}(object, ...)

\S4method{msSlice}{MSdata}(object, ...)

\S4method{msSlice}{xcmsSet}(object, mzrange=NULL, rtrange=NULL,
                            rt="corrected", BPPARAM=MulticoreParam())

\S4method{msSlice}{xcmsRaw}(object, mzrange=NULL, rtrange=NULL, ...)

\S4method{mzrange}{MSslice}(object)

\S4method{names}{MSslice}(x)

\S4method{names}{MSslice}(x) <- value

\S4method{phenoData}{MSslice}(object)

\S4method{phenoData}{MSslice}(object) <- value

\S4method{pData}{MSslice}(object)

\S4method{pData}{MSslice}(object) <- value

\S4method{plotChromatogram}{MSslice}(object, FUN=max, bins=NULL,
                            nbin=NULL, binSize=NULL,
                            main=paste(format(mzrange(object), 2),
                            collapse="-"), xlab="Retention time",
                            ylab="Intensity", col=1, lty=1, ...)

\S4method{plotSpectrum}{MSslice}(object, FUN=max, bins=NULL,
                                 nbin=NULL, binSize=NULL,
                                 main=paste(format(rtrange(object), 2),
                                 collapse="-"), xlab="M/Z",
                                 ylab="Intensity", col=1, lty=1, ...)

\S4method{rtrange}{MSslice}(object)

\S4method{subset}{MSslice}(x, mzrange=NULL, rtrange=NULL)
}
\arguments{

  (in alphabetic order)

  \item{bins}{
    For \code{getChromatogram}, \code{getSpectrum},
    \code{plotChromatogram}, \code{plotSpectrum}, \code{binMz} and \code{binRtime}: numeric
    vector specifying the bins to bin the retention time. See
    \code{getChromatogram} method description for \code{\link{MSdata}}
    objects for more details on the binning.
  }

  \item{binSize}{
    For \code{getChromatogram}, \code{getSpectrum},
    \code{plotChromatogram}, \code{plotSpectrum}, \code{binMz} and \code{binRtime}: numeric
    (length 1) specifying the bin width/size. See
    \code{getChromatogram} method description for \code{\link{MSdata}}
    objects for more details on the binning.
  }

  \item{FUN}{
    For \code{getChromatogram}, \code{getSpectrum},
    \code{plotChromatogram}, \code{plotSpectrum}, \code{binMz},
    \code{binMzRtime} and \code{binRtime}: function
    that should be used to aggregate intensities within a bin. By
    default the largest intensity within a bin is selected. See
    \code{getChromatogram} method description for \code{\link{MSdata}}
    objects for more details on the binning.
  }

  \item{BPPARAM}{
    Parallel processing parameters; see
    \code{\link[BiocParallel]{bpparam}} for more information. Note that
    parallel processing will most likely not work with the \code{snow},
    thus, on Windows machines there will no parallel processing be
    available.
  }

  \item{col}{
    For \code{plotChromatogram} and \code{plotSpectrum}: a single color or vector specifying
    colors for each sample/\code{MSdata} object in the \code{MSslice}.
  }

  \item{lty}{
    For \code{plotChromatogram} and \code{plotSpectrum}: a numeric specifying the line type for
    each sample/\code{MSdata} object in the \code{MSslice}; if
    \code{lty} has length of 1, this line type will be used for all
    lines.
  }

  \item{main}{
    For \code{plotChromatogram} and \code{plotSpectrum}: the title of the plot.
  }

  \item{mzNbin}{
    For \code{binMzRtime}: numeric (length 1) specifying the number of
    bins to bin the M/Z range. See also argument \code{bin}.
  }

  \item{mzBinSize}{
    For \code{binMzRtime}: numeric (length 1) specifying the size of
    the bins along M/Z range. See also argument \code{binSize}.
  }

  \item{mzrange}{
    A numeric vector defining the m/z-value range of the slice.
  }

  \item{nbin}{
    For \code{getChromatogram}, \code{getSpectrum},
    \code{plotChromatogram}, \code{plotSpectrum}, \code{binMz} and \code{binRtime}: numeric
    (length 1) specifying the number of bins in which the retention time
    range should be binned. See \code{getChromatogram} method
    description for \code{\link{MSdata}} objects for more details on the
    binning.
  }

  \item{object}{
    For \code{msSlice}: either a \code{list} of \code{\link{MSdata}}
    objects, an \code{\link[xcms]{xcmsSet}} or
    \code{\link[xcms]{xcmsRaw}} object.

    For all other methods a \code{MSslice} object.
  }

  \item{rt}{
    For \code{msSlice}: either \code{"raw"} or \code{"corrected"} to
    specify whether the raw or retention-time corrected scan times
    should be used.
  }

  \item{rtNbin}{
    For \code{binMzRtime}: numeric (length 1) specifying the number of
    bins to bin the retention time range. See also argument \code{bin}.
  }

  \item{rtBinSize}{
    For \code{binMzRtime}: numeric (length 1) specifying the size of
    the bins along retention time range. See also argument \code{binSize}.
  }

  \item{rtrange}{
    A numeric vector defining the retention time range of the slice.
  }

  \item{value}{
    For \code{names}: a character vector (length matching the number of
    \code{\link{MSdata}} objects in the \code{@assayData} slot) specifying
    names of the individual objects.

    For \code{assayData}: a \code{\link{MSdata}} object or a \code{list}
    of such objects.

    For \code{phenoData}: a \code{data.frame} or
    \code{AnnotatedDataFrame} providing the phenotypic annotation of the
    samples (covariates etc).

    For \code{pData}: a \code{data.frame} providing the phenotypic
    annotation of the samples.
  }

  \item{x}{
    For \code{length}, \code{names} and \code{subset}: an \code{MSslice}
    object.

    For \code{MSslice}: a \code{MSdata} or a list of \code{MSdata} objects.
  }

  \item{xlab}{
    For \code{plotChromatogram} and \code{plotSpectrum}: the label for the x-axis.
  }

  \item{ylab}{
    For \code{plotChromatogram} and \code{plotSpectrum}: the label for the y-axis.
  }

  \item{...}{
    For \code{MSslice}: additional arguments passed to the constructor
    (i.e. \code{experimentData} or \code{phenoData}).

    For \code{plotChromatogram}: additional graphical parameters to be
    passed down to the base plot function.

    Ignored for all other methods.
  }

}
\section{Slots}{
  \describe{
    \item{assayData}{
      A list of \code{\link{MSdata}} objects.
    }

    \item{experimentData}{
      Object of class \code{\link[MSnbase]{MIAPE}} containing details of
      experimental methods.
    }

    \item{mzrange}{
      A numeric vector of length 2 specifying the range of m/z
      values of the slice.
    }

    \item{phenoData}{
      An \code{AnnoatedDataFrame} providing the sample description.
    }

    \item{rtrange}{
      A numeric vector of length 2 specifying the retention time range
      of the slice.
    }

  }
}
\section{Extends}{
  Class \code{"Versioned"} defined in the \code{Biobase} package, directly.
}

\section{Constructors and alike}{
  \describe{

    \item{MSslice}{
      Constructor method to create a new \code{MSslice} instance
      accepting either a list of \code{\link{MSdata}} objects or
      a single \code{\link{MSdata}} object. All additional arguments
      (e.g. \code{phenoData}, \code{experimentData})
      are directly passed to the \code{"new"} call.
    }

    \item{msSlice}{
      Extract an \code{msSlice} object from an
      \code{\link[xcms]{xcmsRaw}} or \code{\link[xcms]{xcmsSet}}
      object. The latter (i.e. extraction from an \code{xcmsSet} object)
      is the \emph{default} constructor that will be mostly used. It
      allows to extract intensity values for the m/z and rt range that
      defines the slice of MS data from each individual sample. The
      result is returned as an \code{MSslice} object. If multiple mz and
      rt ranges are specified (i.e. arguments \code{mzrange} and
      \code{rtrange} are 2-column matrices, each row specifying a
      different range) the result will be returned as an
      \code{\link{MSsliceList}} object.

      Note that the \code{mzrange} and \code{rtrange} of each of the
      extracted \code{\link{MSdata}} for each sample will be slightly
      different, but all are \emph{within} the \code{mzrange} and
      \code{rtrange} of the \code{MSslice} object.

      If \code{object} is an \code{MSdata} object it wraps that into an
      \code{MSslice} object.
    }

  }
}

\section{Accessing and subsetting}{
  \describe{

    \item{assayData,assayData<-}{
      Get and set the assay data (i.e. the list of internal
      \code{MSdata} objects). This method is the same than the
      \code{msData} method.
    }

    \item{getChromatogram}{
      Extracts a numeric matrix with the chromatogram (i.e. intensities
      along the retention time dimension) for each of the \code{MSdata}
      object and hence samples of the \code{MSslice} object. The
      rownames of the matrix represent the (unique) retention times and
      each column contains the spectrum of one sample/\code{MSdata}
      object (i.e. the intensities aggregated in m/z direction for the
      respective retention time using the aggregation function specified
      with argument \code{FUN}).

      In the default settings, without specifying any of the arguments
      \code{bins}, \code{nbin} or \code{binSize}, the method returns a
      matrix with one row for each unique retention time across all of
      the samples. Each row will only contain a numeric value for a
      sample in which a signal was measured for that specific retention
      time. In most instances it will be better to specify \code{nbin}
      or \code{binSize}, to bin values also along the retention time
      dimension. Ideally, the binning should not be too coarse, but also
      not too detailed (in which case the matrix will again be
      relatively sparse); a binning with a \code{binSize=1} (i.e. one
      second), or slightly smaller, might be OK in most instances.

      For more details on the binning see the help for the
      \code{getChromatogram} method of \code{\link{MSdata}} objects.
    }

    \item{getSpectrum}{
      Extracts a numeric matrix with the spectrum (i.e. intensities
      along the M/Z dimension) for each of the \code{MSdata} objects and
      hence samples of the \code{MSslice} object. The rownames of the
      matrix represent the distinct M/Z values and columns the
      individual samples. For more details (e.g. also on binning etc)
      see the help of the \code{getChromatogram} method above.
    }

    \item{intrange}{
      Get the range of intensity values of the slice. This represents the range of
      values across all samples (i.e. all \code{MSdata} objects within
      the \code{MSslice}). Returns a numeric of length
      2, or \code{c(NA, NA)} if the object is empty (or the internal
      \code{MSdata} object(s) don't contain any data).
    }

    \item{length}{
      Get the length of the object, i.e. the number of \code{MSdata}
      object stored within the object.
    }

    \item{msData}{
      Get the \code{list} of \code{\link{MSdata}} objects.
    }

    \item{mzrange}{
      Get the m/z value range of the slice. This represents the range of
      values across all samples (i.e. all \code{MSdata} objects within
      the \code{MSslice}). Returns a numeric of length
      2, or \code{c(NA, NA)} if the object is empty (or the internal
      \code{MSdata} object(s) don't contain any data).
    }

    \item{names,names<-}{
      Get and set the names of the \code{\link{MSdata}} objects.
    }

    \item{object[i]}{
      Subsets the \code{MSslice} object \emph{object} and returns an
      \code{MSslice} object with only the elements selected by
      \code{i}. \code{i} can be an integer vector or a character vector,
      if names are available in \code{object}.
    }

    \item{object[[i]]}{
      Extract e single \code{\link{MSdata}} object from the
      \code{MSslice} \emph{object}.
    }

    \item{phenoData,phenoData<-,pData,pData<-}{
      Get and set the pheno data, i.e. the \code{AnnotatedDataFrame}
      providing the sample annotation (phenotypic information and
      covariates). Each row describing one sample each column
      representing one covariate. The ordering is assumed to be
      identical to the ordering of the \code{MSdata} objects in the
      \code{assayData} slot.

      The \code{pData} method accesses the same slot, but returns (and
      accepts) a \code{data.frame}.
    }

    \item{rtrange}{
      Get the retention time range of the slice. This represents the range of
      values across all samples (i.e. all \code{MSdata} objects within
      the \code{MSslice}). Returns a numeric of length
      2, or \code{c(NA, NA)} if the object is empty (or the internal
      \code{MSdata} object(s) don't contain any data).
    }

    \item{subset}{
      Subset the \code{MSslice} based on the specified M/Z and retention
      time ranges. The method returns a \code{MSslice} object.
    }
  }
}

\section{Data visualizations}{
  \describe{
    \item{plotChromatogram}{
      Plots the chromatogram of the rt-m/z slice across all of the
      \code{MSdata} objects (i.e. samples). The arguments \code{col} and
      \code{lty} can be used to use a different color for each line
      (i.e. sample) or a different line type. See description of the
      \code{getChromatogram} for details on the other parameters.
    }

    \item{plotSpectrum}{
      Plots the spectrum; see help of \code{plotChromatogram} above.
    }
  }
}

\section{Data manipulations}{
  \describe{
    \item{binMz}{
      This method cuts the M/Z range of an \code{MSslice} object in equal
      spaced bins and aggregates all intensity values with an M/Z value
      falling within the bin and the same retention time.

      For details on the method arguments and the binning see the help
      for the \code{getChromatogram} method.

      The method returns an \code{MSslice} object.
    }

    \item{binMzRtime}{
      This method performs a binning first in M/Z dimension followed by
      a retention time binning.

      For details on binning see the \code{getChromatogram} method.

      The method returns a \code{MSslice} object with the data binned
      both on M/Z and retention time dimension.
    }

    \item{binRtime}{
      Same as the \code{binMz} method, but for binning along the
      retention time dimension.

      The method returns an \code{MSslice} object.
    }
  }
}

\value{
  Refer to the method and function description above for detailed
  information on the returned result object.
}
\author{
  Johannes Rainer.
}
\seealso{
  \code{\link[xcms]{xcmsSet}}, \code{\link[xcms]{xcmsRaw}},
  \code{\link{MSdata}}, \code{\link{MSsliceList}}
}
\examples{

## Load the faahKO package with the test data for the xcms package.
library(faahKO)
xset <- faahko

## Define a data sub-set and extract the corresponding values from
## the xcmsSet object. This will extract the intensity values of the
## defined slice from each individual sample.
rtr <- c(2600, 2670)
mzr <- c(300, 400)
mss <- msSlice(xset, rtrange=rtr, mzrange=mzr)

## Access the phenoData
phenoData(mss)

## Access individual columns using the $ method
mss$class

## Get the number of samples
length(mss)

## We don't have any names yet
names(mss)
## Setting the names using the ones provided by the sampnames method of the
## xcmsSet object.
names(mss) <- sampnames(xset)
names(mss)

## Subset to samples with name starting with wt
mssSub <- mss[grep(names(mss), pattern="^wt")]
names(mssSub)

## Extract a single MSdata object
mssSub[["wt18"]]

## Get the mz, rt and intensity range. This corresponds to the range of
## values of the slice across all samples.
mzrange(mss)
rtrange(mss)
intrange(mss)

## Extract the list of MSdata objects
msData(mss)

## Extract the chromatogram of a m/z-rt slice across all samples.
## Defining the mz and rt ranges for the peak in the xcms
## vignette (Figure 4).
mzr <- c(302, 302.5)
rtr <- c(2500, 2700)
mss <- msSlice(xset, rtrange=rtr, mzrange=mzr)

## We're getting a sparse matrix if we're not binning along the rt-dimension,
## since the retention times of the individual data points are slightly different
## between the samples:
head(getChromatogram(mss))

## We're next binning the values in retention time-bins of size 1 (1 second). By default
## (with FUN=max), the maximal signal is used for each bin.
chrM <- getChromatogram(mss, binSize=1)
dim(chrM)
head(chrM)

## We can also create an image from this matrix. Each column represents the chromatogram
## from one sample, each row one retention time bin with the intensity being color coded.
image(t(chrM))

## Next we plot the chromatogram of the slice across all samples.
## Without any binning:
plotChromatogram(mss, col="#00000080", type="l")

## And with binning.
plotChromatogram(mss, binSize=1, col="#00000080", type="l")

## Extracting the full MS data from the xcmsSet to create base peak chromatogram (BPC)
## and total ion chromatogram (TIC) plot of all samples.
msFull <- msSlice(xset)

## Base peak chromatogram with 1 second binning
plotChromatogram(msFull, binSize=1, col="#00000080", type="l")

## Total ion chromatogram with 1 second binning
plotChromatogram(msFull, FUN=sum, binSize=1, col="#00000080", type="l")

## Extending the M/Z range of the slice and extracting and plotting also the spectrum.
mzr <- c(300, 303)
mss <- msSlice(xset, rtrange=rtr, mzrange=mzr)

## Get the spectrum without binning:
head(getSpectrum(mss))

## We can also extract a slice from an xcmsRaw object, which will then
## contain the data only of that individual sample. Without specifying an
## mzrange and rtrange we extract the full data.
msSlice(getXcmsRaw(xset, 1))

par(mfrow=c(1, 2))
plotChromatogram(mss, binSize=1, col="#00000080", type="l")
plotSpectrum(mss, col="#00000040", type="h")

## Or from an MSdata object; extracting first a MSdata object containing
## the *full* MS data from a single file and creating then an MSslice object
## from that.
msd <- msData(getXcmsRaw(xset, 1))
msSlice(msd)

## Extracting the MSdata from the second sample and passing both to the
## MSslice constructor to generate a two-sample MSslice object.
msd2 <- msData(getXcmsRaw(xset, 2))
MSslice(list(msd, msd2))


####-------------
##  Data manipulations

## We bin the MSslice object in 5 second retention time bins along the
## retention time dimension. Each MSdata object within the MSslice is
## binned in the same bins.
mssB <- binRtime(mss, binSize=5)
mss
mssB

}
\keyword{classes}

