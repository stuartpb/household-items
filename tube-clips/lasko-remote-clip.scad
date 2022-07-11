clip_diameter = 36; //40;
clip_thickness = 2.5;
clip_height = 50;
more = 1;

union(){
  translate([-2.5,0,35]) rotate([-90,0,0])
    import("lasko-wall-fan-remote-holder-v1.stl");
  
  // erase screw holes
  translate([-7.5,0,0]) cube([15,2.5,50]); 
  
  translate([0,-clip_diameter/2,0]) difference() {
    cylinder(d=clip_diameter + 2*clip_thickness, h=clip_height);
    translate([0,0,-more]) linear_extrude(clip_height+2*more) {
      circle(d=clip_diameter);
      polygon([
        [0,0],
        [-clip_diameter/2,-clip_diameter],
        [clip_diameter/2,-clip_diameter]
      ]);
    }
  }
}