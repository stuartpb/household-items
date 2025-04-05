width = 20;
outer_height = 6.6;
inner_height = 0;
tread_height = 1;
tread_depth = 0.8;
length = 62;

module tread_rhomboid() {
  polygon([[4,0],[0,0],[0,3],[5,8],[12,8]]);
}
module tread_chevron() {
  union() {
    tread_rhomboid();
    translate([20,0,0]) mirror([1,0]) tread_rhomboid();
  }
}

module tread_unit() {
  union() {
    translate([0,10,0]) mirror([0,1]) tread_chevron();
    translate([0,12,0]) tread_chevron();
  }
}

module tread_neg() {
  for (y = [0:20:length]) {
    translate([0,y,0]) tread_unit();
  }
}

difference() {
    cube([width,length,outer_height+tread_height]);
    translate([0,length+1,0]) rotate([90,0,0]) linear_extrude(length+2) polygon([
        [0, 0],
        [width, outer_height-inner_height],
        [width, 0]
    ]);
    translate([0,0,outer_height+tread_height-tread_depth])
      linear_extrude(tread_height) 
    tread_neg();
}