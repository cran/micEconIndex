\name{priceIndex}
\alias{priceIndex}
\title{Calculate Price Indices}

\description{
   Calculates a Laspeyres, Paasche or Fisher price index.
}

\usage{
   priceIndex( prices, quantities, base, data, method = "Laspeyres",
      na.rm = FALSE, weights = FALSE )
}

\arguments{
   \item{prices}{Vector that contains the names of the prices.}
   \item{quantities}{Vector that contains the names of the quantities that
      belong to the \code{prices}.}
   \item{base}{The base period(s) to calculate the indices (see details).}
   \item{data}{Dataframe that contains the prices and quantities.}
   \item{method}{Which price index: "Laspeyres", "Paasche" or "Fisher".}
   \item{na.rm}{a logical value passed to '\code{mean()}' when
      calculating the \code{base}.}
   \item{weights}{logical. Should an attribute 'weights' that contains the
      relatives weights of each quantity be added?}
}

\details{
   The argument \code{base} can be either \cr
   (a) a single number: the row number of the base prices and quantities, \cr
   (b) a vector indicating several observations: The means of these
   observations are used as base prices and quantities, or \cr
   (c) a logical vector with the same length as the \code{data}: The
   means of the observations indicated as 'TRUE' are used as base prices
   and quantities.

   If any values used for calculating the price index
   (e.g. current quantities, base quantities, current prices or base prices)
   are not available (NA),
   they are ignored (only) if they are multiplied by zero.
}

\value{
   a vector containing the price indices.
}

\seealso{\code{\link{quantityIndex}}.}

\author{Arne Henningsen}

\examples{
if( requireNamespace( 'micEcon', quietly = TRUE ) ) {
   data( Missong03E7.7, package = "micEcon" )
   # Laspeyres Price Indices
   priceIndex( c( "p.beef", "p.veal", "p.pork" ),
      c( "q.beef", "q.veal", "q.pork" ), 1, Missong03E7.7 )
   # Paasche Price Indices
   priceIndex( c( "p.beef", "p.veal", "p.pork" ),
      c( "q.beef", "q.veal", "q.pork" ), 1, Missong03E7.7, "Paasche" )

   data( Bleymueller79E25.1, package = "micEcon" )
   # Laspeyres Price Indices
   priceIndex( c( "p.A", "p.B", "p.C", "p.D" ), c("q.A", "q.B", "q.C", "q.D" ),
      1, Bleymueller79E25.1 )
   # Paasche Price Indices
   priceIndex( c( "p.A", "p.B", "p.C", "p.D" ), c("q.A", "q.B", "q.C", "q.D" ),
      1, Bleymueller79E25.1, "Paasche" )
}
}

\keyword{models}
