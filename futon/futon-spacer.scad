block_h = 25;
leg_w = 66;
leg_d = 25;
side_w = 25;
space_d = 140;
block_d = space_d + leg_d;
difference() {
  cube([leg_w+side_w*2,block_d,block_h],center=true);
  translate([0,block_d/2,0]) cube([leg_w,leg_d*2,block_h+2], center=true);
}