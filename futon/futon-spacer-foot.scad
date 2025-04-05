bu = 12.5;
bumper_thick = 4.5;

difference() {
  linear_extrude(bu) {
    translate([-bu/2-bumper_thick,-bu/2-bumper_thick])
      square([bu+2*bumper_thick, 4*bu+2*bumper_thick]);
  }
  linear_extrude(bu) {
    square(bu,center=true);
  }
}