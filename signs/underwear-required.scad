outside_w = 200;
outside_h = 150;
outside_cr = 25;
banner_h = 40;
banner_margin_h =  5;

$fn=90;

module base() {
  translate([outside_cr - outside_w/2, outside_cr - outside_h/2])
    minkowski() {
      square([outside_w - 2 * outside_cr, outside_h - 2 * outside_cr]);
      circle(outside_cr);
    }
}

module print() {
  difference() {
    translate([-outside_w/2,outside_h/2-banner_h]) square([outside_w, banner_h]);
    translate([outside_w/12,outside_h/2-banner_h/2])
      text("CAUTION", size = banner_h/2, halign = "center", valign = "center", font="Arimo:style=Bold");
    translate([-outside_w/3,outside_h/2-banner_h/2]) difference() {
      scale(banner_h/5) polygon([
        [0,sqrt(3)],
        [2,-sqrt(3)],
        [-2,-sqrt(3)]
      ]);
      
      translate([0,-banner_h/16]) text("!", size = banner_h/2, halign = "center", valign = "center", font="Arimo:style=Bold");
    }
  }
  translate([-outside_w/4-2.5,-banner_h/2]) scale(3) import("noun_Underwear_1700920.svg", center = true);
  translate([10,10])  {
    text("Underwear", size = 12, valign = "center", font="Arimo");
    translate([0,-20]) text("required", size = 12, valign = "center", font="Arimo");
    translate([0,-40]) text("beyond", size = 12, valign = "center", font="Arimo");
    translate([0,-60]) text("this point", size = 12, valign = "center", font="Arimo");
  }
  translate([-5,-outside_h/2]) square([5,outside_h-banner_h]);
}

outside_t = 2;
print_t = 0.6;

module face() {
  translate([0,0,outside_t-print_t]) linear_extrude(print_t)
    intersection() { base(); print(); }
}

module back() {
  difference() {
    linear_extrude(outside_t) base();
    // overshot version of face() to avoid preview z-fighting
    translate([0,0,outside_t-print_t]) linear_extrude(outside_t)
      intersection() { base(); print(); }
  }
}

//color("yellow") back();
color("black") face();
