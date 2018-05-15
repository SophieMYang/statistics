\name{loadRData}
\alias{loadRData}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Load RData
}
\description{
Loads an RData file.
}
\usage{
d <- loadRdata('filename')
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{filename}{
Relative or fully qualified filename
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

loadRData(c(205, 26, 25, 19),c(198, 19.25, 33, 24.75))
## The function is currently defined as
function (filename)
{
    load(filename)
    get(ls()[ls() != 'filename'])
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
