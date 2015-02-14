rad = 5;
l=20;
bh=5; // baseheight
hh=1; // holderheight
hr=25; //holder rad
hw=3;  //holder width

$fn=150;

module base(){
  linear_extrude(bh)
  hull() {
    translate([rad,rad,0]) circle(rad);
    translate([l+rad,rad,0]) circle(rad);
  }
}

module holder() {
    linear_extrude(hh)
    difference() { 
        circle(hr);
        circle(hr-hw);
    }
}

difference() {
    base();
    translate([15,-18,bh-hh+0.01]) holder();
}
