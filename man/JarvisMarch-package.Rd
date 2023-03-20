\name{JarvisMarch-package}
\alias{JarvisMarch-package}
\alias{JarvisMarch}
\docType{package}
\title{
  Implementation of the Jarvis March algorithm
}
\description{
  This package implements the Jarvis March algorithm to find the convex 
  hull of a set of points. There is also an inbuilt ability to error 
  check inputs, and plot the set of points with the convex hull highlighted.
  An additional function is also added to check if a set of point(s)
  is part of the convex hull.
}
\details{
  There are 3 functions to be aware of in the package. All inputs must be
  of the R classes, list, vector, or data frame - all of which must be numeric,
  or integer. If a string or character is inputted, an error will aslo display.
  
  The first function is 'jarvis_march( list_of_points )'. This is a bare bones
  function written in C++, it performs the Jarvis March algorithm on a list of
  points of the form `(x,y)`. This function has no error checking, plotting 
  capabilities, or the ability to take any input other than a list of points.
  
  The second function is `jarvis_march_all( input, plot = FALSE)`. This function 
  uses the C++ function but allows for more inputs classes as mentioned above.
  The function has inbuilt error checking, to tell you if your input is not in
  correct R class or if the length is not correct. There is also a plotting 
  capability using the `ggplot2` package, this is set to not occur by default,
  but by changing `plot=FALSE` to `plot=TRUE` then a ggplot will be made, with
  points being in black, and the convex hull points being red with a red path 
  going between the hull points.
  
  The final function is `in_hull(Original_Set,Test_Point,print=TRUE)`. This function
  builds upon the `jarvis_march_all` function and allows us to see if the set of 
  point(s) `Test_Point` is part of the convex hull of `Original_Set`. We also 
  utilise `jarvis_march_all` error checking ability upon the input `Original_Set`,
  but `in_hull` performs the same error checking upon `Test_Point`. The output of 
  this fucntion is a boolean `TRUE/FALSE`. `TRUE` if all points in `Test_Point` are in
  the convex hull and `FALSE` otherwise. The function will also print which points
  are in the convex hull, and will tell you if all,some or none of the `Test_Point` 
  are in teh convex hull. This ability can be turned off if found to be annoying by 
  setting `print=FALSE`.
  
  C++ structures for `Point` and `Line_Segment` are also included but shouldn`t be 
  called upon.
}
\author{
Adam Page

Maintainer: Adam Page <a.d.page@lancaster.ac.uk>
}
\references{
  https://algorithmtutor.com/Computational-Geometry/Convex-Hull-Algorithms-Jarvis-s-March/
}
\keyword{ JarvisMarch }
\seealso{
  Optional links to other man pages
}
\examples{
  \dontrun{
     ## Optional simple examples of the most important functions
     ## These can be in \dontrun{} and \donttest{} blocks.   
  }
}
