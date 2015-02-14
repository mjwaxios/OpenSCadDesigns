module callsign() {
  rotate([130,0,0]) linear_extrude(2) text("N1UC", size=3);
}

difference() {
  import("treefrog_45_cut.stl", convexity=3);
  translate([-5,-13.8,10]) callsign();
}