v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 60 -220 60 -180 {lab=VSS}
N 640 -240 660 -240 {lab=VO1}
N 660 -240 660 -220 {lab=VO1}
N 660 -160 660 -120 {lab=VSS}
N 360 -240 420 -240 {lab=VSS}
N 460 -380 460 -300 {lab=VA}
N 200 -380 460 -380 {lab=VA}
N 200 -380 200 -300 {lab=VA}
N 200 -100 460 -100 {lab=VB}
N 200 -240 200 -100 {lab=VB}
N 1420 -240 1420 -220 {lab=VOUT}
N 880 -240 880 -220 {lab=VO2}
N 880 -160 880 -120 {lab=VSS}
N 880 -240 920 -240 {lab=VO2}
N 860 -240 880 -240 {lab=VO2}
N 1080 -240 1080 -220 {lab=VO3}
N 1080 -160 1080 -120 {lab=VSS}
N 1080 -240 1120 -240 {lab=VO3}
N 1060 -240 1080 -240 {lab=VO3}
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
N 460 -100 760 -100 {lab=VB}
N 460 -380 760 -380 {lab=VA}
N 660 -240 720 -240 {lab=VO1}
N 640 -260 640 -240 {lab=VO1}
N 860 -260 860 -240 {lab=VO2}
N 800 -240 860 -240 {lab=VO2}
N 1060 -260 1060 -240 {lab=VO3}
N 1000 -240 1060 -240 {lab=VO3}
N 500 -240 640 -240 {lab=VO1}
N 460 -180 460 -100 {lab=VB}
N 1420 -60 1420 -20 {lab=VSS}
N 1420 -160 1420 -120 {lab=#net1}
C {vsource.sym} 200 -270 0 1 {name=V1 value="dc 0 sin(0 500m 433Meg)" savecurrent=false}
C {capa.sym} 660 -190 0 0 {name=C1
m=1
value=100f
footprint=1206
device="ceramic capacitor"}
C {code_shown.sym} 130 -810 0 0 {name=NGSPICE only_toplevel=false value="
.param temp=27
.tran 0.1n 50u
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
  write tb_rect_01.raw v(VA) v(VB) v(VO1) v(VO2) v(VO3) v(VOUT) I(V1) I(V3) id1m1 id1m2 id1m3 id1m4 id4m1 id4m2 id4m3 id4m4
.endc
"}
C {vsource.sym} 60 -150 0 0 {name=V2 value=0 savecurrent=false}
C {gnd.sym} 60 -120 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 60 -200 0 1 {name=p2 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 660 -140 0 1 {name=p5 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 1420 -240 0 1 {name=p8 sig_type=std_logic lab=VOUT}
C {code_shown.sym} 910 -770 0 0 {name=MODEL only_toplevel=false value="
.lib cornerMOSlv.lib mos_tt
"}
C {lab_pin.sym} 360 -240 0 0 {name=p9 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 460 -360 0 1 {name=p1 sig_type=std_logic lab=VA}
C {lab_pin.sym} 460 -120 0 1 {name=p3 sig_type=std_logic lab=VB}
C {rect_01_10k.sym} 460 -240 0 0 {name=x1}
C {capa.sym} 880 -190 0 0 {name=C2
m=1
value=100f
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 880 -140 0 1 {name=p6 sig_type=std_logic lab=VSS}
C {rect_01_10k.sym} 760 -240 0 0 {name=x2}
C {capa.sym} 1080 -190 0 0 {name=C3
m=1
value=100f
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 1080 -140 0 1 {name=p7 sig_type=std_logic lab=VSS}
C {rect_01_10k.sym} 960 -240 0 0 {name=x3}
C {rect_01_10k.sym} 1160 -240 0 0 {name=x4}
C {capa.sym} 1280 -190 0 0 {name=C6
m=1
value=100f
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
