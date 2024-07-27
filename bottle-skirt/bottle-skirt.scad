ir_base = 9.5;
or_base = 10.5;
bottom_scale = 5;
waist_scale = 3;
bust_scale = 4;

waist_height = 40;
bust_height = 60;

module starburst(points = 10, ir, or) {
  tick = 180/points;
  polygon([
      for (i=[0:points*2-1])
      let (th = tick *i, r=i%2?ir:or)
      [r*cos(th), r*sin(th)] ]);
}
linear_extrude(height = waist_height, scale=waist_scale/bottom_scale)
  starburst(10, or_base*bottom_scale, ir_base*bottom_scale);
linear_extrude(height = bust_height, scale=bust_scale) starburst(10, or_base, ir_base);