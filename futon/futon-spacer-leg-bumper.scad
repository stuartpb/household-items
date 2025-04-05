bu = 12.5;
bumper_thick = 4.5;

difference() {
  union() {
    linear_extrude(bumper_thick) {
      square([6*bu+2*bumper_thick, bu+2*bumper_thick],center=true);
    }
    linear_extrude(2*bu+bumper_thick) {
      translate([-3.5*bu,0]) square(bu+2*bumper_thick,center=true);
      translate([3.5*bu,0]) square(bu+2*bumper_thick,center=true);
    }
  }
  linear_extrude(2*bu) {
      translate([-3.5*bu,0]) square(bu,center=true);
      translate([3.5*bu,0]) square(bu,center=true);
    }
}