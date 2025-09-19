v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 560 -280 560 -240 {lab=VDD}
N 640 -280 640 -240 {lab=VSS}
N 560 -480 560 -440 {lab=VREF}
N 980 -360 980 -320 {lab=VSS}
N 980 -460 980 -420 {lab=VLDO}
N 740 -460 760 -460 {lab=VREF}
N 560 -380 560 -340 {lab=VSS}
N 900 -460 980 -460 {lab=VLDO}
N 840 -400 840 -380 {lab=#net1}
N 840 -380 940 -380 {lab=#net1}
N 940 -380 940 -340 {lab=#net1}
N 920 -340 940 -340 {lab=#net1}
N 700 -340 720 -340 {lab=#net2}
N 700 -380 700 -340 {lab=#net2}
N 700 -380 820 -380 {lab=#net2}
N 820 -400 820 -380 {lab=#net2}
N 740 -490 760 -490 {lab=VDD}
N 740 -430 760 -430 {lab=VSS}
C {vsource.sym} 560 -210 0 0 {name=V1 value=1.6 savecurrent=false}
C {gnd.sym} 560 -180 0 0 {name=l1 lab=GND}
C {vsource.sym} 640 -210 0 0 {name=V2 value=0 savecurrent=false}
C {gnd.sym} 640 -180 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 560 -260 0 1 {name=p1 sig_type=std_logic lab=VDD}
C {vsource.sym} 560 -410 0 0 {name=V3 value=0.6 savecurrent=false}
C {lab_pin.sym} 640 -260 0 1 {name=p5 sig_type=std_logic lab=VSS}
C {ngspice_probe.sym} 720 -380 0 0 {name=r5}
C {code_shown.sym} 1120 -550 0 0 {name=NGSPICE only_toplevel=false value="
.param temp=27
.options savecurrents
.ac dec 80 1 10g
.save all v(X999.x) i(v.X999.Vi)
+ @n.x1.xm1.nsg13_lv_pmos[ids]
+ @n.x1.xm1.nsg13_lv_pmos[gm]
+ @n.x1.xm1.nsg13_lv_pmos[gds]

.control
  run
  alter i.X999.Ii acmag=1
  alter v.X999.Vi acmag=0
  run

  let A=ac2.i(v.X999.Vi)
  let B=ac1.i(v.X999.Vi)
  let C=ac2.v(X999.x)
  let D=ac1.v(X999.x)
  let Ttian=(2*(B*C-A*D)+D+A)/(2*(B*C-A*D)+A+D-1)

  set filetype=ascii
  write tb_ldo_g1_stb.raw db(Ttian) 180*cph(Ttian)/pi

  set appendwrite
  op
  set filetype=ascii
  write tb_ldo_gen_stb1.raw
.endc
"}
C {code_shown.sym} 1130 -660 0 0 {name=MODEL only_toplevel=false value="
.lib cornerMOSlv.lib mos_tt
"}
C {launcher.sym} 850 -630 0 0 {name=h1
descr=Backannotate-OP
tclcommand="xschem annotate_op"}
C {ngspice_get_value.sym} 810 -520 0 0 {name=r10 node=i(@n.x1.xm1.nsg13_lv_pmos[ids])
descr="i(x1.m1[id])"}
C {ngspice_get_value.sym} 790 -520 0 1 {name=r11 node=@n.x1.xm1.nsg13_lv_pmos[gm]
descr="x1.m1[gm]"}
C {ngspice_get_value.sym} 880 -520 0 0 {name=r12 node=@n.x1.xm1.nsg13_lv_pmos[gds]
descr="x1.m1[gds]"}
C {res.sym} 980 -390 0 0 {name=R3
value=26.16k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 980 -340 0 1 {name=p9 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 740 -460 0 0 {name=p11 sig_type=std_logic lab=VREF}
C {lab_pin.sym} 740 -490 0 0 {name=p8 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 980 -460 0 1 {name=p12 sig_type=std_logic lab=VLDO}
C {lab_pin.sym} 560 -460 0 1 {name=p2 sig_type=std_logic lab=VREF}
C {lab_pin.sym} 560 -360 0 1 {name=p3 sig_type=std_logic lab=VSS}
C {loopgainprobe.sym} 820 -340 0 0 {name=X999}
C {lab_pin.sym} 740 -430 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {ldo_01_gen.sym} 820 -460 0 0 {name=x1
Iload=60e-6
Vldo=1.5
Vrect=1.6
Vref=0.6
schematic="ldo01.py(@Iload\\,@Vldo\\,@Vrect\\,@Vref\\)"
tclcommand="edit_file [abs_sym_path ldo01.py]"}
