% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/per_phenotype_cleaning.R
\name{apply.bounds}
\alias{apply.bounds}
\title{Apply range bounds to each variable as defined in yaml config}
\usage{
apply.bounds(phenotype.data, variable.summary)
}
\arguments{
\item{phenotype.data}{Data frame of loaded phenotype data with
standardized headers. All columns should be character vectors.}

\item{variable.summary}{List of per-column summary information
and parameters from dataset configuration.}
}
\value{
List, with first entry 'phenotype.data' data frame a modified
version of phenotype input data bounds applied as appropriate;
and second entry 'variable.summary' list a modified version of input list
with information on entries outside the defined bounds.
}
\description{
Numeric variables can optionally have min/max bounds defined in
the config (under "bounds") - apply them here by replacing values
outside the bounds with NA.
}
\details{
Currently, numeric bounds are only supported on numeric
and date input configuration types. Other types may be
added to the list depending on future functionality.

The bounds understood at this time are:
\itemize{
\item min: set values below this threshold to NA
\item max: set values above this threshold to NA
\item sd: set values this many standard deviations \emph{either above or below}
the mean to NA
}

In case other bound conditions are desired, either file an issue,
or use a derived variable to apply the bounds based on arbitrary criteria.

In addition to setting the offending values to NA, this function
injects summary counts describing the number of values removed for
each bound in turn into the configuration list. This information
is intended for use in the cleaning report.
}
\examples{
phenotype.data <- data.frame(
  HW00001 = c("A", "B", "C", "D"),
  HW00002 = 1:4
)
variable.summary <- list(variables = list(
  HW00001 = list(params = list(
    name = "subjid",
    type = "string",
    subject_id = TRUE
  )),
  HW00002 = list(params = list(
    name = "count",
    type = "numeric",
    bounds = list(min = 2)
  ))
))
result <- process.phenotypes:::apply.bounds(phenotype.data, variable.summary)
}
\seealso{
load.configuration
}
\keyword{phenotypes}
\keyword{yaml}
