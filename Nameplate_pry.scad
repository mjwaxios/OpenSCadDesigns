SLEN = 20;
LEN = 100;

TSIZE = 20;
TEXTH = 3;

module base() {
    translate([-LEN/2,-SLEN/2,0]) {
      rotate([90,0,90]) {
        Y = sqrt((SLEN * SLEN) - (SLEN/2)*(SLEN/2));
        linear_extrude(LEN) {
        polygon([ [0,0], [SLEN,0], [SLEN/2, Y]] );
      }
    }
  }
}

module txt(T) {
  translate([0,-SLEN/2,0]) {
    rotate([60,0,0]) {
      linear_extrude(TEXTH) {
        text(T, size=TSIZE, halign="center", valign="lower");
      }
    }
  }
}

//------------------------------------------------------

color("white") base();
color("blue") txt("N3UCC");

