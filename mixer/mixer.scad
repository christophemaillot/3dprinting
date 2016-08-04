

// global definitions

$fn = 20;
e = 1;

// our objet dimensions

plateau_epaisseur = 2;  // mm
plateau_rayon = 13;     // mm

horstout_rayon = 17;

ecrou_rayon = 6;

rayon_bottom = 8;
epaisseur_bottom = 4;

ecrou_epaisseur = 3;

// modules

module pie_slice(r=3.0,a=30) {
  $fn=64;
  intersection() {
    circle(r=r);
    square(r);
    rotate(90-a) square(r);
  }
}


module pic() {
    difference() {
        intersection() {
            linear_extrude(10, twist = 30, slices = 20)
                translate([0, 0, -0.5])
                    pie_slice(horstout_rayon, 30);


            linear_extrude(10)
                translate([0, 0, -0.5])
                    pie_slice(horstout_rayon, 30);
        }
        
        
        translate([0, 0, -e])
        cylinder(r = plateau_rayon, h = 10 + 2*e);
        
    }
}    
// our object


difference() {
    union() {
        // plateau principal
        cylinder(r = plateau_rayon, h = plateau_epaisseur );

        // plateau inferieur
        translate([0, 0, -epaisseur_bottom])
            cylinder(r = rayon_bottom, h = epaisseur_bottom);

        // 6 pics exterieurs
        for (r = [0:60:360]) 
            rotate(r)
            pic();
    }

    union() {
        // ecrou
        translate([0, 0, -e - ecrou_epaisseur + plateau_epaisseur]) 
            cylinder(r = ecrou_rayon, $fn = 6, h = ecrou_epaisseur + 2*e);

        // trou central
        translate([0, 0, -epaisseur_bottom])
            translate([0, 0, -e]) cylinder(r = 3, h = epaisseur_bottom + 2 * e);
    }
}



