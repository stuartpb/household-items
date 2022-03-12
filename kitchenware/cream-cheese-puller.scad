t=0.3;
w=42;
module slot() {
  square([w,t], center=true);
}

$fs=1;
linear_extrude(1) difference() {
  offset(r=3) slot();
  slot();
}