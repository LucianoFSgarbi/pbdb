\name{pbdb_interval}
\alias{pbdb_interval}
\title{pbdb_interval}
\usage{
pbdb_interval(id, ...)
}
\arguments{
  \item{id}{identifier of the temporal interval. This
  parameter is required.}

  \item{vocab}{set vocab="pbdb" to show the complete name
  of the variables (by default variables have short
  3-letter names)}

  \item{...}{documentation for all the parameters is
  available in
  http://paleobiodb.org/data1.1/intervals/single}
}
\value{
a dataframe with information from a single temporal
interval
}
\description{
Returns information about a single interval, selected by
identifier.
}
\examples{
\dontrun{
pbdb_interval (id=1, vocab="pbdb")

}
}

