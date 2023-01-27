// Gmsh project created on Thu Jan 26 14:10:19 2023
//+
SetFactory("OpenCASCADE");
Box(1) = {0, 0, -20, 20, 20, 20};
//+
Box(2) = {-30, 10, -25, 75, 2, 40};
//+
//+
//+
//BooleanDifference{ Volume{2}; }{ Volume{1}; }
////+
//BooleanDifference{ Volume{1}; Delete; }{ Volume{2}; }
////+
//Recursive Delete {
//  Volume{2}; 
//}
////+
//Recursive Delete {
//  Volume{3}; 
//}
//+
BooleanIntersection{ Volume{1}; }{ Volume{2}; Delete; }
//+
BooleanDifference{ Volume{1}; Delete; }{ Volume{2}; }
//+
Physical Point(1) = {16};
