rope_diam = 12.7;
base_length = 15;
clip_thickness = 2;
clip_width = 10;
well_diameter = 10;
well_depth = 3;

module base_clip() {
  linear_extrude(base_length) difference() {
    hull() {
      translate([0,rope_diam/2]) circle(d=rope_diam + 2*clip_thickness);
      translate([0,-(well_depth+clip_thickness)/2])
        square([rope_diam + 2*clip_thickness,well_depth+clip_thickness],center=true);
    }
    translate([0,rope_diam/2]) circle(d=rope_diam);
    polygon([
      [rope_diam/2 + clip_thickness,rope_diam+clip_thickness],
      [0,0],
      [-rope_diam/2 - clip_thickness,rope_diam+clip_thickness],]);
  }
}

difference () {
  base_clip();
  translate([0,-clip_thickness,base_length/2]) rotate([90,0,0]) cylinder(d=well_diameter,h=well_depth+clip_thickness); 
}