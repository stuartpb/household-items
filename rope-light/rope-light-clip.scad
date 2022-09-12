rope_diam = 12.7;
base_length = 15;
clip_thickness = 2;
clip_width = 10;

linear_extrude(base_length) difference() {
  hull() {
    translate([0,rope_diam/2]) circle(d=rope_diam + 2*clip_thickness);
    translate([0,-clip_thickness/2])
      square([rope_diam + 2*clip_thickness,clip_thickness],center=true);
  }
  translate([0,rope_diam/2]) circle(d=rope_diam);
  polygon([
    [rope_diam/2 + clip_thickness,rope_diam+clip_thickness],
    [0,0],
    [-rope_diam/2 - clip_thickness,rope_diam+clip_thickness],]);
}