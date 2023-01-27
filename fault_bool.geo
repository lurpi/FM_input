SetFactory("OpenCASCADE");
Mesh.CharacteristicLengthMax = 5.75;
Mesh.CharacteristicLengthMin = .01;

cl_5 = 0.05;
cl_10 = 5.;
cl_25 = 0.25;
cl_1000 = 0.75;
cl_250 = 2.5 ;
cl_750 = 5. ;
cl_outer = 5. ;
 
dip_fault=65 ;
slp = 1.0/Tan(dip_fault*(Pi/180)) ;//0.466307658155; // 1 over tan dip (here 65 degree)


width=20;
length=20;
bottom = -20.;
top= -0.;

width_b=length/2-(slp*(top-bottom)/2.); // if dip 65 5.3369234
width_t=length/2+(slp*(top-bottom)/2.); // if dip 65 14.6630766

f_dam=0.10492;
f_cor=2; // 0.023315383;

//f_cor=0.233153829;


dy1=1.;
dy2=0.25;
dy3=-0.25;
dy4=-1.36;
dy5=-1.5;

dx1=slp*dy1;
dx2=slp*dy2;
dx3=slp*dy3;
dx4=slp*dy4;
dx5=slp*dy5;
 

// first cube 
Point(101)={0, 0, bottom, cl_10};  
//Point(1010)={0, 0, -10.+dy5, cl_10};  
//Point(1012)={0, 0, -10.+dy4, cl_10};  
//Point(1014)={0, 0, -10.+dy3, cl_10};  
//Point(1040)={0, 0, -10.+dy2, cl_10}; 
//Point(1044)={0, 0, -10.+dy1, cl_10}; 
Point(104)={0, 0, top, cl_10};  

Point(1010)={width, 0, bottom, cl_10};
Point(1040)={width, 0, top, cl_10};

Point(105)={0, length, bottom, cl_10};  
Point(106)={0, length, top, cl_10};  
Point(1050)={width, length, bottom, cl_10};  
Point(1060)={width, length, top, cl_10};  



//Point(1050)={0, length, -10.+dy5, cl_10};  
//Point(1052)={0, length, -10.+dy4, cl_10};  
//Point(1054)={0, length, -10.+dy3, cl_10};  
//Point(1060)={0, length, -10.+dy2, cl_10};  
//Point(1066)={0, length, -10.+dy1, cl_10};  

// damage-rock plane (there will be more)

 
Point(202)={0-7, width_t-f_dam-f_cor*0.5, top, cl_1000};  
Point(2020)={width/2., 10-f_dam-f_cor*0.5+dx1 , -10.+dy1, cl_10};
Point(2023)={width/2., 10-f_dam-f_cor*0.5+dx2 , -10.+dy2, cl_10};
Point(2025)={width/2., 10-f_dam-f_cor*0.5+dx3 , -10.+dy3, cl_10};
Point(2027)={width/2., 10-f_dam-f_cor*0.5+dx4 , -10.+dy4, cl_10};
Point(2030)={width/2., 10-f_dam-f_cor*0.5+dx5 , -10.+dy5, cl_10};
Point(203)={0-7, width_b-f_dam-f_cor*0.5, bottom, cl_10};  
Point(221)={width/2., width_t-f_dam-f_cor*0.5, top, cl_1000};  
Point(223)={width/2., width_b-f_dam-f_cor*0.5, bottom, cl_1000};  
Point(212)={width+7, width_t-f_dam-f_cor*0.5, top, cl_10};  
//Point(2120)={width, 10-f_dam-f_cor*0.5+dx1 , -10.+dy1, cl_10};
//Point(2123)={width, 10-f_dam-f_cor*0.5+dx2 , -10.+dy2, cl_10};
//Point(2125)={width, 10-f_dam-f_cor*0.5+dx3 , -10.+dy3, cl_10};
//Point(2127)={width, 10-f_dam-f_cor*0.5+dx4 , -10.+dy4, cl_10};
//Point(2130)={width, 10-f_dam-f_cor*0.5+dx5 , -10.+dy5, cl_10};
Point(213)={width+7, width_b-f_dam-f_cor*0.5, bottom, cl_1000};  

 
Point(302)={0-7, width_t-f_cor*0.5, top, cl_1000};  
Point(3020)={width/2., 10-f_cor*0.5+dx1 , -10.+dy1, cl_10};
Point(3023)={width/2., 10-f_cor*0.5+dx2 , -10.+dy2, cl_10};
Point(3025)={width/2., 10-f_cor*0.5+dx3 , -10.+dy3, cl_10};
Point(3027)={width/2., 10-f_cor*0.5+dx4 , -10.+dy4, cl_10};
Point(3030)={width/2., 10-f_cor*0.5+dx5 , -10.+dy5, cl_10};
Point(303)={0-7, width_b-f_cor*0.5, bottom, cl_1000};  
Point(321)={width/2., width_t-f_cor*0.5, top, cl_1000};  
Point(323)={width/2., width_b-f_cor*0.5, bottom, cl_1000};  
Point(312)={width+7, width_t-f_cor*0.5, top, cl_10};  
//Point(3120)={width, 10-f_cor*0.5+dx1 , -10.+dy1, cl_10};
//Point(3123)={width, 10-f_cor*0.5+dx2 , -10.+dy2, cl_10};
//Point(3125)={width, 10-f_cor*0.5+dx3 , -10.+dy3, cl_10};
//Point(3127)={width, 10-f_cor*0.5+dx4 , -10.+dy4, cl_10};
//Point(3130)={width, 10-f_cor*0.5+dx5 , -10.+dy5, cl_10};
Point(313)={width+7, width_b-f_cor*0.5, bottom, cl_1000};  

//Point(112)={0, width_t-f_cor*0.5, top, cl_10};  
//Point(1120)={0, 10-f_cor*0.5+dx1 , -10.+dy1, cl_10};
//Point(1123)={0, 10-f_cor*0.5+dx2 , -10.+dy2, cl_10};
//Point(1125)={0, 10-f_cor*0.5+dx3 , -10.+dy3, cl_10};
//Point(1127)={0, 10-f_cor*0.5+dx4 , -10.+dy4, cl_10};
//Point(1130)={0, 10-f_cor*0.5+dx5 , -10.+dy5, cl_10};
//Point(113)={0, width_b-f_cor*0.5, bottom, cl_10};  
//
//Point(122)={0, width_t+f_cor*0.5, top, cl_10}; 
//Point(1220)={0, 10+f_cor*0.5+dx1 , -10.+dy1, cl_10};
//Point(1223)={0, 10+f_cor*0.5+dx2 , -10.+dy2, cl_10};
//Point(1225)={0, 10+f_cor*0.5+dx3 , -10.+dy3, cl_10};
//Point(1227)={0, 10+f_cor*0.5+dx4 , -10.+dy4, cl_10};
//Point(1230)={0, 10+f_cor*0.5+dx5 , -10.+dy5, cl_10};
//Point(123)={0, width_b+f_cor*0.5, bottom, cl_10};  
//
//Point(132)={0, width_t+f_dam+f_cor*0.5, top, cl_10};
//Point(1320)={0, 10+f_dam+f_cor*0.5+dx1 , -10.+dy1, cl_10};
//Point(1323)={0, 10+f_dam+f_cor*0.5+dx2 , -10.+dy2, cl_10};
//Point(1325)={0, 10+f_dam+f_cor*0.5+dx3 , -10.+dy3, cl_10};
//Point(1327)={0, 10+f_dam+f_cor*0.5+dx4 , -10.+dy4, cl_10};
//Point(1330)={0, 10+f_dam+f_cor*0.5+dx5 , -10.+dy5, cl_10};
//Point(133)={0, width_b+f_dam+f_cor*0.5, bottom, cl_10};  
//
//+

// DEFINE CUBE;

Line(1) = {101, 104};
Line(2) = {104, 106};
Line(3) = {106, 1060};
Line(4) = {1060, 1050};
Line(5) = {1050, 1010};
Line(6) = {1010, 101};
Line(7) = {1040, 104};
Line(8) = {1010, 1040};
Line(9) = {1040, 1060};
Line(10) = {1050, 105};
Line(11) = {105, 101};
Line(12) = {105, 106};

//top surf z1;
Curve Loop(1) = {3, -9, 7, 2};
Plane Surface(1) = {1};
//left surf y0
Curve Loop(2) = {1, -7, -8, 6};
Plane Surface(2) = {2};
// front surf x1
Curve Loop(3) = {9, 4, 5, 8};
Plane Surface(3) = {3};
//+
// bottom surf z0
Curve Loop(4) = {6, -11, -10, 5};
Plane Surface(4) = {4};
//+
// back surf x0
Curve Loop(5) = {1, 2, -12, 11};
Plane Surface(5) = {5};
// right surf y1
Curve Loop(6) = {3, 4, 10, 12};
Plane Surface(6) = {6};
//+ CUBE
Surface Loop(1) = {1, 6, 3, 4, 2, 5};
Volume(1) = {1};


//+ DAMAGE ZONE LEFT
Line(13) = {223, 203};
Line(14) = {203, 202};
Line(15) = {202, 302};
Line(16) = {203, 303};
Line(17) = {223, 323};
Line(18) = {213, 313};
Line(19) = {213, 223};
Line(20) = {313, 323};
Line(21) = {323, 303};
Line(22) = {202, 221};
Line(23) = {221, 321};
Line(24) = {321, 302};
Line(25) = {212, 213};
Line(26) = {312, 212};
Line(27) = {312, 313};
Line(28) = {312, 321};
Line(29) = {212, 221};
Line(30) = {223, 2030};
Line(31) = {2030, 2027};
Line(32) = {2027, 2025};
Line(33) = {2025, 2023};
Line(34) = {2023, 2020};
Line(35) = {2020, 221};
Line(36) = {323, 3030};
Line(37) = {3030, 3027};
Line(38) = {3027, 3025};
Line(39) = {3025, 3023};
Line(40) = {3023, 3020};
Line(41) = {3020, 321};
Line(42) = {303, 302};
//+
Curve Loop(7) = {13, 14, 22, -35, -34, -33, -32, -31, -30};
//+
Plane Surface(7) = {7};
//+
Curve Loop(8) = {35, -29, 25, 19, 30, 31, 32, 33, 34};
//+
Plane Surface(8) = {8};
//+
Curve Loop(9) = {13, 16, -21, -20, -18, 19};
//+
Plane Surface(9) = {9};
//+
Curve Loop(10) = {15, -24, -28, 26, 29, -22};
//+
Plane Surface(10) = {10};
//+
Curve Loop(11) = {14, 15, -42, -16};
//+
Plane Surface(11) = {11};
//+
Curve Loop(12) = {25, 18, -27, 26};
//+
Plane Surface(12) = {12};
//+
Curve Loop(13) = {20, 36, 37, 38, 39, 40, 41, -28, 27};
//+
Plane Surface(13) = {13};
//+
Curve Loop(14) = {21, 42, -24, -41, -40, -39, -38, -37, -36};
//+
Plane Surface(14) = {14};
//+
Surface Loop(2) = {7, 9, 11, 10, 14, 13, 12, 8};
//+
Volume(2) = {2};

BooleanIntersection{ Volume{1}; }{ Volume{2}; Delete; }
//+
BooleanDifference{ Volume{1}; Delete; }{ Volume{2}; }
//+//+
Physical Volume(1) = {4}; //left
Physical Volume(2) = {2}; //fault
Physical Volume(3) = {3}; //right
//+

//Recursive Delete {
//  Volume{3}; 
//}
//+
Characteristic Length {1074,1078,1075,1076,1077} = 0.02;
Characteristic Length {1071,1067,1068,1069,1070} = 0.02;
