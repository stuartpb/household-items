inch = 25.4;

// original reads came back as 1/4 inch (wrong part of the caliper)
// then it measured 7.5 mm
// the inside seems to shrink significantly during printing, though
axle_d = 8;

wheel_d = inch/2;
wheel_w = inch * 1.5;

hubcap_d = inch;
hubcap_w = 6;

inset_d = inch*3/16;
inset_w = 2.75;
end_w = 1.5;

pin_tol = 0.3;
overshot = 0.1;

$fn = 90;

module tube() {
  difference () {
    cylinder(d=wheel_d, h=wheel_w);
    translate([0,0,-overshot]) cylinder(d=axle_d, h=wheel_w + 2*overshot);
  }
}

module hubcap() {
  difference () {
    cylinder(d=hubcap_d, h=hubcap_w);
    translate([0,0,-overshot]) cylinder(d=axle_d, h=hubcap_w + 2*overshot);
    translate([-hubcap_d/2,-axle_d/2-pin_tol,end_w-pin_tol]) cube([hubcap_d,axle_d+2*pin_tol,inset_w+2*pin_tol]);
  }
}

module pin() {
  intersection() {
    difference() {
      cylinder(d=hubcap_d, h=inset_w);
      translate([0,0,-overshot]) cylinder(d=inset_d, h=inset_w + 2*overshot);
      translate([0,-inset_d/2,-overshot]) cube([hubcap_d/2,inset_d,inset_w+2*overshot]);
    }
    translate([-hubcap_d/2,-axle_d/2,0]) cube([hubcap_d,axle_d,inset_w]);
  }
}
hubcap();
/*translate([0,0,end_w]) color("yellow")*/ //pin();
//tube();
