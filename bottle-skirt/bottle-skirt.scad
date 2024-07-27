ir_base = 9.5;
or_base = 10.5;
bottom_scale = 5;
bust_scale = 4;

measurements = [
  [47.5, 0],
  [28.5, 40],
  [38, 60]
];

pleats = 10;
pleat_height = 5;
tick = 180 / pleats;

function starpoints(ir, z) = [
  for (i = [0 : 2 * pleats - 1])
    let (th = i * tick, r = ir + (i % 2 ? pleat_height : 0))
      [r * cos(th), r * sin(th), z]
];

function starfaces(level) = [
  for (i = [level * 2*pleats : (level+1) * 2*pleats - 2])
    [i, i+1, (i+1) + 2*pleats, i + 2*pleats],
  [(level+1) * 2*pleats - 1, level * 2*pleats,
    (level+1) * 2*pleats, (level+2) * 2*pleats - 1]
];

polyhedron([for(rim=measurements)
    each starpoints(rim[0], rim[1])],
  [
    [for (i = [0 : 2*pleats - 1])
      i],
    for(i=[0:len(measurements)-2])
      each starfaces(i),
    [for (i = [0 : 2*pleats - 1])
      (len(measurements)-1)*2*pleats + i]
  ]);
echo(  [
    [for (i = [0 : 2*pleats - 1])
      i],
    for(i=[0:len(measurements)-2])
      each starfaces(i),
    [for (i = [0 : 2*pleats - 1])
      (len(measurements)-1)*2*pleats + i]
  ]);