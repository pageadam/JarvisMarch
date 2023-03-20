#include <iostream>
#include <cmath>
#include <vector>
#include <algorithm>
#include <list>

#include <Rcpp.h>
using namespace Rcpp;

struct Point
{
    double x;
    double y;
    Point(double _x = 0.0, double _y = 0.0)
    {
        x = _x;
        y = _y;   
    }
    Point operator-(Point p)
    {
       return Point(x - p.x,y - p.y);
    }
    double dist(Point q)
    {
        double z{};
        Point hold {Point(x,y) - q};
        double sq {pow(hold.x,2) + pow(hold.y,2)};
        z = sqrt(sq);
        return z;
    }
    Point operator+(Point p)
    {
       return Point(x + p.x,y + p.y);
    }
    Point print()
    {
        std::cout << "(" << x << "," << y << ")" << std::endl;
        return 0;
    }
};

struct Line_Segment
{
    Point a;
    Point b;
    Line_Segment(Point _a, Point _b)
    {
        a = _a;
        b = _b;
    }
    double anon(Line_Segment other)
    {
        Point c = b - a;
        Point d = other.b - other.a;
        return c.x * d.y - d.x*c.y;
    }
};

//[[Rcpp::export]]
std::list<std::vector<double> >  jarvis_march(std::list<std::vector<double> > list_of_points)
{
    //NEW ADDITION
    //seperate vector of doubles into x's and y's in order to make a vector of points
    std::vector<Point> points {};
    for(std::vector<double> p: list_of_points)
    {
        Point q (p[0],p[1]);
        points.push_back(q);
    }
    
    std::vector<double> forleft {}; //empty vector to find left most
    
    for(auto& p : points)
    {
        forleft.push_back(p.x); //push values of p.x to the back of vector
    }
    
    
    //find index for minimum x value in the forleft vector (distance from the begining to the minimum value)
    int place = ( std::distance( std::begin(forleft), std::min_element(std::begin(forleft), std::end(forleft)) ));   
    
    //label left most point
    Point leftmost (points[place]);
    
    int l = place; // let l be the index for where the left most point is in our vector
    
    std::vector<Point> Hull {leftmost}; // start the hull with the left most point
    
    while(true) 
    {
        double q = (l + 1) % points.size(); //Use this to pick the point that comes next in the points vector
        // % is the modolus function
        
        
        for (int i=0;i < points.size();i++) //for all points
        {
            
            if (i==l)
            {
                continue;
            }
            
            //work out cross product of 2 line segments starting from point i and going to points l and q
            // using the anom function that was provided
            // this allows us to find out if we are "turning" left or right
            double d = Line_Segment(points[l],points[i]).anon(Line_Segment(points[i],points[q]));
            
            //if we make a right turn or we are collinear with another point, skip the current point and keep marching from this next point
            if( (d > 0) || ((d == 0) && (points[i].dist(points[l]) > points[q].dist(points[l]))))
            {
                q = i;
            }
        
        }
        
        
        // if we dont find a right turn or a collinear point, then it must be in our hull
        l = q;
        
        
        //if l is the left most, then we have made our hull so leave the while loop
        if ( l == place )
        {
            break;
        }
        //else add it to the hull
        Hull.push_back(points[q]);
        //start the while loop again with our new l
    }

    
    
    //NEW ADDITION
    //make the vector of points back into a list of vectors in form (x0,y0,x1,y1)
    Hull.push_back(leftmost); //add the first point back in so that the last linsegment is displayed
    
    std::list<std::vector<double> > Convex_Hull {};
    for(int i=0; i< Hull.size()-1;i++) //hull size -1 as to not print things that don't exist
    {
        std::vector<double> lineseg {};
        lineseg.push_back(Hull[i].x);
        lineseg.push_back(Hull[i].y);
        lineseg.push_back(Hull[i+1].x);
        lineseg.push_back(Hull[i+1].y);
        Convex_Hull.push_back(lineseg);
    }
    
    //return the hull once we get back to the start
    return Convex_Hull;
    
    //return Hull;
}
