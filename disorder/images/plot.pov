// POV 3.x input script : /home/wlm2105/Dropbox/Documents/disorder/image/plot.pov 
// try povray +W616 +H560 -I/home/wlm2105/Dropbox/Documents/disorder/image/plot.pov -O/home/wlm2105/Dropbox/Documents/disorder/image/plot.pov.tga +P +X +A +FT +C
#if (version < 3.5) 
#error "POV3DisplayDevice has been compiled for POV-Ray 3.5 or above.\nPlease upgrade POV-Ray or recompile VMD."
#end 
#declare VMD_clip_on=array[3] {0, 0, 0};
#declare VMD_clip=array[3];
#declare VMD_scaledclip=array[3];
#declare VMD_line_width=0.0020;
#macro VMDC ( C1 )
  texture { pigment { rgbt C1 }}
#end
#macro VMD_point (P1, R1, C1)
  #local T = texture { finish { ambient 1.0 diffuse 0.0 phong 0.0 specular 0.0 } pigment { C1 } }
  #if(VMD_clip_on[2])
  intersection {
    sphere {P1, R1 texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
    VMD_clip[2]
  }
  #else
  sphere {P1, R1 texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
  #end
#end
#macro VMD_line (P1, P2, C1)
  #local T = texture { finish { ambient 1.0 diffuse 0.0 phong 0.0 specular 0.0 } pigment { C1 } }
  #if(VMD_clip_on[2])
  intersection {
    cylinder {P1, P2, VMD_line_width texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
    VMD_clip[2]
  }
  #else
  cylinder {P1, P2, VMD_line_width texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
  #end
#end
#macro VMD_sphere (P1, R1, C1)
  #local T = texture { pigment { C1 } }
  #if(VMD_clip_on[2])
  intersection {
    sphere {P1, R1 texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
    VMD_clip[2]
  }
  #else
  sphere {P1, R1 texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
  #end
#end
#macro VMD_cylinder (P1, P2, R1, C1, O1)
  #local T = texture { pigment { C1 } }
  #if(VMD_clip_on[2])
  intersection {
    cylinder {P1, P2, R1 #if(O1) open #end texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
    VMD_clip[2]
  }
  #else
  cylinder {P1, P2, R1 #if(O1) open #end texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
  #end
#end
#macro VMD_cone (P1, P2, R1, C1)
  #local T = texture { pigment { C1 } }
  #if(VMD_clip_on[2])
  intersection {
    cone {P1, R1, P2, VMD_line_width texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
    VMD_clip[2]
  }
  #else
  cone {P1, R1, P2, VMD_line_width texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
  #end
#end
#macro VMD_triangle (P1, P2, P3, N1, N2, N3, C1)
  #local T = texture { pigment { C1 } }
  smooth_triangle {P1, N1, P2, N2, P3, N3 texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
#end
#macro VMD_tricolor (P1, P2, P3, N1, N2, N3, C1, C2, C3)
  #local NX = P2-P1;
  #local NY = P3-P1;
  #local NZ = vcross(NX, NY);
  #local T = texture { pigment {
    average pigment_map {
      [1 gradient x color_map {[0 rgb 0] [1 C2*3]}]
      [1 gradient y color_map {[0 rgb 0] [1 C3*3]}]
      [1 gradient z color_map {[0 rgb 0] [1 C1*3]}]
    }
    matrix <1.01,0,1,0,1.01,1,0,0,1,-.002,-.002,-1>
    matrix <NX.x,NX.y,NX.z,NY.x,NY.y,NY.z,NZ.x,NZ.y,NZ.z,P1.x,P1.y,P1.z>
  } }
  smooth_triangle {P1, N1, P2, N2, P3, N3 texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
#end
camera {
  up <0, 6.0000, 0>
  right <6.6000, 0, 0>
  location <0.0000, 0.0000, -2.0000>
  look_at <0.0000, 0.0000, -0.0000>
  direction <-0.0000, -0.0000, 4.0000>
}
light_source { 
  <-0.1000, 0.1000, -1.0000> 
  color rgb<1.000, 1.000, 1.000> 
  parallel 
  point_at <0.0, 0.0, 0.0> 
}
light_source { 
  <1.0000, 2.0000, -0.5000> 
  color rgb<1.000, 1.000, 1.000> 
  parallel 
  point_at <0.0, 0.0, 0.0> 
}
background {
  color rgb<1.000, 1.000, 1.000>
}
#default { texture {
 finish { ambient 0.000 diffuse 0.650 phong 0.1 phong_size 40.000 specular 0.500 }
} }
#declare VMD_line_width=0.0020;
#default { texture {
 finish { ambient 0.000 diffuse 0.620 phong 0.1 phong_size 38.905 specular 0.000 }
} }
// MoleculeID: 0 ReprID: 0 Beginning VDW
VMD_sphere(<0.3190,0.0636,-0.1729>,0.6649,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.1245,0.2668,-0.0624>,0.6649,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.0648,-0.4816,-0.0966>,0.6649,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.3547,-0.2472,-0.2751>,0.6649,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.3574,-0.1133,0.1442>,0.6649,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.2145,-0.0549,0.2166>,0.6649,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.2375,0.2336,0.0044>,0.6649,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.0722,0.2759,0.0461>,0.6649,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.2807,0.0115,0.1258>,0.6649,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.1973,0.1910,-0.2365>,0.6649,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.1167,0.1572,0.1761>,0.6649,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.2958,-0.3025,0.1303>,0.6649,rgbt<1.000,1.000,1.000,0.000>)
// End of POV-Ray 3.x generation 
