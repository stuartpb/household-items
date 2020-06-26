cap_width = 45;
cap_height = 25;
cap_depth = 8;
cap_bc_radius = 5;
cap_tc_radius = 2;
cap_thickness = 2;

cable_corner_inset = 7;
cable_cutout_radius = 8;

$fs = 1;

module cap_profile () {
  hull () {
    translate([cap_width/2-cap_tc_radius,cap_height/2-cap_tc_radius]) circle(cap_tc_radius);
    translate([-cap_width/2+cap_tc_radius,cap_height/2-cap_tc_radius]) circle(cap_tc_radius);
    translate([cap_width/2-cap_bc_radius,-cap_height/2+cap_bc_radius]) circle(cap_bc_radius);
    translate([-cap_width/2+cap_bc_radius,-cap_height/2+cap_bc_radius]) circle(cap_bc_radius);
  }
}
module marking () {
  translate([8,0])
    text(str(cap_width, "x", cap_height, "x", cap_depth),
    size=4, halign="center", valign="center");
  translate([cap_width/2-max(cap_tc_radius,4),cap_height/2-max(cap_tc_radius,4)])
    text(str(cap_tc_radius),
    size=4, halign="center", valign="center");
  translate([cap_width/2-max(cap_bc_radius,4),-cap_height/2+max(cap_bc_radius,4)])
    text(str(cap_bc_radius),
    size=4, halign="center", valign="center");
  translate([-cap_width/2+2,cap_height/2-5])
    text(str("X", cable_corner_inset, " R", cable_cutout_radius),
    size=4, halign="left", valign="center");
}

difference () {
  linear_extrude(cap_depth) cap_profile();
  translate([0,0,cap_thickness]) linear_extrude(cap_depth+1)
  offset(delta=-cap_thickness) cap_profile();
  translate([cap_width/2-cable_corner_inset,-cap_height/2+cable_corner_inset,-1])
    cylinder(r=cable_cutout_radius, h=cap_height+2);
  translate([0,0,-1]) linear_extrude(1.4) mirror([1,0]) marking();
}
