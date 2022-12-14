% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parse_surveycto.R
\name{apply.replacements}
\alias{apply.replacements}
\title{Apply standard replacements for certain deprecated terms}
\arguments{
\item{vec}{Character vector of values that require
scanning for possible replacement terms.}
}
\value{
Character vector version of input with
replacements applied.
}
\description{
Due to the integration of legacy form files, certain terms
that are inappropriate for use in actual datasets are
still present. This function is designed to intercept
them and replace them with appropriate terms.
}
\details{
Note that the use of this function creates certain
types of possible discrepancies if automatically
configured files are partially merged with manually
generated files. As this part of the secondary helper
function chain around parse.surveycto, we live with
the possibility of these discrepancies, as the output
of parse.surveycto is supposed to be manually reviewed
before use regardless.
}
