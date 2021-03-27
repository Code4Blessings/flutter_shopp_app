# flutter_Shop_App

Flutter App Inspired by Udemy Flutter & Dart The Complete Guide

## File Notes

#### Products Overview File (lib/screens/products_overview.dart)

**Gridview Builder**

- To structure the grid you will need to make use of one of the arguments -- gridDelegate

- For gridDelegate we used the widget, **SliverGridDelegateWithFixedCrossAxisCount()** which takes in the four arguments:

    1. crossAxisCount - the amount of columns you want in the grid.
    
    2. childAspectRatio - height vs. width
    
    3. crossAxisSpacing - space between the columns
    
    4. mainAxisSpacing - space between the rows
