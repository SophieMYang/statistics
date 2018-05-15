\name{p_2_nbr_successes_ci}
\alias{p_2_nbr_successes_ci}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Confidence Interval for a single proportion
}
\description{
Calculates the sample confidence for a single proportion sample.
}
\usage{
p_2_nbr_successes_ci(xp,n,x_pct,Xp=xp,xp_null)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{xp}{
sample proportion
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

p_2_nbr_successes_ci(0,1,30,c(90,95,99))
## The function is currently defined as
function (x)
{
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
