$fn = 100;

include <AluminumExtrusionProfile.scad>
// 2020 Extrusion Profile
linear_extrude(10) 
  translate([0, 0, 0])
    2020_extrusion_profile(slot = "t");

linear_extrude(10) 
  translate([0, 40, 0])
    2040_extrusion_profile(slot = "t");

linear_extrude(10) 
  translate([0, 80, 0])
    2060_extrusion_profile(slot = "t");
  
linear_extrude(10) 
  translate([40, 20, 0]) rotate([0,0,90]) 2080_extrusion_profile(slot = "t");
  
linear_extrude(10) 
  translate([60, -70, 0]) rotate([0,0,90]) 4080_extrusion_profile(slot = "v");

// 3030 Extrusion Profile
linear_extrude(10) 
  translate([0, -50, 0])
    3030_extrusion_profile(slot = "v");

// 3030 Extrusion Profile
linear_extrude(10) 
  translate([0, -100, 0])
    4040_extrusion_profile(slot = "v");
