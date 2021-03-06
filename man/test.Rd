% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RTestCase.R
\docType{methods}
\name{test}
\alias{test}
\alias{test,RTestCase-method}
\title{Execute Test Logic of the Test Case}
\usage{
\S4method{test}{RTestCase}(object, test.for = NULL,
  out.fPathPre = NULL, ...)
}
\arguments{
\item{object}{(\code{object}) The \code{\link{RTestCase-class}} object.}

\item{test.for}{(\code{vector(character)}) Specification for which elements to test,
NULL to test for all elements}

\item{out.fPathPre}{(\code{character}) Prefix incl. path to output files generated during
tetest}

\item{...}{Additional arguments passed to the check function.}
}
\value{
(\code{\link{RTestCase-class}})
}
\description{
This method executes the test logic for a test case in a \code{testthat} reporter environment.
}
\details{
This method performs the test logic by iterating through all testgroups as defined in the TC XML
definition file. For each test group it starts a seperate '\code{ListReporter}', which is
defined in the \code{testthat} package. Then, the different functions of a testgroup are
executed. Therefore, this function calls the method \code{execTCAdapter}, which needs to be
defined for each TestCase type separatly (e.g. for DSTAT, VCA, Calib, etc.). This method is the
adapter function and knows how to read the test case and how to execute the functions, which
should be tested. Thereby, all test results generated using \code{\link[testthat]{test_that}}
and the \code{expect_*} of the \code{testthat} package are recorded by the previously started
reporter object. The generated test results are stored (slot \code{test.result}) and the test
execution status set (slot \code{test.status}).
}
\examples{

location <- find.package("RTest")

TestCase <- RTestCase(xml.fPath =
  file.path(location,"xml-templates","RTest_TC-01.xml"))

result <- test(TestCase)

stopifnot(result@test.result == "success")

}
\seealso{
\code{\link{RTestCase-class}}
}
\author{
Matthias Pfeifer \email{matthias.pfeifer@roche.com}
}
