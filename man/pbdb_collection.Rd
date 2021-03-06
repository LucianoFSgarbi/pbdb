\name{pbdb_collection}
\alias{pbdb_collection}
\title{pbdb_collection}
\usage{
pbdb_collection(id, ...)
}
\arguments{
  \item{id}{identifier of the collection. This parameter is
  required.}

  \item{vocab}{set vocab="pbdb" to show the complete name
  of the variables (by default variables have short
  3-letter names)}

  \item{show}{to show extra variables (e.g. "loc" to show
  additional information about the geographic locality of
  the collection)}

  \item{...}{documentation for all the parameters is
  available in http://paleobiodb.org/data1.1/colls/single
  go to ?pbdb_occurrences to see an explanation about the
  main filtering parameters}
}
\value{
a dataframe with a single occurrence
}
\description{
Returns information about a single collection record from
the Paleobiology Database.
}
\examples{
\dontrun{
pbdb_collection (id=1003, vocab="pbdb", show="loc")

}
}

