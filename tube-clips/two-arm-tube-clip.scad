clip_diameter = 56; //40;
clip_thickness = 4;
clip_height = 15;
more = 1;

arm_thickness = 5;
arm_tip_thickness = 5;
arm_edge_thickness = 5;
arm_elbow_thickness = 5;
arm_bottom_length = 20;

arm_elbow_distance = 20;
arm_tip_distance = 20;
arm_inner_height = 15;
arm_elbow_height = 10;
arm_tip_height = 22;
arm_attach_angle = 70;
arm_adjust_angle = -35;

$fa = 1;
$fs = .5;

module arm() {
  rotate(arm_attach_angle/2)
  translate([0,clip_diameter/2 + clip_thickness/2,0])
  rotate(arm_adjust_angle)
  union () {
    hull () {
      translate([0, 0, arm_thickness/2])
        sphere(d=arm_thickness);
      translate([0, arm_bottom_length, arm_edge_thickness/2])
        sphere(d=arm_edge_thickness);
      translate([0, arm_elbow_distance, arm_elbow_height])
        sphere(d=arm_elbow_thickness);
      translate([0,0,arm_inner_height - arm_thickness/2])
        sphere(d=arm_thickness);
    }
    hull () {
      if (arm_tip_distance > arm_elbow_distance) {
        translate([0,arm_bottom_length,arm_edge_thickness/2])
          sphere(d=arm_edge_thickness);
      }
      translate([0,arm_tip_distance,arm_tip_height - arm_tip_thickness/2])
        sphere(d=arm_tip_thickness);
      translate([0,arm_elbow_distance, arm_elbow_height])
        sphere(d=arm_elbow_thickness);
    }
  }
}

translate([0,-clip_diameter/2,0]) difference() {
  union () {
    cylinder(d=clip_diameter + 2*clip_thickness, h=clip_height);
    arm();
    mirror([1,0,0]) arm();
  }
  translate([0,0,-more]) linear_extrude(clip_height+2*more) {
    circle(d=clip_diameter);
    polygon([
      [0,0],
      [-clip_diameter/2,-clip_diameter],
      [clip_diameter/2,-clip_diameter]
    ]);
  }
}
