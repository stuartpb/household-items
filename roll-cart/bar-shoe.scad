outer_diameter = 23;
inner_diameter = 17;
height = 18.5;
peg_diameter = 5;
peg_length = 6.5;
ridge_diameter = 1.5;
ridge_count = 8;
ridge_arc = 90;
ridge_retract = 0.25;
open_gap = 12;
foot_length = 6;
heel_diameter = 4;

$fn = 90;

gap_slope = outer_diameter / open_gap;
outer_radius = outer_diameter / 2;
inner_radius = inner_diameter / 2;

ridge_start = ridge_arc / 2;
ridge_deg_sep = ridge_arc / (ridge_count-1);

module heel() {
  translate([open_gap/2+1,-outer_radius+1.5,0]) rotate(-45) hull() {
    translate([-foot_length+heel_diameter,0,0]) circle(d=heel_diameter);
    translate([foot_length-heel_diameter,0,0]) circle(d=3);
  }
}

module ridges() {
  for (i=[0:ridge_count-1]) {
    angle = ridge_start+ridge_deg_sep*i;
    distance = outer_radius - ridge_retract;
    translate([cos(angle)*distance,sin(angle)*distance,0])
    circle(d=ridge_diameter);
  }
}

module outline() {
  union () {
    difference () {
      circle(d=outer_diameter);
      circle(d=inner_diameter);
      polygon([[0,0],[open_gap,-outer_diameter],[-open_gap,-outer_diameter]]);
    }
    ridges();
    heel();
    mirror([1,0,0]) heel();
  }
}

linear_extrude(height) outline();
translate([0,inner_radius,height/2]) rotate([90,0,0]) cylinder(d=peg_diameter, h=peg_length);
