/* 

  Uncomment lines below for testing....

*/

//$fn = 100;
//2020_extrusion_profile(slot = "t");
//2040_extrusion_profile(slot = "t");
//2060_extrusion_profile(slot = "t");
//2080_extrusion_profile(slot = "t");
//4080_extrusion_profile(slot = "v");
//4040_extrusion_profile(slot = "v");
//3030_extrusion_profile(slot = "t");


/* 

  2D Extrusion profile modules

*/
// Creates a 2D 2020 Extrusion Profile
module 2020_extrusion_profile(slot = "t", left_open = false, right_open = false, upper_open = false, lower_open = false, outer_square_base = true) {
        
        fillet=0.5;
        square_size=20;
        inner_circle_radius=2.5;
        inner_circle_opening=11;
        outer_circle_opening=6.2;
        channel_depth=6.1;
        lip_depth = 1.8;
        
        extrusion_profile(slot, fillet, square_size, inner_circle_radius, inner_circle_opening, outer_circle_opening, channel_depth, lip_depth, left_open, right_open, upper_open, lower_open, outer_square_base = outer_square_base);   
}

// Creates a 2D 2040 Extrusion Profile
module 2040_extrusion_profile(slot = "t") { 
   difference() {
       outer_rectangle_with_fillet(0.5, 40, 20);
           
       // Cut between the two 2020 extrusions
       translate([0, 0 , 0]) 2020_rectangle_cut();   
    
        // Left
       translate([-10,0,0]) 2020_extrusion_profile(slot, outer_square_base = false);
       
       // right
       translate([10,0,0]) 2020_extrusion_profile(slot, outer_square_base = false);  
   }
}

// Creates a 2D 2060 Extrusion Profile
module 2060_extrusion_profile(slot = "t") {
   difference() {
       outer_rectangle_with_fillet(0.5, 60, 20);
           
       // Cut between the two 2020 extrusions
       translate([-10, 0 , 0]) 2020_rectangle_cut();
       translate([10, 0 , 0]) 2020_rectangle_cut(); 
        // Left
       translate([-20,0,0]) 2020_extrusion_profile(slot, outer_square_base = false);
       // middle
       translate([0,0,0]) 2020_extrusion_profile(slot, outer_square_base = false);
       // right
       translate([20,0,0]) 2020_extrusion_profile(slot, outer_square_base = false); 
   }
}

// Creates a 2D 2080 Extrusion Profile
module 2080_extrusion_profile(slot = "t") { 
   difference() {
       outer_rectangle_with_fillet(0.5, 80, 20);
           
       // Cut between the two 2020 extrusions
       translate([0, 0 , 0]) 2020_rectangle_cut();
       translate([-20, 0 , 0]) 2020_rectangle_cut(); 
       translate([20, 0 , 0]) 2020_rectangle_cut();
    
        // Left
       translate([-30,0,0]) 2020_extrusion_profile(slot, outer_square_base = false);
       translate([-10,0,0]) 2020_extrusion_profile(slot, outer_square_base = false);
       // right
       translate([10,0,0]) 2020_extrusion_profile(slot, outer_square_base = false);
       translate([30,0,0]) 2020_extrusion_profile(slot, outer_square_base = false);  
   }
}


module 2020_between_cut() {
  hull() {
     translate([.5, 10- 2.3, 1]) circle(0.5);
     translate([-.5, 10- 2.3, 1]) circle(0.5);
     translate([2.1, 10- 3.8, 1]) circle(0.5);
     translate([-2.1, 10- 3.8, 1]) circle(0.5);
     translate([2.1, -10+ 3.8, 1]) circle(0.5);
     translate([-2.1, -10+ 3.8, 1]) circle(0.5);
     translate([.5, -10 + 2.3, 1]) circle(0.5);
     translate([-.5, -10 + 2.3, 1]) circle(0.5);
   }  
}

module 2020_rectangle_cut() { 
   width = 5;
   height = 16.4;

   translate([-width/2, -height/2 , 0]) square([width, height]);
}

// Creates a 2D 4080 Extrusion Profile
module 4080_extrusion_profile(slot = "t") {
   difference() {
     union() {
       outer_rectangle_with_fillet(0.5, 80, 20);
       translate([30, 10, 0]) outer_rectangle_with_fillet(0.5, 20, 40);
       translate([-30, 10, 0]) outer_rectangle_with_fillet(0.5, 20, 40);
     }
     
     // Middle cuts between 2020 extrusions
     translate([0,0,0]) 2020_rectangle_cut();
     translate([-20, 0, 0]) 2020_between_cut();
     translate([20, 0, 0]) 2020_between_cut();
     translate([30, 10, 0]) rotate([0,0,90]) 2020_between_cut();
     translate([-30, 10, 0]) rotate([0,0,90]) 2020_between_cut();
     
     // Upper Left
     translate([-30, 20, 0]) 2020_extrusion_profile(slot, outer_square_base = false);
     // Lower - from Left to Right
     translate([-30, 0, 0]) 2020_extrusion_profile(slot, outer_square_base = false);
     translate([-10, 0, 0]) 2020_extrusion_profile(slot, outer_square_base = false);
     translate([10, 0, 0]) 2020_extrusion_profile(slot, outer_square_base = false);
     translate([30, 0, 0]) 2020_extrusion_profile(slot, outer_square_base = false);
     // Upper Right
     translate([30, 20, 0]) 2020_extrusion_profile(slot, outer_square_base = false);
   }
}

// Creates a 2D 4040 Extrusion Profile
module 4040_extrusion_profile(slot = "t") {
   difference() {
       
     outer_square_with_fillet(0.5, 40);
     4040_extrusion_profile_square(slot, outer_square_base = false);
       
     // Cut diamond in middle
     translate([0, 0,0]) rotate([0,0,45]) square(19, center = true);
     // Other middle cuts
     translate([0,10,0]) 2020_rectangle_cut();
     translate([0,-10,0]) 2020_rectangle_cut();
     translate([10,0,0]) rotate([0,0,90]) 2020_rectangle_cut();
     translate([-10,0,0]) rotate([0,0,90]) 2020_rectangle_cut(); 
   }    
}

// Used by the 4040_extrusion_profile module in order to combine 2020 extrusions
module 4040_extrusion_profile_square(slot, outer_square_base) {
   // Upper Left
   translate([-10,10,0]) 2020_extrusion_profile(slot,outer_square_base = outer_square_base);
   // Upper Right
   translate([10,10,0]) 2020_extrusion_profile(slot,outer_square_base = outer_square_base);
   // Lower right
   translate([-10,-10,0]) 2020_extrusion_profile(slot, outer_square_base = outer_square_base); 
   // Lower Left
   translate([10,-10,0]) 2020_extrusion_profile(slot,outer_square_base = outer_square_base); 
}

// Creates a 2D 3030 Extrusion Profile
module 3030_extrusion_profile(slot = "t", left_open = false, right_open = false, upper_open = false, lower_open = false) {
        
        fillet=.8;
        square_size=30;
        inner_circle_radius=3.4;
        inner_circle_opening=16.5;
        outer_circle_opening=8.2;
        channel_depth=9.2;
        lip_depth = 2.2;
        
        extrusion_profile(slot, fillet, square_size, inner_circle_radius, inner_circle_opening, outer_circle_opening, channel_depth, lip_depth, left_open, right_open, upper_open, lower_open);   
}

// Basic extrusion module - creates a 2d extrusion profile based on input parameters
module extrusion_profile(slot, fillet, square_size, 
    inner_circle_radius, inner_circle_opening, outer_circle_opening, channel_depth, lip_depth, left_open = false, right_open = false, upper_open = false, lower_open = false, outer_square_base = true) {
      
    // This determines if the result should be the extrusion profile or just the cuts for the profile
    if (outer_square_base) {
        difference() {
        // Create the outer shape
        outer_square_with_fillet(fillet, square_size);
            
        // Cut into outer shape
        extrusion_cuts(slot, fillet, square_size, 
    inner_circle_radius, inner_circle_opening, outer_circle_opening, channel_depth, lip_depth, left_open = left_open, right_open = right_open, upper_open = upper_open, lower_open = lower_open);  
        }
    } else {
        // Just provide the cuts
        extrusion_cuts(slot, fillet, square_size, 
    inner_circle_radius, inner_circle_opening, outer_circle_opening, channel_depth, lip_depth, left_open = left_open, right_open = right_open, upper_open = upper_open, lower_open = lower_open);    
    }

}

module extrusion_cuts(slot, fillet, square_size, 
    inner_circle_radius, inner_circle_opening, outer_circle_opening, channel_depth, lip_depth, left_open = false, right_open = false, upper_open = false, lower_open = false) {
    
    // Create the hole in the middle
    inner_circle_opening(square_size, inner_circle_radius);
   
    // Upper Opening
    rotate([0,0,0]) slot_opening(slot, fillet, channel_depth, square_size, outer_circle_opening, inner_circle_opening, lip_depth, open = upper_open);
    
    // Right Opening
    rotate([0,0,90]) slot_opening(slot, fillet, channel_depth, square_size, outer_circle_opening, inner_circle_opening,lip_depth, open = left_open);
    
    // Lower Opening
    rotate([0,0,180]) slot_opening(slot, fillet, channel_depth, square_size, outer_circle_opening, inner_circle_opening, lip_depth, open = lower_open);
    
    // Left Opening
    rotate([0,0,270]) slot_opening(slot, fillet, channel_depth, square_size, outer_circle_opening, inner_circle_opening, lip_depth, open = right_open);      
}

/*

NOTE: The below modules are called by the extrusion_profile module in order to build a basic square extrusion

*/

// Builds a blank square
module outer_square_with_fillet(fillet, square_size) {
    hull() {
        // Lower Left
        translate([0 - square_size/2 + fillet, 0-square_size/2 + fillet, 0]) circle(fillet);

        // Lower Right
        translate([0 + square_size/2 - fillet, 0-square_size/2 + fillet, 0]) circle(fillet);
        // Upper Right
        translate([0 + square_size/2 - fillet, 0 + square_size/2 - fillet, 0]) circle(fillet);

        // Upper Left
        translate([0 - square_size/2 + fillet, 0 + square_size/2 - fillet, 0]) circle(fillet);    
    }
}

module outer_rectangle_with_fillet(fillet, x, y) {
    hull() {
        // Lower Left
        translate([0 - x/2 + fillet, 0-y/2 + fillet, 0]) circle(fillet);

        // Lower Right
        translate([0 + x/2 - fillet, 0-y/2 + fillet, 0]) circle(fillet);
        // Upper Right
        translate([0 + x/2 - fillet, 0 + y/2 - fillet, 0]) circle(fillet);

        // Upper Left
        translate([0 - x/2 + fillet, 0 + y/2 - fillet, 0]) circle(fillet);    
    }
}

// Drill a hole in the center of the square
module inner_circle_opening(square_size, inner_circle_radius) {
    translate([0,0,0]) circle(inner_circle_radius);
}

// Cut a single slot opening
module slot_opening(slot, fillet, channel_depth, square_size, outer_channel_opening, inner_channel_opening, lip_depth, open =false) {
    
    // Channel Opening
    hull() {
        // Upper Left
        translate([0 - (outer_channel_opening/2) + fillet, square_size/2, 0]) circle(fillet);  
        // Upper Right
        translate([0 + (outer_channel_opening/2) - fillet, square_size/2, 0]) circle(fillet); 
        // Lower Left
        translate([0 - (outer_channel_opening/2) + fillet, square_size/2 - channel_depth + fillet , 0]) circle(fillet);  
        // Lower Right
        translate([0 + (outer_channel_opening/2) - fillet, square_size/2 - channel_depth + fillet, 0]) circle(fillet);  
    }
 
    if (open) {    
       hull() {
          //translate([0 - (inner_channel_opening/2) - fillet - lip_depth, square_size/2 - lip_depth - fillet, 0]) circle(fillet);
          translate([0 +(inner_channel_opening/2) + fillet + lip_depth, square_size/2 - lip_depth - fillet, 0]) circle(fillet);
          translate([0 - (inner_channel_opening/2) -fillet - lip_depth, square_size/2 - fillet + lip_depth, 0]) circle(fillet);
          translate([0 + (inner_channel_opening/2) + fillet + lip_depth, square_size/2 - fillet + lip_depth, 0]) circle(fillet);
       }   
    }
    // Notch in Opening (for T Slot)
    if (slot == "t") {
        hull() {
              // Upper Left
              translate([0 - (outer_channel_opening/2) + fillet, square_size/2 + square_size/25 , 0]) square(square_size/7.5, center = true);  
              // Upper Right
              translate([0 + (outer_channel_opening/2) - fillet, square_size/2+ square_size/25, 0]) square(square_size/7.5, center = true); 
        }
    } else if (slot == "v") {
        // Cuts in usiung two squares rotated on 45 degree angle
        translate([-(lip_depth + square_size/20 - .1), square_size/2, 0]) rotate([0,0,45]) square(lip_depth*2, center = true);
        translate([(lip_depth + square_size/20 - .1), square_size/2, 0]) rotate([0,0,45]) square(lip_depth*2, center = true);
    }
  
  // Upper Left Triangle
  /*
      xxxxx
        xxx 
          x
  */
  hull() {
        translate([0 - (outer_channel_opening/2) + fillet, square_size/2 - lip_depth - fillet, 0]) circle(fillet);
        translate([0 - (inner_channel_opening/2) - fillet, square_size/2 - lip_depth - fillet, 0]) circle(fillet);
        translate([0 - (outer_channel_opening/2) + fillet, square_size/2 - channel_depth + fillet , 0]) circle(fillet); 
  }
  // Upper Right Triangle
  /*
      xxxxx
      xxx   
      x   
  */
    hull() {
        translate([0 + (outer_channel_opening/2) - fillet, square_size/2 - lip_depth - fillet, 0]) circle(fillet);
        translate([0 + (inner_channel_opening/2) + fillet, square_size/2 - lip_depth - fillet, 0]) circle(fillet);
        translate([0 + (outer_channel_opening/2) - fillet, square_size/2 - channel_depth + fillet, 0]) circle(fillet);
  }
}
