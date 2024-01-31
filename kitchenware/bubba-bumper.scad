module footprint() {
  difference() {
    scale([.9,1]) intersection() {
      square(10, center=true);
      translate([0,.25]) rotate(45) square(12, center=true);
    }
    translate([0,.4]) intersection() {
      square([6,8], center=true);
      scale([.9,1]) rotate(45) square(9, center=true);
    }
    translate([0,3]) square(4.75, center=true);
  }
}

$fn = 300;

displace = 90;

translate([-displace,0]) rotate_extrude(angle=30) translate([displace,5]) footprint();
