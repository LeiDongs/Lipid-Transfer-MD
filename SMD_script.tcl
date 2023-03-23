#tclForcesScript {
  # The ID of the atoms
  set force_step 9
  set step 152710
  set aid1 104271
  set aid2 104394
  set point1 187943 
  set point2 187239
  set point3 186058
  set point4 186032
  set point5 191825
  set point6 191938
  set point7 190136
  set point8 192094
  set point9 191557
  set group10 [addgroup {19940 190341 190360 190377 190396 190407 190477 190529 190593 190737 190907 190924 190954 190970 190987 190998 191017 191241 191253 191264 191275 191291 191308 191324 191346 191547 191557 191578 191592 191612 191627 191642 191654 191673 191689 191938 191988 192008 192025 192108 192323 192342 192359 192370 192387 192406 192420 192430 192446 192453 192474 192486 192501 192517 192534 192545 192569}]
  set group11 [addgroup {190377 190396 190407 190426 190443 190450 190462 190477 190497 190519 190529 190545 190564 190579 190593 190617 190624 190644 190658 190686 190718 190737 190857 190897 190907 190924 190940 190954 191308 191324 191346 191366 191385 191557 191592 192303 192323 192359 192370 192387 192406 192420 192430 192446 192453 192474 192486 192501 192517 192534 192545}]
  set point12 {29.7942   28.6032  -96.4623}
  set point13 {115.7365   47.9909 -189.8678}
  set z_end {-3.5 -11.1099996567 -13.3599996567 -37.8600006104 -42.1100006104 -48.6100006104 -56.1100006104 -60.3600006104 -67.8600006104 -78.1100006104 0.5 0.5 0.5 -150}
  set point_end {10.186580061414183 23.825765076040376 -92.75389468338575}
  set forcedirection {1.0 1.0 1.0}
  set distance 1.0
  # The "spring constant" for the constant force
  set k 11.0
  addatom $aid1
  addatom $aid2
  addatom $point1
  addatom $point2
  addatom $point3
  addatom $point4
  addatom $point5
  addatom $point6
  addatom $point7
  addatom $point8
  addatom $point9
  proc calcforces {} {
    global force_step step aid1 aid2 point1 point2 point3 point4 point5 point6 point7 point8 point9 group10 group11 point12 point13 point_end k
    global z_end forcedirection distance
    loadcoords p
    if {$step%50==0} {
	puts "$step $p($aid1) $p($aid2)"
    }
    incr step
    if {([lindex $p($aid1) 2]<[lindex $z_end $force_step] && $force_step!=10 && $force_step!=11 && $force_step!=12) || ([getbond $point_end $p($aid1)]<[lindex $z_end $force_step] && ($force_step==10 || $force_step==11 || $force_step==12))} {
        puts "The $force_step move was finished at step $step"
        incr force_step
        if {$force_step==1} {
        set point_end $p($point1)
        }
        if {$force_step==2} {
        set point_end $p($point2)
        }
        if {$force_step==3} {
        set point_end $p($point3)
        }
        if {$force_step==4} {
        set point_end $p($point4)
        }
        if {$force_step==5} {
        set point_end $p($point5)
        }
        if {$force_step==6} {
        set point_end $p($point6)
        }
        if {$force_step==7} {
        set point_end $p($point7)
        }
        if {$force_step==8} {
        set point_end $p($point8)
        }
        if {$force_step==9} {
        set point_end $p($point9)
        }
        if {$force_step==10} {
        set point_end $p($group10)
        }
        if {$force_step==11} {
        set point_end $p($group11)
        }
        if {$force_step==12} {
        set point_end $point12
        }
        if {$force_step==13} {
        set point_end $point13
        }
        if {$force_step==14} {
        break
        }
        puts "The ce is moving to $point_end"
    }
    # Calculate the current distance
    set forcedirection [vecsub $point_end $p($aid1)]
    set distance [getbond $point_end $p($aid1)]
    addforce $aid1 [vecscale $forcedirection [expr $k/$distance]]
  }
#}
