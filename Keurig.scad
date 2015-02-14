/* Original Numbers, Clips too small, to tight
$fn=50;
BASEH = 2;
CORNERR = 2.5;
SHORTL = 14;
LONGL = 23.5;
TCLIPW = 5;
TCLIPL = 8;
TCLIPTH = 9.25;
TCLIPH = 1;

SCLIPW = 5;
SCLIPL = 2.3;
SCLIPTH = 4.3;
SCLIPH = 1;

RINGI = 19.5;
RINGO = 25;
*/

$fn=50;
BASEH = 2;
CORNERR = 2.5;
SHORTL = 14;
LONGL = 23.5;
TCLIPW = 5;
TCLIPL = 8;
TCLIPTH = 9.25;
TCLIPH = 1;

SCLIPW = 5;
SCLIPL = 2.3;
SCLIPTH = 4.3;
SCLIPH = 1;

RINGI = 19.5;
RINGO = 25;

module base() {
  linear_extrude(BASEH) {
    hull() {
      translate([CORNERR,CORNERR,0]) circle(r=CORNERR);
      translate([CORNERR+SHORTL, CORNERR,0]) circle(r=CORNERR);
      translate([CORNERR+SHORTL, CORNERR+LONGL,0]) circle(r=CORNERR);
      translate([CORNERR, CORNERR+LONGL,0]) circle(r=CORNERR);
    }  
  }
}

module cliptall() {
  cube([TCLIPL,TCLIPW,TCLIPH]); 
  cube([TCLIPH,TCLIPW,TCLIPH+TCLIPTH+TCLIPH]);
  translate([1,0,TCLIPTH+TCLIPH+TCLIPH])
    rotate([-90,0,0])
      linear_extrude(TCLIPW) 
        polygon(points=[[0,0], [0,1], [1,1]]);
}

module clipshort() {
  rotate([0,0,180])
  translate([-SCLIPL,-SCLIPW,0]) {
  cube([SCLIPL,SCLIPW,SCLIPH]); 
  cube([SCLIPH,SCLIPW,SCLIPH+SCLIPTH+SCLIPH]);
  translate([1,0,SCLIPTH+SCLIPH+SCLIPH])
    rotate([-90,0,0])
      linear_extrude(SCLIPW) 
        polygon(points=[[0,0], [0,1], [1,1]]);
  }
}

module ring() {
    linear_extrude(1.01) 
    difference() {
        circle(r=RINGO);
        circle(r=RINGI);
    }
}

// Build it
module clip() {
  translate([TCLIPL-0.01,0,0]) base();
  translate([0,LONGL/2,0]) cliptall();
  translate([TCLIPL+SHORTL+CORNERR*2-0.02,LONGL/2.0,0]) clipshort();
}

// Put the Clip and Ring together
difference() {
    clip();
    translate([37,5,1.5]) ring();
}

