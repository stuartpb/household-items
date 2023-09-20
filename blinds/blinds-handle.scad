length = 72.8;
handle_diam = 14;
tiphole_diam = 3;
tiphole_depth = 1;
rod_diam = 8;
tol = 0;
carveout_r = 2.5;
carveout_dist = 8;
$fn = 90;

module footprint() {
  difference() {
    circle(d=handle_diam);
    for (i=[0:90:270]){
      rotate(45+i) translate([carveout_dist,0])
        circle(r=carveout_r);
    }
  }
}

module profile() {
  intersection() {
    hull() {
      square([1, length]);
      translate([2,5]) circle(5);
      translate([4.5,length-5]) scale([2.5,5]) circle();
    }
    square([handle_diam/2, length]);
  }
}

difference() {
  intersection () {
    linear_extrude(length) footprint();
    rotate_extrude() profile();
  }
  cylinder(h=length,d=tiphole_diam);
  translate([0,0,tiphole_depth]) cylinder(h=length,d=rod_diam);
}