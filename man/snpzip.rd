\encoding{UTF-8}
\name{snpzip}
\alias{snpzip}
\title{Identification of structural SNPs}
\description{
  The function \code{snpzip} identifies the set of alleles which contribute most
  significantly to phenotypic structure.

  This procedure uses Discriminant Analysis of Principal Components (DAPC)
  to quantify the contribution of individual alleles to between-population
  structure. Then, defining contribution to DAPC as the measure of distance
  between alleles, hierarchical clustering is used to identify two groups
  of alleles: structural SNPs and non-structural SNPs.
}
\usage{
snpzip(x, phen, plot=TRUE, xval.plot=FALSE, loading.plot=FALSE,
method=c("complete","single", "average","centroid","mcquitty","median","ward"), \dots)
}
\arguments{
  \item{x}{either a snps \code{matrix} used as input of DAPC, or a dapc object.}
  \item{phen}{a \code{factor} indicating the group membership of individuals, iff x is a snps \code{matrix}.}
  \item{plot}{a \code{logical} indicating whether a graphical representation of the 
    DAPC results should be displayed.}
  \item{xval.plot}{a \code{logical} indicating whether the results of the 
    cross-validation step should be displayed.}
  \item{loading.plot}{a \code{logical} indicating whether a loading.plot displaying 
    the SNP selection threshold should be displayed.}
  \item{method}{the clustering method to be used. This should be 
    (an unambiguous abbreviation of) one of \code{"complete", "single", "average", 
    "centroid", "mcquitty", "median",} or \code{"ward"}.} 
  \item{\dots}{further arguments.}
    
}

\details{
  \code{snpzip} provides an objective procedure to delineate between structural 
  and non-structural SNPs identified by Discriminant Analysis of Principal Components 
  (DAPC, Jombart et al. 2010). 
  \code{snpzip} precedes the multivariate analysis with a cross-validation step 
  to ensure that the subsequent DAPC is performed optimally.
  The contributions of alleles to the DAPC are then submitted to \code{hclust}, 
  where they define a distance matrix upon which hierarchical clustering is carried out.
  To complete the procedure, \code{snpzip} uses \code{cutree} to automatically 
  subdivide the set of SNPs fed into the analysis into two groups: 
  those which contribute significantly to the phenotypic structure of interest, 
  and those which do not.   
}

\value{
  A \code{list} with five items: 
  the first cites the number of principal components (PCs) of PCA retained in the DAPC, 
  the second indicates the number of structural and non-structural SNPs identified by 
  \code{snpzip}, the third provides a list of the structuring alleles, the fourth
  gives the names of the selected alleles, and the fifth item details the 
  contributions of these structuring alleles to the DAPC.
  
  If \code{plot=TRUE}, a scatter plot will provide a visualization of the DAPC results.
  
  If \code{xval.plot=TRUE}, the results of the cross-validation step will be displayed 
  as an \code{array} of the format generated by xvalDapc, and a scatter plot of 
  the results of cross-validation will be provided.   
  
  If \code{loading.plot=TRUE}, a loading plot will be generated to show the 
  contributions of alleles to the DAPC, and the SNP selection threshold will be indicated.
}

\references{
Jombart T, Devillard S and Balloux F (2010) Discriminant analysis of principal 
components: a new method for the analysis of genetically structured populations. 
BMC Genetics11:94. doi:10.1186/1471-2156-11-94
}

\author{ Caitlin Collins \email{caitlin.collins12@imperial.ac.uk} }
\examples{
\dontrun{
## Not sure what examples I can usefully provide here. 
}
}
\keyword{multivariate}