corner_radius = 1.5;
bar_diameter = 3;
bar_distance = 22;

foot_length = 5;
toe_diameter = 2;
foot_width = 4;

plate_length = 75;
plate_width = 75;
plate_thickness = 2;

$fs = .25;

module footprint() {
  difference(){
    hull() {
      square([foot_length, plate_thickness]);
      translate([.5,plate_thickness + bar_diameter])
        circle(d=toe_diameter);
    }
    translate([-bar_diameter/2,plate_thickness+bar_diameter/2])
      circle(d=bar_diameter);
  }
}

module foot() {
  rotate([90,0,90]) linear_extrude(foot_width) footprint();
}

union() {
  for (dist = [bar_diameter/2:bar_distance+bar_diameter:plate_length-foot_length]){
    translate([corner_radius+foot_width,dist+bar_distance])
      rotate([0,0,180]) foot();
    translate([plate_width-corner_radius,dist+bar_distance])
      rotate([0,0,180]) foot();
    translate([(plate_width+foot_width)/2,dist+bar_distance])
      rotate([0,0,180]) foot();
    translate([(plate_width-foot_width)/2,dist]) foot();
    translate([corner_radius,dist]) foot();
    translate([plate_width-foot_width-corner_radius,dist]) foot();
  }
  linear_extrude(plate_thickness) hull() {
    translate([corner_radius,corner_radius]) circle(r=corner_radius);
    translate([corner_radius,plate_length-corner_radius]) circle(r=corner_radius);
    translate([plate_width-corner_radius,corner_radius]) circle(r=corner_radius);
    translate([plate_width-corner_radius,plate_length-corner_radius]) circle(r=corner_radius);
  }
}