/*
    This module is the for generating fresnel lens models and molds
*/
$fs = 0.01;

MM_PER_INCH = 25.4;
SPHERE_FACETS = 100;
CONE_FACETS   = 100;

LENS_R  = 100.0;
THICKNESS_FRACTION = 0.1;
N_SECTIONS = 5;


module lens_cone(r,s1,s2)
{
    translate([0,0,(1-THICKNESS_FRACTION)*r])
    cylinder(h=r, r1=r*s1, r2=r*s2 , $fn=CONE_FACETS);
}

module fresnel_lens( lens_radius = LENS_R,
   
                      )
{
  translate([0,0,-(1-THICKNESS_FRACTION)*lens_radius])
  intersection()
  {
    sphere(r=lens_radius, $fn=SPHERE_FACETS);
    #lens_cone(r=lens_radius, s1=1/N_SECTIONS, s2= 0);
  }
}
/******************************************************************************/
//rendering of part

fresnel_lens();
