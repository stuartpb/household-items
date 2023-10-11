inch = 25.4;

// original reads came back as 1/4 inch (wrong part of the caliper)
// then it measured 7.5 mm
// the inside seems to shrink significantly during printing, though
axle_d = 8;

wheel_d = inch/2;
wheel_w = inch * 1.5;

cap_d = inch;
cap_w = 6;

inset_d = inch*3/16;
inset_w = 2.75;
end_w = 1.5;

pin_tol = 0.3;
overshot = 0.1;

$fn = 90;

module bearing() {
  difference () {
    cylinder(d=wheel_d, h=wheel_w);
    translate([0,0,-overshot]) cylinder(d=axle_d, h=wheel_w + 2*overshot);
  }
}

module cap() {
  difference () {
    cylinder(d=cap_d, h=cap_w);
    translate([0,0,-overshot]) cylinder(d=axle_d, h=cap_w + 2*overshot);
    translate([-cap_d/2,-axle_d/2-pin_tol,end_w-pin_tol]) cube([cap_d,axle_d+2*pin_tol,inset_w+2*pin_tol]);
  }
}

module pin() {
  intersection() {
    difference() {
      cylinder(d=cap_d, h=inset_w);
      translate([0,0,-overshot]) cylinder(d=inset_d, h=inset_w + 2*overshot);
      translate([0,-inset_d/2,-overshot]) cube([cap_d/2,inset_d,inset_w+2*overshot]);
    }
    translate([-cap_d/2,-axle_d/2,0]) cube([cap_d,axle_d,inset_w]);
  }
}
cap();
/*translate([0,0,end_w]) color("yellow")*/ //pin();
//bearing();
