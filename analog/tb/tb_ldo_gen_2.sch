v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 560 -320 560 -280 {lab=VDD}
N 640 -320 640 -280 {lab=VSS}
N 560 -520 560 -480 {lab=VREF}
N 560 -420 560 -380 {lab=VSS}
N 940 -400 940 -360 {lab=VSS}
N 940 -500 940 -460 {lab=VLDO}
N 700 -500 720 -500 {lab=VREF}
N 860 -500 940 -500 {lab=VLDO}
N 800 -440 800 -420 {lab=#net1}
N 780 -440 780 -420 {lab=#net1}
N 700 -530 720 -530 {lab=VDD}
N 700 -470 720 -470 {lab=VSS}
N 780 -420 800 -420 {lab=#net1}
C {vsource.sym} 560 -250 0 0 {name=V1 value="dc 1.2 ac 1" savecurrent=false}
C {gnd.sym} 560 -220 0 0 {name=l1 lab=GND}
C {vsource.sym} 640 -250 0 0 {name=V2 value=0 savecurrent=false}
C {gnd.sym} 640 -220 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 560 -300 0 1 {name=p1 sig_type=std_logic lab=VDD}
C {vsource.sym} 560 -450 0 0 {name=V3 value=0.6 savecurrent=false}
C {lab_pin.sym} 640 -300 0 1 {name=p5 sig_type=std_logic lab=VSS}
C {code_shown.sym} 1120 -550 0 0 {name=NGSPICE only_toplevel=false value="
.param temp=27
.options savecurrents
.op
.save all
+ @n.x1.xm1.nsg13_lv_pmos[ids]
+ @n.x1.xm1.nsg13_lv_pmos[gm]
+ @n.x1.xm1.nsg13_lv_pmos[gds]

.control
  ac dec 160 10 1g
  set filetype=ascii
  set units=degress
  let PSRR = 1/VLDO
  write tb_ldo_g2.raw vdb(PSRR) vp(PSRR)
  set appendwrite
.endc
"}
C {code_shown.sym} 1130 -660 0 0 {name=MODEL only_toplevel=false value="
.lib cornerMOSlv.lib mos_tt
"}
C {launcher.sym} 850 -630 0 0 {name=h1
descr=Backannotate-OP
tclcommand="xschem annotate_op"}
C {lab_pin.sym} 560 -500 0 1 {name=p2 sig_type=std_logic lab=VREF}
C {lab_pin.sym} 560 -400 0 1 {name=p3 sig_type=std_logic lab=VSS}
C {ngspice_probe.sym} 790 -420 0 0 {name=r5}
C {ngspice_get_value.sym} 770 -560 0 0 {name=r10 node=i(@n.x1.xm1.nsg13_lv_pmos[ids])
descr="i(x1.m1[id])"}
C {ngspice_get_value.sym} 750 -560 0 1 {name=r11 node=@n.x1.xm1.nsg13_lv_pmos[gm]
descr="x1.m1[gm]"}
C {ngspice_get_value.sym} 840 -560 0 0 {name=r12 node=@n.x1.xm1.nsg13_lv_pmos[gds]
descr="x1.m1[gds]"}
C {res.sym} 940 -430 0 0 {name=R3
value=183.33k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 940 -380 0 1 {name=p9 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 700 -500 0 0 {name=p11 sig_type=std_logic lab=VREF}
C {lab_pin.sym} 700 -530 0 0 {name=p8 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 940 -500 0 1 {name=p12 sig_type=std_logic lab=VLDO}
C {ldo_01_gen.sym} 780 -500 0 0 {name=x1
Iload=6e-6
Vldo=1.1
Vrect=1.2
Vref=0.6
schematic="ldo01.py(@Iload\\,@Vldo\\,@Vrect\\,@Vref\\)"
tclcommand="edit_file [abs_sym_path ldo01.py]"}
C {lab_pin.sym} 700 -470 0 0 {name=p4 sig_type=std_logic lab=VSS}
