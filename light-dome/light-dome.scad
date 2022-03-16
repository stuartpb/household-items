dome_diam = 45;
dome_height = 25;
dome_thickness = 2;
tab_width = 12;
tab_length = 4;
tab_thickness = 2.5;
tooth_height = 0.5;
tooth_width = 2;
tooth_offset = 2.5;

$fn = 90;

module dome (h = dome_height, d = dome_diam) {
  intersection () {
    union () {
      translate([0,0,h-d/2]) sphere(d=d);
      cylinder(d=d,h=h-d/2);
    }
    translate([0,0,h/2]) cube([d,d,h],center=true);
  }
}

union() {
  difference() {
    dome(dome_height, dome_diam);
    dome(dome_height-dome_thickness, dome_diam - 2 * dome_thickness);
  }

  intersection() {
    dome();
    linear_extrude (tab_thickness + tooth_height) {
      difference() {
        circle(d=dome_diam);
        circle(d=dome_diam - tab_length*2);
      }
    }
    union () {
      linear_extrude (tab_thickness) {
        square([dome_diam, tab_width], center=true);
      }
      linear_extrude (tab_thickness + tooth_height) {
        translate([0, tooth_offset]) square([dome_diam, tooth_width], center=true);
        translate([0, -tooth_offset]) square([dome_diam, tooth_width], center=true);
      }
    }
  }
}
