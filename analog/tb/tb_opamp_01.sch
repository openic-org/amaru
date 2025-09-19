v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 140 -220 140 -180 {lab=VDD}
N 220 -220 220 -180 {lab=VSS}
N 140 -420 280 -420 {lab=#net1}
N 140 -460 140 -420 {lab=#net1}
N 280 -460 280 -420 {lab=#net1}
N 180 -470 240 -470 {lab=VSS}
N 220 -510 240 -510 {lab=VINPUT}
N 140 -560 140 -520 {lab=VIP}
N 280 -560 280 -520 {lab=VIM}
N 140 -420 140 -380 {lab=#net1}
N 220 -510 220 -380 {lab=VINPUT}
N 180 -510 220 -510 {lab=VINPUT}
N 1020 -420 1020 -380 {lab=VO}
N 1020 -320 1020 -280 {lab=VSS}
N 560 -380 580 -380 {lab=VIP}
N 860 -380 880 -380 {lab=VIM}
N 620 -350 620 -320 {lab=#net2}
N 820 -350 820 -320 {lab=#net2}
N 720 -320 820 -320 {lab=#net2}
N 620 -460 620 -410 {lab=#net3}
N 820 -560 820 -510 {lab=VDD}
N 620 -560 620 -510 {lab=VDD}
N 620 -560 820 -560 {lab=VDD}
N 680 -510 780 -510 {lab=#net3}
N 620 -460 680 -460 {lab=#net3}
N 620 -480 620 -460 {lab=#net3}
N 680 -510 680 -460 {lab=#net3}
N 660 -510 680 -510 {lab=#net3}
N 820 -440 820 -410 {lab=VO}
N 720 -320 720 -280 {lab=#net2}
N 620 -320 720 -320 {lab=#net2}
N 720 -250 720 -200 {lab=VSS}
N 460 -250 460 -200 {lab=VSS}
N 520 -250 680 -250 {lab=#net4}
N 460 -300 460 -280 {lab=#net4}
N 460 -560 460 -480 {lab=VDD}
N 460 -560 620 -560 {lab=VDD}
N 460 -300 520 -300 {lab=#net4}
N 460 -420 460 -300 {lab=#net4}
N 520 -300 520 -250 {lab=#net4}
N 500 -250 520 -250 {lab=#net4}
N 620 -380 820 -380 {lab=VSS}
N 460 -200 720 -200 {lab=VSS}
N 860 -440 880 -440 {lab=VO}
N 820 -480 820 -440 {lab=VO}
N 860 -440 860 -420 {lab=VO}
N 820 -440 860 -440 {lab=VO}
N 860 -420 1020 -420 {lab=VO}
N 500 -50 540 -50 {lab=VSS}
N 500 -90 540 -90 {lab=VINPUT}
N 460 -40 460 0 {lab=VSS}
N 740 -40 740 0 {lab=VSS}
N 740 -120 740 -100 {lab=VO2}
N 640 -120 740 -120 {lab=VO2}
N 460 -120 460 -100 {lab=VO2}
N 820 -40 820 0 {lab=VSS}
N 740 -100 820 -100 {lab=VO2}
N 640 -120 640 -100 {lab=VO2}
N 460 -120 640 -120 {lab=VO2}
N 640 -40 640 0 {lab=VSS}
N 820 320 820 360 {lab=VSS}
N 760 230 820 230 {lab=VO3}
N 820 230 820 260 {lab=VO3}
N 640 300 640 340 {lab=VSS}
N 640 120 640 160 {lab=VDD}
N 480 280 520 280 {lab=VIP2}
N 480 180 520 180 {lab=VIM2}
N 140 200 280 200 {lab=#net5}
N 140 160 140 200 {lab=#net5}
N 280 160 280 200 {lab=#net5}
N 180 150 240 150 {lab=VSS}
N 140 60 140 100 {lab=VIP2}
N 280 60 280 100 {lab=VIM2}
N 140 200 140 240 {lab=#net5}
N 180 110 240 110 {lab=VINPUT}
C {capa.sym} 1020 -350 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} 140 -150 0 0 {name=V1 value=1.5 savecurrent=false}
C {vcvs.sym} 140 -490 0 1 {name=E1 value=0.5}
C {gnd.sym} 140 -120 0 0 {name=l1 lab=GND}
C {vsource.sym} 220 -150 0 0 {name=V2 value=0 savecurrent=false}
C {gnd.sym} 220 -120 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 200 -470 1 1 {name=p2 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 140 -200 0 1 {name=p1 sig_type=std_logic lab=VDD}
C {vcvs.sym} 280 -490 0 0 {name=E2 value=-0.5}
C {lab_pin.sym} 140 -540 0 1 {name=p3 sig_type=std_logic lab=VIP}
C {lab_pin.sym} 280 -540 0 1 {name=p4 sig_type=std_logic lab=VIM}
C {vsource.sym} 140 -350 0 0 {name=V3 value=0.6 savecurrent=false}
C {gnd.sym} 140 -320 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 220 -200 0 1 {name=p5 sig_type=std_logic lab=VSS}
C {vsource.sym} 220 -350 0 0 {name=V4 value="dc 0 ac 1" savecurrent=false}
C {gnd.sym} 220 -320 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 1020 -300 0 1 {name=p6 sig_type=std_logic lab=VSS}
C {sg13g2_pr/sg13_lv_nmos.sym} 600 -380 0 0 {name=M1
l=0.25u
w=10u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 840 -380 0 1 {name=M2
l=0.25u
w=10u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 640 -510 0 1 {name=M3
l=4u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 800 -510 0 0 {name=M4
l=4u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 700 -250 0 0 {name=M5
l=2u
w=2u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 480 -250 0 1 {name=M6
l=2u
w=2u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {isource.sym} 460 -450 0 0 {name=I0 value=100n}
C {iopin.sym} 880 -380 0 0 {name=p7 lab=VIM}
C {iopin.sym} 560 -380 0 1 {name=p8 lab=VIP}
C {iopin.sym} 460 -200 0 1 {name=p9 lab=VSS}
C {iopin.sym} 460 -560 0 1 {name=p10 lab=VDD}
C {iopin.sym} 880 -440 0 0 {name=p11 lab=VO}
C {lab_pin.sym} 720 -380 3 1 {name=p12 sig_type=std_logic lab=VSS}
C {ngspice_get_value.sym} 630 -410 0 0 {name=r1 node=i(@n.xm1.nsg13_lv_nmos[ids])
descr="i(m1[id])"}
C {ngspice_probe.sym} 460 -340 0 0 {name=r2}
C {ngspice_probe.sym} 740 -320 0 0 {name=r3}
C {ngspice_probe.sym} 700 -510 0 0 {name=r4}
C {ngspice_probe.sym} 970 -420 0 0 {name=r5}
C {ngspice_get_value.sym} 610 -410 0 1 {name=r6 node=@n.xm1.nsg13_lv_nmos[gm]
descr="m1[gm]"}
C {code_shown.sym} 1120 -550 0 0 {name=NGSPICE only_toplevel=false value="
.param temp=27
.save all
+ @n.xm1.nsg13_lv_nmos[ids] @n.xm2.nsg13_lv_nmos[ids]
+ @n.xm3.nsg13_lv_pmos[ids] @n.xm4.nsg13_lv_pmos[ids]
+ @n.xm5.nsg13_lv_nmos[ids] @n.xm6.nsg13_lv_nmos[ids]
+ @n.xm1.nsg13_lv_nmos[gm] @n.xm2.nsg13_lv_nmos[gm]
+ @n.xm3.nsg13_lv_pmos[gm] @n.xm4.nsg13_lv_pmos[gm]
+ @n.xm1.nsg13_lv_nmos[gds] @n.xm2.nsg13_lv_nmos[gds]
+ @n.xm3.nsg13_lv_pmos[gds] @n.xm4.nsg13_lv_pmos[gds]

.control
  ac dec 160 10 1g
  set filetype=ascii
  set units=degress
  write tb_opamp_02.raw vdb(vo) vp(vo) vdb(vo2) vp(vo2) vdb(vo3) vp(vo3)
  set appendwrite
  op
  set filetype=ascii
  write tb_opamp_02.raw
.endc
"}
C {code_shown.sym} 1130 -660 0 0 {name=MODEL only_toplevel=false value="
.lib cornerMOSlv.lib mos_tt
"}
C {launcher.sym} 850 -630 0 0 {name=h1
descr=Backannotate-OP
tclcommand="xschem annotate_op"}
C {ngspice_get_value.sym} 730 -280 0 0 {name=r7 node=i(@n.xm5.nsg13_lv_nmos[ids])
descr="i(m5[id])"}
C {ngspice_get_value.sym} 810 -410 0 1 {name=r8 node=@n.xm2.nsg13_lv_nmos[gds]
descr="m2[gds]"}
C {ngspice_get_value.sym} 810 -460 0 1 {name=r9 node=@n.xm4.nsg13_lv_pmos[gds]
descr="m4[gds]"}
C {lab_pin.sym} 460 -20 0 1 {name=p13 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 540 -50 0 1 {name=p14 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 200 -510 1 0 {name=p15 sig_type=std_logic lab=VINPUT}
C {lab_pin.sym} 540 -90 2 0 {name=p16 sig_type=std_logic lab=VINPUT}
C {res.sym} 640 -70 0 0 {name=R10
value=14Meg
footprint=1206
device=resistor
m=1}
C {capa.sym} 740 -70 0 0 {name=C2
m=1
value=50f
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 740 -20 0 1 {name=p17 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 740 -120 0 1 {name=p18 sig_type=std_logic lab=VO2}
C {capa.sym} 820 -70 0 0 {name=C3
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 820 -20 0 1 {name=p19 sig_type=std_logic lab=VSS}
C {vccs.sym} 460 -70 0 1 {name=G1 value=-2e-6}
C {lab_pin.sym} 640 -20 0 1 {name=p20 sig_type=std_logic lab=VSS}
C {error_amp.sym} 640 230 0 0 {name=x1}
C {capa.sym} 820 290 0 0 {name=C4
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 820 340 0 1 {name=p21 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 820 230 0 1 {name=p22 sig_type=std_logic lab=VO3}
C {lab_pin.sym} 640 320 0 1 {name=p23 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 640 140 0 1 {name=p24 sig_type=std_logic lab=VDD}
C {vcvs.sym} 140 130 0 1 {name=E3 value=0.5}
C {lab_pin.sym} 200 150 1 1 {name=p25 sig_type=std_logic lab=VSS}
C {vcvs.sym} 280 130 0 0 {name=E4 value=-0.5}
C {lab_pin.sym} 140 80 0 1 {name=p26 sig_type=std_logic lab=VIP2}
C {lab_pin.sym} 280 80 0 1 {name=p27 sig_type=std_logic lab=VIM2}
C {vsource.sym} 140 270 0 0 {name=V5 value=0.6 savecurrent=false}
C {gnd.sym} 140 300 0 0 {name=l5 lab=GND}
C {lab_pin.sym} 200 110 1 0 {name=p28 sig_type=std_logic lab=VINPUT}
C {lab_pin.sym} 480 280 0 0 {name=p29 sig_type=std_logic lab=VIP2}
C {lab_pin.sym} 480 180 0 0 {name=p30 sig_type=std_logic lab=VIM2}
