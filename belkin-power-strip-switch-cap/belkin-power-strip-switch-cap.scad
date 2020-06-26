cap_width = 45.5;
cap_height = 25;
cap_depth = 7;
cap_bc_radius = 5;
cap_tc_radius = 2;
cap_thickness = 1.2;
cap_outset=0.1;

cable_corner_inset_x = 5;
cable_corner_inset_y = 6;
cable_cutout_radius = 7;

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
  translate([-6,0]) {
    text(str(cap_width, "x", cap_height, "x", cap_depth),
      size=4, halign="left", valign="center");
    translate([0,-5])
      text(str("T", cap_thickness ),
        size=4, halign="left", valign="center");
    translate([6,5])
      text(str("+", cap_outset),
        size=4, halign="left", valign="center");
  }
  translate([cap_width/2-max(cap_tc_radius,4),cap_height/2-max(cap_tc_radius,4)])
    text(str(cap_tc_radius),
      size=4, halign="center", valign="center");
  translate([cap_width/2-max(cap_bc_radius,4),-cap_height/2+max(cap_bc_radius,4)])
    text(str(cap_bc_radius),
      size=4, halign="center", valign="center");
  translate([-cap_width/2+2,-cap_height/2+cable_corner_inset_y+cable_cutout_radius+1]){
    text(str("R", cable_cutout_radius),
      size=4, halign="left", valign="bottom");
    translate([0,5]) text(str("X", cable_corner_inset_x,"Y", cable_corner_inset_y),
      size=4, halign="left", valign="bottom");
  }
}

difference () {
  linear_extrude(cap_depth) offset(delta=cap_outset) cap_profile();
  translate([0,0,cap_thickness]) linear_extrude(cap_depth+1)
    offset(delta=-cap_thickness+cap_outset) cap_profile();
  translate([cap_width/2-cable_corner_inset_x,-cap_height/2+cable_corner_inset_y,-1])
    cylinder(r=cable_cutout_radius, h=cap_height+2);
  translate([0,0,-1]) linear_extrude(1.4) mirror([1,0]) #marking();
}
