
$fn = 100;

$stand_x = 45;
$stand_y = 55;
$stand_h = 8;

$charger_int_radius_bottom = 38; //36
$charger_int_radius_top = 39.5;  //37.5


$charger_ext_radius_bottom = 46;
$charger_ext_radius_top = 49;


$charger_ext_h = 15;

$larg_1 = 20; // 18



translate([0, 0, 50])
rotate([0, 45, 0])
difference() {
    translate([0, 0, 3]) cube([$stand_x, $stand_y, $stand_h], center = true);

    union() {
        intersection() {
            cylinder(h = $charger_ext_h, r1= $charger_ext_radius_bottom / 2, r2 = $charger_ext_radius_top / 2);
            cube([$larg_1, 150, 50], center=true);
        }
        cylinder(h = $charger_ext_h, r1= $charger_int_radius_bottom / 2, r2 = $charger_int_radius_top / 2);  
        
        translate([0, 30, 5]) cube([8, 60, 8], center = true);
    }
}

difference() {
    union() {
        translate([21, -25-6, 0]) rotate([0,0,90]) cube([6, 38, 71]);
        translate([21, 25-3+3, 0]) rotate([0,0,90]) cube([6, 38, 71]);
    }
    translate([25,-40,35])    rotate([0, -45, 0])cube([50, 80, 60]);
       translate([3, 10, 53]) rotate([0, 45,0]) cube([4, 70, 8], center = true);
    

}


