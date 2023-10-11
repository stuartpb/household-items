outer_diameter = 23;
inner_diameter = outer_diameter - 6;
height = 18.5;
peg_diameter = 5;
peg_length = 6.5;
ridge_diameter = 1.5;
ridge_count = 8;
ridge_arc = 90;
ridge_retract = 0.25;
open_angle = 75;
foot_length = 6;
heel_diameter = 4;
toe_diameter = 3;
foot_twist = 0;

$fn = 90;

outer_radius = outer_diameter / 2;
inner_radius = inner_diameter / 2;

module heel() {
  rotate(-90+open_angle/2) 
  translate([(outer_radius+inner_radius)/2,0])
  rotate(foot_twist) hull() {
    circle(d=heel_diameter);
    translate([foot_length-(heel_diameter+toe_diameter)/2,0,0])
      circle(d=toe_diameter);
  }
}

module ridges() {
  ridge_start = ridge_arc / 2;
  ridge_deg_sep = ridge_arc / (ridge_count-1);
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
      polygon([[0,0],
        [outer_diameter*sin(open_angle/2),-outer_diameter*cos(open_angle/2)],
        [-outer_diameter*sin(open_angle/2),-outer_diameter*cos(open_angle/2)]]);
    }
    ridges();
    heel();
    mirror([1,0,0]) heel();
  }
}

linear_extrude(height) outline();
translate([0,inner_radius,height/2]) rotate([90,0,0]) cylinder(d=peg_diameter, h=peg_length);
