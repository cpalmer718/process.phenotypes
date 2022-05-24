% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/consent_exclusion.R
\name{apply.consent.exclusion}
\alias{apply.consent.exclusion}
\title{Apply consent exclusion to data}
\usage{
apply.consent.exclusion(phenotype.data, variable.summary)
}
\arguments{
\item{phenotype.data}{data.frame, input phenotype information
with a subject ID column}

\item{variable.summary}{list, dataset configuration information
with a variable tagged with "subject_id: true"}
}
\value{
list, first entry modified version of the input
phenotype data with any excluded subjects removed; second
entry modified version of input config data with summary
information included about consent status for report.
}
\description{
Load subject list(s) specifying inclusion and exclusion of
subjects based on consent status. Depending on the presence
or absence of subjects and input lists, report summary
information about how many people have definitive information.
}
\details{
TBD
}