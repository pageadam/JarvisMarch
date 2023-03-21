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

This function is a  RC++ function dependent on the hidden structures `Point` and `Line_Segment`. The function finds the convex hull, by using the Jarvis March agift wrapping algorithm, of a set of inputted points:

`jarvis_march( list_of_points )`

The function only takes inputs of the form `list(c(x_1,y_1),c(x_2,y_2),...)` where `(x_1,y_1)` is the first cartesian point of the set, and `(x_2,y_2)` is the second point and so on. The output of the function is the convex hull given in the form of a series of line sements. Specifically outputted as a list of numeric vectors:

`list(c(x_1,y_1,x_2,y_2),c(x_2,y_2,x_3,y_3),...)`

where (x_1,y_1) is the first point in the convex hull, and so on.

### `jarvis_march_all`

This function uses the previous RC++ function but with some usefuk addons which are coded in R:

`jarvis_march_all(input, plot=FALSE)`

Here we input our set of points with the variable `input`. This can take more R class types than our original function, `input` can be a list of numeric/integer vectors, just a numeric/integer vector, or a data frame with X and Y values in each column. The output of the function is simply the same as before, a list of numeric vectors of line segments.

This new function, `jarvis__march_all` also comes with error checking. Stopping the algorithm if the input is not of the correct type, or if the length of points is not correct. An error messgae should appear telling the user what the exact error is - hopefully, clear enough that the input can be fixed.

The final addition to the original function is the ability to plot our points. This is done by changing to `plot = TRUE` which is set to `FALSE` by default. The plot is done as a `ggplot` object, from the `ggplot2` package. Points will be in black, with points of the convex hull being red, as well as a path between the hull points being added in red as well. The function uses the `require()` fucntion in order for the user to call upon the required library. The packages that may need to be installed are `ggplot2` and `rlang`.

### `in_hull`

The final function of this package can be used to test if a test set of point(s) are in the convex hull of another set of points. The function looks like:

`in_hull(Original_Set, Test_Set, print=TRUE)`

The output of this function is a boolean `TRUE/FALSE`. If all points in `Test_Set` are in the convex hull of the `Original_Set` then the output is `TRUE`. Otherwise, if some or no points are on the hull then the output is `FALSE`. The convex hull is found by using the `jarvis_march_all(Original_Set, plot=FALSE)` function. 

The function performs error checking on the `Test_Set` input as well.

The final input is `print=TRUE`, this allows the user to see which points are found to be in the hull and gives a message to say if all/some/none of the points of the `Test_Set` are found to be in the convex hull of `Original_Set`. For a large amount of points this could get very annoying so to switch it off set `plot=FALSE`.

## Influence

Follow this link for more information on coding the Jarvis March algorithm, specifically in python:

https://algorithmtutor.com/Computational-Geometry/Convex-Hull-Algorithms-Jarvis-s-March/
