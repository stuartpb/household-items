$fn=16;
od = 11; //10
td = 8; //7
cylinder(h=2,d1=td,d2=od);
translate([0,0,2]) cylinder(h=26,d=od);
translate([0,0,28]) cylinder(h=2,d1=od,d2=td);