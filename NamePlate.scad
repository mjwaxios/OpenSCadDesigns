BASEL = 80;
BASEH = 40;
BASET = 10;
BASEC = 15;
TEXTT = 5;
TEXTSIZE = 20;

MOUNTHOLEDIST = 5;
MOUNTHOLESIZE = 2;

//-------------------------------------------------------
$fn=50;

module base() {
  linear_extrude(BASET) {  
    hull() {
      translate([(-BASEL/2)+BASEC, (-BASEH/2)+BASEC,0])  circle(r=BASEC);
      translate([(-BASEL/2)+BASEC, (BASEH/2)-BASEC,0])  circle(r=BASEC);
      translate([(BASEL/2)-BASEC, (-BASEH/2)+BASEC,0])  circle(r=BASEC);
      translate([(BASEL/2)-BASEC, (BASEH/2)-BASEC,0])  circle(r=BASEC);
    }  
  }
}

module MountHoles() {
    translate([-(BASEL/2) + MOUNTHOLEDIST, 0, -0.01]) cylinder(r=MOUNTHOLESIZE, h=BASET+0.02);
    translate([+(BASEL/2) - MOUNTHOLEDIST, 0, -0.01]) cylinder(r=MOUNTHOLESIZE, h=BASET+0.02);
}

module DoText(Txt) {
    linear_extrude(TEXTT) {
      text(Txt, size=TEXTSIZE, halign="center", valign="center", font="Times New Roman", style="bold");  
    }
}

module MoveText(Txt, InOut) {
  if (InOut == 1) {
    difference() {
      base();
      MountHoles();
    }
    translate([0,0, BASET-0.01]) DoText(Txt);
  } else {
    difference() {
      base();
      MountHoles();
      translate([0,0, BASET+0.01-TEXTT]) DoText(Txt);
    }
  }
}

//-------------------------------------------------------
//-------------------------------------------------------
//-------------------------------------------------------

// Lets build it
// Send InOut with a 1 to place text ontop, 0 to place text inside
MoveText("Larry", 0);





