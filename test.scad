SLEN = 30;
LEN = 120;
Y = sqrt((SLEN * SLEN) - (SLEN/2)*(SLEN/2));
X = tan(30) * (SLEN/2);

TSIZE = 20;
TEXTH = 3;

module base() {
    translate([-LEN/2,-SLEN/2,(TEXTH)-0.01]) {
      rotate([90,0,90]) {
        linear_extrude(LEN) {
        polygon([ [0,0], [SLEN,0], [SLEN/2, Y]] );
      }
    }
  }
}

module txt(T) {
  mirror() {
    linear_extrude(TEXTH) {
      text(T, size=TSIZE, halign="center", valign="center");
    }
  }      
}

//------------------------------------------------------
echo("Y is", Y);
echo("X is", X);
rotate([0,0,180]) {
  translate([0,0, X]) {
    rotate([120,0,0]) {
      translate([0,0, -(TEXTH + X)]) {
        color("blue") txt("RIATER");
        color("white") base();
      }
    }
  }
}
