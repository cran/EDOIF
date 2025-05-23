% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotGraphphics.R
\name{plotGraph}
\alias{plotGraph}
\title{plotGraph function}
\usage{
plotGraph(obj, rankFlag = TRUE)
}
\arguments{
\item{obj}{is an object of EDOIF class that contains the results of ordering inference.}

\item{rankFlag}{is an option for including ranks of categories with in the plot: default is TRUE for including ranks.}
}
\value{
This function returns a list of an object of iGraph for a dominant-distribution network and its plot variable.

\item{graphVar}{ An object of iGraph for a dominant-distribution network }
}
\description{
plotGraph is a support function for plotting a dominant-distribution network from an adjacency matrix.
}
\examples{
# Generate simulation data with 100 samples per categories

simData<-SimNonNormalDist(nInv=100)

# Performing ordering infernce from simData

resultObj<-EDOIF(simData$Values,simData$Group)

# Plot a dominant-distribution network and return a list of an iGraph object

iGraphList<-plotGraph(obj=resultObj)

}
