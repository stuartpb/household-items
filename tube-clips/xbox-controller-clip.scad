clip_diameter = 36; //40;
clip_thickness = 2.5;
clip_height = 20;
more = 1;

wing_thickness = 5;
wing_tip_thickness = 5;
wing_edge_thickness = 5;
wing_elbow_thickness = 5;
wing_bottom_length = 30;
wing_elbow_distance = 40;
wing_tip_distance = 40;
wing_inner_height = 20;
wing_elbow_height = 17.5;
wing_tip_height = 25;
wing_angle = 50;

$fa = 1;
$fs = .5;

module wing() {
  clip_edge = clip_diameter/2 + clip_thickness;
  union () {
    hull () {
      translate([0,clip_edge,wing_thickness/2])
        sphere(d=wing_thickness);
      translate([0,clip_edge + wing_bottom_length,wing_edge_thickness/2])
        sphere(d=wing_edge_thickness);
      translate([0,clip_edge + wing_elbow_distance, wing_elbow_height])
        sphere(d=wing_elbow_thickness);
      translate([0,clip_edge,wing_inner_height - wing_thickness/2])
        sphere(d=wing_thickness);
    }
    hull () {
      if (wing_tip_distance > wing_elbow_distance) {
        translate([0,clip_edge + wing_bottom_length,wing_edge_thickness/2])
          sphere(d=wing_edge_thickness);
      }
      translate([0,clip_edge + wing_tip_distance,wing_tip_height - wing_tip_thickness/2])
        sphere(d=wing_tip_thickness);
      translate([0,clip_edge + wing_elbow_distance, wing_elbow_height])
        sphere(d=wing_elbow_thickness);
    }
  }
}

translate([0,-clip_diameter/2,0]) difference() {
  union () {
    cylinder(d=clip_diameter + 2*clip_thickness, h=clip_height);
    rotate(-wing_angle/2) wing();
    rotate(wing_angle/2) wing();
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
