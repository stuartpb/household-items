outer_d = 15;
inset_d = 12;
pin_d = 8.35;
inset_h = 4.25;
length = 17.25;
eps = 1;
$fs=1;
difference () {
  cylinder(h=length,d=outer_d);
  translate([0,0,-eps]) cylinder(h=length+2*eps,d=pin_d);
  translate([0,0,length-inset_h]) cylinder(h=inset_h+eps,d=inset_d);
}