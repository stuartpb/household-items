//Measurements
backgrasp = 20;
gap = 1.5;
inset = 34; // living room window = 20
protrusion = 13;

//parameters
wingrasp = 10;
winhold = 5;
backhold = 5;
edge = 10;
o= .1;

linear_extrude(10) {
  difference() {
    square([inset + wingrasp + edge, winhold + protrusion + gap + backhold]);
    #translate([-o,-o]) square([o+inset - backgrasp +wingrasp, o+backhold+o]);
    translate([-o, backhold]) square([o+inset+wingrasp, gap]);
    translate([-o, backhold]) square([wingrasp, gap+protrusion]);
    #translate([15,12]) square([60,60]);
  }
}
