\name{pbdb_occurrences}
\alias{pbdb_occurrences}
\title{pbdb_occurrences}
\usage{
pbdb_occurrences(...)
}
\arguments{
  \item{...}{documentation for all the parameters is
  available in http://paleobiodb.org/data1.1/occs/list
  Below, we describe the most common filters that
  paleontologists and ecologists might use.}

  \item{limit}{set limit to "all" to download all the
  occurrences. By defauls the limit is 500.}

  \item{taxon_name}{Return only records associated with the
  specified taxonomic name(s). You may specify multiple
  names, separated by commas.}

  \item{base_name}{Return records associated with the
  specified taxonomic name(s) and any of their children
  (e.g. base_name="Canis" will return "Canis", "Canis
  lupus", "Canis mosbachensis", etc.)}

  \item{lngmin}{numeric. The longitude boundaries will be
  normalized to fall between -180 and 180. (Note that if
  you specify lngmin then you must also specify lngmax).
  Return only records whose geographic location falls
  within the given bounding box (defined by lngmin, lngmax,
  latmin, latmax). It generate two adjacent bounding boxes
  if the range crosses the antimeridian.}

  \item{lngmax}{numeric. The longitude boundaries will be
  normalized to fall between -180 and 180.}

  \item{latmin}{numeric. between -90 and 90. (Note that if
  you specify latmin then you must also specify latmax)}

  \item{latmax}{numeric. between -90 and 90.}

  \item{min_ma}{return only records whose temporal locality
  is at least this old, specified in Ma.}

  \item{max_ma}{return only records whose temporal locality
  is at most this old, specified in Ma.}

  \item{interval}{return only records whose temporal
  locality falls within the named geologic time interval
  (e.g. "Miocene").}

  \item{continent}{return only records whose geographic
  location falls within the specified continent(s).}

  \item{show}{to show extra variables (e.g. coords)}
}
\value{
a dataframe with the species occurrences
}
\description{
Returns information about species occurrence records stored
in the Paleobiology Database.
}
\examples{
\dontrun{
pbdb_occurrences (id=c(10, 11))
pbdb_occurrences (limit="all", vocab= "pbdb", taxon_name="Canis", show="coords")
pbdb_occurrences (limit="all", vocab= "pbdb", base_name="Canidae", show="coords")
}
}

