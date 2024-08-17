measurements = [
  [40, 60, 0],
  [20, 30, 40],
  [20.5, 30.75, 42]
];

pleats = 10;
pleat_height = 5;
tick = -180 / pleats;

function starpoints(ir, or, z) = [
  for (i = [0 : 2 * pleats - 1])
    let (th = i * tick, r = (i % 2 ? or : ir))
      [r * cos(th), r * sin(th), z]
];

function starfaces(level) =
  let (offset = level * 2*pleats, arity = level % 2) [
  // for each face but the last one
  each for (i = [0 : 2*pleats - 2]) [
    // near triangle
    [ offset + i + 2*pleats,
      offset + i,
      offset + i + (i%2 == arity ? 0 : 2*pleats) + 1],
    // far triangle
    [ offset + i + (i%2 == arity ? 2*pleats : 0),
      offset + i + 1,
      offset + i + 2*pleats + 1]
  ],
    // last near triangle
    [ offset + 4*pleats - 1,
      offset + 2*pleats - 1,
      offset + (arity ? 0 : 2*pleats)],
    // last far triangle
    [ offset + 2*pleats + (arity ? 2*pleats : 0) - 1,
      offset,
      offset + 2*pleats]
];

polyhedron([for(rim=measurements)
    each starpoints(rim[0], rim[1], rim[2])],
  [
    [each [2*pleats - 1:-1:0]],
    for(i=[0:len(measurements)-2])
      each starfaces(i),
    [for (i = [0 : 2*pleats - 1])
      (len(measurements)-1)*2*pleats + i]
  ]);
