\name{pbdb_occurrence}
\alias{pbdb_occurrence}
\title{pbdb_occurrence}
\usage{
pbdb_occurrence(id, ...)
}
\arguments{
  \item{id}{identifier of the occurrence. This parameter is
  required.}

  \item{...}{documentation for all the parameters is
  available in http://paleobiodb.org/data1.1/occs/single
  Below, we describe the most common filters that
  paleontologists and ecologists might use.}

  \item{vocab}{set vocab="pbdb" to show the complete name
  of the variables (by default variables have short
  3-letter names)}

  \item{show}{to show extra variables (e.g. coords)}
}
\value{
a dataframe with a single occurrence
}
\description{
Returns information about a single occurrence record from
the Paleobiology Database.
}
\examples{
\dontrun{
pbdb_occurrence (id=1001)
pbdb_occurrence (id=1001, vocab="pbdb", show="coords")
}
}

