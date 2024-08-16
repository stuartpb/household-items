e2e_length = 15.5;
butt_depth = 2.5;
outer_width = 6;
armpit_diam = 3.5;
grasp_length = 2.1;
grasp_width = 2.3;
extrude_depth = 10;
angle = 45;
inner_angle = 65;

$fs = 0.1;

armpit_x_center = -outer_width/2 + armpit_diam/2 + butt_depth;

linear_extrude(extrude_depth) difference() {
  hull() {
    circle(d=outer_width);
    rotate(angle/2) translate([e2e_length, outer_width/2-.5]) circle(1);
    rotate(-angle/2) translate([e2e_length, -outer_width/2+.5]) circle(1);
  }
  hull() {
    translate([armpit_x_center, 0])
      circle(d=armpit_diam);
      rotate(inner_angle/2) translate([e2e_length-grasp_length,-5]) square([1,5]);
      rotate(-inner_angle/2) translate([e2e_length-grasp_length,0]) square([1,5]);
  }
  hull() {
    translate([6,0]) circle(2);
    translate([20,-12]) square([5,24]);
  }
}