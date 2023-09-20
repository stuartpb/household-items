translate([-10,-200]) {
  linear_extrude(10) import("blinds-clip.svg");
  translate([0,0,4]) linear_extrude(2) import("blinds-clip-armpit.svg");
}