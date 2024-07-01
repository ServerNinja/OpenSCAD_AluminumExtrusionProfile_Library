$fn = 100;

include <AluminumExtrusionProfile.scad>
// 2020 Extrusion Profile
/*
linear_extrude(140) 
  translate([0, 0, 0])
    2020_extrusion_profile(slot = "v");
*/

linear_extrude(210) 
  translate([0, 0, 0])
    2040_extrusion_profile(slot = "v");
/*
linear_extrude(10) 
  translate([0, 0, 0])
    2060_extrusion_profile(slot = "v");

linear_extrude(10) 
  translate([0, 0, 0]) rotate([0,0,0]) 
    2080_extrusion_profile(slot = "v");

linear_extrude(10) 
  translate([0, 0, 0]) rotate([0,0,0]) 
    4080_extrusion_profile(slot = "v");


// 3030 Extrusion Profile
linear_extrude(10) 
  translate([0, 0, 0])
    3030_extrusion_profile(slot = "v");

// 3030 Extrusion Profile
linear_extrude(200) 
  translate([0, 0, 0])
    4040_extrusion_profile(slot = "v");
*/