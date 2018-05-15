\name{ci_t}
\alias{ci_t}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
t Confidence Interval
}
\description{
Calculates the sample confidence level range based on the sample mean, sample standard error, sample size, and desired confidence percentage for a t distribution.
}
\usage{
ci_t(x_mu,x_sigma,x_n,x_pct)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x_mu}{
sample mean
}
  \item{x_sigma}{
sample sigma (standard deviation or sample error)
}
  \item{x_n}{
sample size
}
  \item{x_pct}{
sample confidence percent
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

ci_t(0,1,30,c(90,95,99))
## The function is currently defined as
function (x)
{
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
