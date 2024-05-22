base_d = 42;
top_d = 33;
inner_d = 29;

space = 5; 

over = 1;

$fn=90;

difference() {
  cylinder(h=space, d1=base_d, d2 = top_d);
  translate([0,0,-over]) cylinder(d=inner_d, h = space+2*over);
}