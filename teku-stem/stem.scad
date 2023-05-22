top_d = 8;
bottom_d = 9.5;
neck_l = 20;
tube_t = 1;

$fs = 1;
$fa = 1;
difference(){
  cylinder(d1=bottom_d+2*tube_t, d2=top_d+2*tube_t, h=20);
  cylinder(d1=bottom_d, d2=top_d, h=20);
}