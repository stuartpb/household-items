top_d = 8;
bottom_d = 9.5;
neck_l = 30;
tube_t = 1;

$fs = 1;
$fa = 1;
difference(){
  cylinder(d1=bottom_d+2*tube_t, d2=top_d+2*tube_t, h=neck_l);
  cylinder(d1=bottom_d, d2=top_d, h=neck_l);
}