# JarvisMarch
Jarvis March algorithm for STOR601 RCpp coding assignment.

This package implements the Jarvis March gift wrapping algorithm, on a 
set of points within R. The functions within also allow for error checking,
 plotting and the ability to check if a set of points lies in the convex hull
 of another set of points.

## Installation
While having R open, whether that be in R studio or R through a terminal,
first download and then call the `devtools` package.

`> install.packages("devtools")`\
`> library(devtools)`

Once this library has been called we then have the ability to install 
packages from github. Run the following line of code to install the 
`JarvisMarch` algorithm from my github account.

`> install_github("pageadam/JarvisMarch")`

Finally, once installed, we can now call the package into R to be able
to use the functions inside:

`> library(JarvisMarch)`

You should now be able to use the functions available within the
`JarvisMarch` package. Please note that you may need to restart your R
session after installation and call the package again before the package 
is useable - this issue is most prevelent when installing through R Studio.

I will repeat all lines of code needed so that you can copy and paste 
all lines at once

`install.packages("devtools")` \
`library(devtools)` \
`install_github("pageadam/JarvisMarch")` \
`library(JarvisMarch)`

## Functions
Now that we have the package installed, we can begin to use the functions available within the package - of which there are 3 available to use.

### `jarvis_march`
hello
