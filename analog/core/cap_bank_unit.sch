v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 0 0 180 -0 {lab=VSS}
N 0 80 100 80 {lab=#net1}
N 0 30 0 80 {lab=#net1}
N 0 -80 100 -80 {lab=#net2}
N -80 0 -40 0 {lab=B}
N 0 80 -0 100 {lab=#net1}
N 130 -80 180 -80 {lab=VSS}
N 180 -0 180 80 {lab=VSS}
N 130 80 180 80 {lab=VSS}
N 130 -140 130 -120 {lab=B}
N 130 120 130 140 {lab=B}
N 0 -80 0 -30 {lab=#net2}
N 0 -100 0 -80 {lab=#net2}
N 180 -20 180 -0 {lab=VSS}
N 180 -20 220 -20 {lab=VSS}
N 180 -80 180 -20 {lab=VSS}
N -0 -180 0 -160 {lab=VA}
N -0 160 -0 180 {lab=VB}
C {capa.sym} 0 -130 0 0 {name=C1
m=1
value=68.84f
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 0 130 2 0 {name=C2
m=1
value=68.84f
footprint=1206
device="ceramic capacitor"}
C {iopin.sym} 0 -180 0 0 {name=p1 lab=VA}
C {iopin.sym} 220 -20 0 0 {name=p2 lab=VSS}
C {iopin.sym} -80 0 0 1 {name=p3 lab=B}
C {iopin.sym} 0 180 0 0 {name=p5 lab=VB}
C {lab_pin.sym} 130 -140 0 1 {name=p4 sig_type=std_logic lab=B}
C {lab_pin.sym} 130 140 0 1 {name=p6 sig_type=std_logic lab=B}
C {sg13g2_pr/sg13_lv_nmos.sym} -20 0 0 0 {name=M1
l=0.13u
w=6.23u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 130 100 3 0 {name=M2
l=0.13u
w=6.23u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 130 -100 3 1 {name=M3
l=0.13u
w=6.23u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
