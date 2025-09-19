v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 300 -360 300 -320 {lab=VDD}
N 380 -360 380 -320 {lab=VSS}
N 300 -560 300 -520 {lab=VREF}
N 900 -460 900 -420 {lab=VLDO}
N 900 -360 900 -320 {lab=VSS}
N 620 -470 620 -430 {lab=VSS}
N 620 -590 620 -550 {lab=VDD}
N 980 -360 980 -320 {lab=VSS}
N 980 -460 980 -420 {lab=VLDO}
N 900 -460 980 -460 {lab=VLDO}
N 800 -460 800 -440 {lab=VLDO}
N 800 -460 900 -460 {lab=VLDO}
N 800 -480 800 -460 {lab=VLDO}
N 800 -360 800 -340 {lab=#net1}
N 800 -280 800 -240 {lab=VSS}
N 540 -490 560 -490 {lab=VREF}
N 460 -530 460 -360 {lab=#net1}
N 460 -530 560 -530 {lab=#net1}
N 800 -590 800 -510 {lab=VDD}
N 620 -590 800 -590 {lab=VDD}
N 300 -460 300 -420 {lab=VSS}
N 680 -510 760 -510 {lab=#net2}
N 460 -360 800 -360 {lab=#net1}
N 800 -380 800 -360 {lab=#net1}
C {capa.sym} 900 -390 0 0 {name=C1
m=1
value=253.58n
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} 300 -290 0 0 {name=V1 value="dc 1.3 ac 1" savecurrent=false}
C {gnd.sym} 300 -260 0 0 {name=l1 lab=GND}
C {vsource.sym} 380 -290 0 0 {name=V2 value=0 savecurrent=false}
C {gnd.sym} 380 -260 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 300 -340 0 1 {name=p1 sig_type=std_logic lab=VDD}
C {vsource.sym} 300 -490 0 0 {name=V3 value=0.6 savecurrent=false}
C {lab_pin.sym} 380 -340 0 1 {name=p5 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 900 -340 0 1 {name=p6 sig_type=std_logic lab=VSS}
C {ngspice_probe.sym} 720 -510 0 0 {name=r5}
C {code_shown.sym} 1120 -550 0 0 {name=NGSPICE only_toplevel=false value="
.param temp=27
.options savecurrents
.op
.save all
+ @n.xm1.nsg13_lv_pmos[ids]
+ @n.xm1.nsg13_lv_pmos[gm]
+ @n.xm1.nsg13_lv_pmos[gds]

.control
  ac dec 160 10 1g
  set filetype=ascii
  set units=degress
  let PSRR = 1/VLDO
  write tb_ldo_02.raw vdb(PSRR) vp(PSRR)
  set appendwrite
.endc
"}
C {code_shown.sym} 1130 -660 0 0 {name=MODEL only_toplevel=false value="
.lib cornerMOSlv.lib mos_tt
"}
C {launcher.sym} 850 -630 0 0 {name=h1
descr=Backannotate-OP
tclcommand="xschem annotate_op"}
C {ngspice_get_value.sym} 810 -550 0 0 {name=r10 node=i(@n.xm1.nsg13_lv_pmos[ids])
descr="i(m1[id])"}
C {ngspice_get_value.sym} 790 -550 0 1 {name=r11 node=@n.xm1.nsg13_lv_pmos[gm]
descr="m1[gm]"}
C {ngspice_get_value.sym} 870 -550 0 0 {name=r12 node=@n.xm1.nsg13_lv_pmos[gds]
descr="m1[gds]"}
C {opamp_01.sym} 620 -510 0 0 {name=x1}
C {sg13g2_pr/sg13_lv_pmos.sym} 780 -510 0 0 {name=M1
l=0.5u
w=91.33u
ng=10
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 620 -450 0 1 {name=p7 sig_type=std_logic lab=VSS}
C {res.sym} 800 -310 0 0 {name=R2
value=500k
footprint=1206
device=resistor
m=1}
C {res.sym} 800 -410 0 0 {name=R1
value=500k
footprint=1206
device=resistor
m=1}
C {res.sym} 980 -390 0 0 {name=R3
value=240k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 980 -340 0 1 {name=p9 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 800 -260 0 1 {name=p10 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 540 -490 0 0 {name=p11 sig_type=std_logic lab=VREF}
C {lab_pin.sym} 620 -590 0 0 {name=p8 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 980 -460 0 1 {name=p12 sig_type=std_logic lab=VLDO}
C {lab_pin.sym} 300 -540 0 1 {name=p2 sig_type=std_logic lab=VREF}
C {ngspice_probe.sym} 700 -360 0 0 {name=r4}
C {lab_pin.sym} 300 -440 0 1 {name=p3 sig_type=std_logic lab=VSS}
