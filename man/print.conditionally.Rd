% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/markdown_helper_functions.R
\name{print.conditionally}
\alias{print.conditionally}
\title{Helper function to conditionally print output content}
\usage{
\method{print}{conditionally}(val)
}
\arguments{
\item{val}{thing to be conditionally printed}
}
\description{
If the passed value is null, no action is taken; otherwise,
the thing is emitted wrapped in a print() or cat() statement.
}
\details{
Other data types could presumably benefit from conditional
behavior here, but this distinction is the only one that
has had any meaning for the cleaning report as of this writing.

This function exists almost exclusively to avoid cyclomatic
complexity errors in linting. If that sentence makes no sense
to you, don't worry about it.
}
\examples{
my.data <- data.frame(x = rnorm(1000))
my.plot <- ggplot2::ggplot(ggplot2::aes(x), data = my.data) +
  ggplot2::geom_histogram()
process.phenotypes:::print.conditionally(my.plot)
}
