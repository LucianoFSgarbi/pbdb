\name{pbdb_strata_auto}
\alias{pbdb_strata_auto}
\title{pbdb_strata_auto}
\usage{
pbdb_strata_auto(id, ...)
}
\arguments{
  \item{name}{A full or partial name. You can use % and _
  as wildcards, but the query will be very slow if you put
  a wildcard at the beginning}

  \item{rank}{Return only strata of the specified rank:
  formation, group or member.}

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

  \item{loc}{Return only strata associated with some
  occurrence whose geographic location falls within the
  specified geometry, specified in WKT format.}

  \item{vocab}{set vocab="pbdb" to show the complete name
  of the variables (by default variables have short
  3-letter names)}

  \item{...}{documentation for all the parameters is
  available in http://paleobiodb.org/data1.1/strata/auto}
}
\value{
a dataframe with information from the strata that matches
our letters.
}
\description{
Returns a list of strata matching the given prefix or
partial name. This can be used to implement auto-completion
for strata names, and can be limited by geographic location
if desired.
}
\examples{
\dontrun{
pbdb_strata_auto (name= "Pin", vocab="pbdb")

}
}

