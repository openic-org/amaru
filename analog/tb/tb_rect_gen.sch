v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 40 -530 40 -490 {lab=VSS}
N 640 -240 720 -240 {lab=VO1}
N 480 -240 500 -240 {lab=VSS}
N 540 -380 540 -300 {lab=VA}
N 390 -380 540 -380 {lab=VA}
N 390 -100 540 -100 {lab=VB}
N 1420 -240 1420 -220 {lab=VOUT}
N 860 -240 920 -240 {lab=VO2}
N 1060 -240 1120 -240 {lab=VO3}
N 1280 -240 1280 -220 {lab=VOUT}
N 1280 -160 1280 -120 {lab=VSS}
N 1280 -240 1420 -240 {lab=VOUT}
N 1200 -240 1280 -240 {lab=VOUT}
N 1160 -180 1160 -100 {lab=VB}
N 1160 -380 1160 -300 {lab=VA}
N 960 -100 1160 -100 {lab=VB}
N 960 -380 1160 -380 {lab=VA}
N 960 -180 960 -100 {lab=VB}
N 960 -380 960 -300 {lab=VA}
N 760 -100 960 -100 {lab=VB}
N 760 -380 960 -380 {lab=VA}
N 760 -180 760 -100 {lab=VB}
N 760 -380 760 -300 {lab=VA}
N 540 -100 760 -100 {lab=VB}
N 540 -380 760 -380 {lab=VA}
N 640 -260 640 -240 {lab=VO1}
N 860 -260 860 -240 {lab=VO2}
N 800 -240 860 -240 {lab=VO2}
N 1060 -260 1060 -240 {lab=VO3}
N 1000 -240 1060 -240 {lab=VO3}
N 540 -180 540 -100 {lab=VB}
N 1420 -60 1420 -20 {lab=VSS}
N 1420 -160 1420 -120 {lab=#net1}
N 200 -250 200 -220 {lab=#net2}
N 200 -380 200 -310 {lab=VA}
N 300 -380 300 -270 {lab=VA}
N 390 -210 390 -100 {lab=VB}
N 390 -380 390 -270 {lab=VA}
N 580 -240 640 -240 {lab=VO1}
N 200 -160 200 -100 {lab=VB}
N 200 -380 300 -380 {lab=VA}
N 300 -380 390 -380 {lab=VA}
N 300 -210 300 -100 {lab=VB}
N 200 -100 300 -100 {lab=VB}
N 300 -100 390 -100 {lab=VB}
N 0 -220 80 -220 {lab=#net3}
N 20 -160 80 -160 {lab=VSS}
N 20 -160 20 -120 {lab=VSS}
N 0 -160 20 -160 {lab=VSS}
N 480 -210 500 -210 {lab=VSS}
N 700 -210 720 -210 {lab=VSS}
N 900 -210 920 -210 {lab=VSS}
N 1100 -210 1120 -210 {lab=VSS}
C {vsource.sym} 0 -190 0 1 {name=V1 value="dc 0 sin(0 500m 433Meg)" savecurrent=false}
C {code_shown.sym} 130 -810 0 0 {name=NGSPICE only_toplevel=false value="
.param temp=27
.tran 0.2n 50u
.save VA VB VO1 VO2 VO3 VOUT I(V1) I(V3)
+ @n.x1.xm1.nsg13_lv_nmos[ids] @n.x1.xm2.nsg13_lv_nmos[ids]
+ @n.x1.xm3.nsg13_lv_pmos[ids] @n.x1.xm4.nsg13_lv_pmos[ids]
+ @n.x4.xm1.nsg13_lv_nmos[ids] @n.x4.xm2.nsg13_lv_nmos[ids]
+ @n.x4.xm3.nsg13_lv_pmos[ids] @n.x4.xm4.nsg13_lv_pmos[ids]

.control
  run
  let id1m1 = @n.x1.xm1.nsg13_lv_nmos[ids]
  let id1m2 = @n.x1.xm2.nsg13_lv_nmos[ids]
  let id1m3 = @n.x1.xm3.nsg13_lv_pmos[ids]
  let id1m4 = @n.x1.xm4.nsg13_lv_pmos[ids]
  let id4m1 = @n.x1.xm1.nsg13_lv_nmos[ids]
  let id4m2 = @n.x1.xm2.nsg13_lv_nmos[ids]
  let id4m3 = @n.x1.xm3.nsg13_lv_pmos[ids]
  let id4m4 = @n.x1.xm4.nsg13_lv_pmos[ids]
  set filetype=ascii
  write tb_rect_g1.raw v(VA) v(VB) v(VO1) v(VO2) v(VO3) v(VOUT) I(V1) I(V3) id1m1 id1m2 id1m3 id1m4 id4m1 id4m2 id4m3 id4m4
.endc
"}
C {vsource.sym} 40 -460 0 0 {name=V2 value=0 savecurrent=false}
C {gnd.sym} 40 -430 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 40 -510 0 1 {name=p2 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 1420 -240 0 1 {name=p8 sig_type=std_logic lab=VOUT}
C {code_shown.sym} 910 -770 0 0 {name=MODEL only_toplevel=false value="
.lib cornerMOSlv.lib mos_tt
"}
C {lab_pin.sym} 480 -240 0 0 {name=p9 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 540 -360 0 1 {name=p1 sig_type=std_logic lab=VA}
C {lab_pin.sym} 540 -120 0 1 {name=p3 sig_type=std_logic lab=VB}
C {rect_01_gen.sym} 540 -240 0 0 {name=x1
Ls=47e-9
Rs=0.471
f_sr=1870e6
q_coil=289
f_op=433e6
Vrect=1.6
Vrfpeak=0.5
Isys=80e-6
schematic="rect_unit.py(@Ls\\,@Rs\\,@f_sr\\,@q_coil\\,@f_op\\,@Vrect\\,@Vrfpeak\\,@Isys\\)"
tclcommand="edit_file [abs_sym_path rect_unit.py]"}
C {capa.sym} 1280 -190 0 0 {name=C6
m=1
value=0.1n
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 1280 -140 0 1 {name=p12 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 640 -260 0 1 {name=p13 sig_type=std_logic lab=VO1}
C {lab_pin.sym} 860 -260 0 1 {name=p14 sig_type=std_logic lab=VO2}
C {lab_pin.sym} 1060 -260 0 1 {name=p15 sig_type=std_logic lab=VO3}
C {res.sym} 1420 -90 0 0 {name=R1
value=20k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 1420 -40 0 1 {name=p4 sig_type=std_logic lab=VSS}
C {vsource.sym} 1420 -190 0 0 {name=V3 value=0 savecurrent=false}
C {ind.sym} 200 -190 0 0 {name=L1
m=1
value=47n
footprint=1206
device=inductor}
C {res.sym} 200 -280 0 0 {name=R2
value=0.471
footprint=1206
device=resistor
m=1}
C {capa.sym} 300 -240 0 0 {name=C4
m=1
value=0.15412p
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 390 -240 0 0 {name=C5
m=1
value=2.72p
footprint=1206
device="ceramic capacitor"}
C {ind.sym} 80 -190 0 1 {name=L3
m=1
value=47n
footprint=1206
device=inductor}
C {lab_pin.sym} 20 -140 0 1 {name=p10 sig_type=std_logic lab=VSS}
C {k.sym} 140 -190 0 0 {name=K1 K=1 L1=L3 L2=L1}
C {lab_pin.sym} 480 -210 0 0 {name=p5 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 700 -210 0 0 {name=p6 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 900 -210 0 0 {name=p7 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 1100 -210 0 0 {name=p11 sig_type=std_logic lab=VSS}
C {rect_01_gen.sym} 760 -240 0 0 {name=x2
Ls=47e-9
Rs=0.471
f_sr=1870e6
q_coil=289
f_op=433e6
Vrect=1.6
Vrfpeak=0.5
Isys=80e-6
schematic="rect_unit.py(@Ls\\,@Rs\\,@f_sr\\,@q_coil\\,@f_op\\,@Vrect\\,@Vrfpeak\\,@Isys\\)"
tclcommand="edit_file [abs_sym_path rect_unit.py]"}
C {rect_01_gen.sym} 960 -240 0 0 {name=x3
Ls=47e-9
Rs=0.471
f_sr=1870e6
q_coil=289
f_op=433e6
Vrect=1.6
Vrfpeak=0.5
Isys=80e-6
schematic="rect_unit.py(@Ls\\,@Rs\\,@f_sr\\,@q_coil\\,@f_op\\,@Vrect\\,@Vrfpeak\\,@Isys\\)"
tclcommand="edit_file [abs_sym_path rect_unit.py]"}
C {rect_01_gen.sym} 1160 -240 0 0 {name=x4
Ls=47e-9
Rs=0.471
f_sr=1870e6
q_coil=289
f_op=433e6
Vrect=1.6
Vrfpeak=0.5
Isys=80e-6
schematic="rect_unit.py(@Ls\\,@Rs\\,@f_sr\\,@q_coil\\,@f_op\\,@Vrect\\,@Vrfpeak\\,@Isys\\)"
tclcommand="edit_file [abs_sym_path rect_unit.py]"}
