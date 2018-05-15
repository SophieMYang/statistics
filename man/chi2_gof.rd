\name{chi2_gof}
\alias{chi2_gof}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Confidence Interval
}
\description{
Calculates the chisq sample confidence level range based on the observed bin sizes and the expected bin sizes.
}
\usage{
chi2_gof(x_bin_n,exp_bin_n)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x_bin_n}{
observed bin value sizes n
}
  \item{exp_bin_n}{
expected bin value sizes n
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

chi2_gof(c(205, 26, 25, 19),c(198, 19.25, 33, 24.75))
## The function is currently defined as
function (x)
{
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
