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
N 220 -510 240 -510 {lab=#net2}
N 140 -560 140 -520 {lab=VIP}
N 280 -560 280 -520 {lab=VIM}
N 140 -420 140 -380 {lab=#net1}
N 220 -510 220 -380 {lab=#net2}
N 180 -510 220 -510 {lab=#net2}
N 1020 -420 1020 -380 {lab=VO}
N 1020 -320 1020 -280 {lab=VSS}
N 560 -380 580 -380 {lab=VIP}
N 860 -380 880 -380 {lab=VIM}
N 620 -350 620 -320 {lab=#net3}
N 820 -350 820 -320 {lab=#net3}
N 720 -320 820 -320 {lab=#net3}
N 620 -460 620 -410 {lab=#net4}
N 820 -560 820 -510 {lab=VDD}
N 620 -560 620 -510 {lab=VDD}
N 620 -560 820 -560 {lab=VDD}
N 680 -510 780 -510 {lab=#net4}
N 620 -460 680 -460 {lab=#net4}
N 620 -480 620 -460 {lab=#net4}
N 680 -510 680 -460 {lab=#net4}
N 660 -510 680 -510 {lab=#net4}
N 820 -440 820 -410 {lab=VO}
N 720 -320 720 -280 {lab=#net3}
N 620 -320 720 -320 {lab=#net3}
N 720 -250 720 -200 {lab=VSS}
N 460 -250 460 -200 {lab=VSS}
N 520 -250 680 -250 {lab=#net5}
N 460 -300 460 -280 {lab=#net5}
N 460 -560 460 -480 {lab=VDD}
N 460 -560 620 -560 {lab=VDD}
N 460 -300 520 -300 {lab=#net5}
N 460 -420 460 -300 {lab=#net5}
N 520 -300 520 -250 {lab=#net5}
N 500 -250 520 -250 {lab=#net5}
N 620 -380 820 -380 {lab=VSS}
N 460 -200 720 -200 {lab=VSS}
N 860 -440 880 -440 {lab=VO}
N 820 -480 820 -440 {lab=VO}
N 860 -440 860 -420 {lab=VO}
N 820 -440 860 -440 {lab=VO}
N 860 -420 1020 -420 {lab=VO}
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
l=0.5u
w=10u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 840 -380 0 1 {name=M2
l=0.5u
w=10u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 640 -510 0 1 {name=M3
l=1u
w=2u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 800 -510 0 0 {name=M4
l=1u
w=2u
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
C {ngspice_get_value.sym} 630 -410 0 0 {name=r1 node=i(@n.xm1.ngs13_lv_nmos[ids])
descr="i(m1[id])"}
C {ngspice_probe.sym} 460 -340 0 0 {name=r2}
C {ngspice_probe.sym} 740 -320 0 0 {name=r3}
C {ngspice_probe.sym} 700 -510 0 0 {name=r4}
C {ngspice_probe.sym} 970 -420 0 0 {name=r5}
C {ngspice_get_value.sym} 610 -410 0 1 {name=r6 node=i(@n.xm1.ngs13_lv_nmos[gm])
descr="i(m1[gm])"}
C {code_shown.sym} 1120 -550 0 0 {name=NGSPICE only_toplevel=false value="
.param temp=27
.save all
+ @n.xm1.nsg13_lv_nmos[ids] @n.xm2.nsg13_lv_nmos[ids]
+ @n.xm3.nsg13_lv_pmos[ids] @n.xm4.nsg13_lv_pmos[ids]
+ @n.xm5.nsg13_lv_nmos[ids] @n.xm6.nsg13_lv_nmos[ids]
+ @n.xm1.nsg13_lv_nmos[gm] @n.xm2.nsg13_lv_nmos[gm]
+ @n.xm3.nsg13_lv_pmos[gm] @n.xm4.nsg13_lv_pmos[gm]

.control
  op
  set filetype=ascii
  write tb_opamp_01.raw
.endc
"}
C {code_shown.sym} 1130 -660 0 0 {name=MODEL only_toplevel=false value="
.lib cornerMOSlv.lib mos_tt
"}
C {launcher.sym} 1020 -200 0 0 {name=h1
descr=Backannotate-OP
tclcommand="xschem annotate_op"}
