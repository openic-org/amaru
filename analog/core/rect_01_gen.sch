v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -80 0 -80 50 {lab=VL}
N -140 0 -80 0 {lab=VL}
N 80 0 80 50 {lab=VH}
N -80 -50 -80 0 {lab=VL}
N -20 -80 -20 50 {lab=#net1}
N -80 -80 -20 -80 {lab=#net1}
N -40 50 -20 50 {lab=#net1}
N 20 -50 20 80 {lab=#net2}
N 20 80 80 80 {lab=#net2}
N -40 -50 20 -50 {lab=#net2}
N 20 -50 40 -50 {lab=#net2}
N -20 50 40 50 {lab=#net1}
N 0 -80 80 -80 {lab=#net1}
N 0 80 20 80 {lab=#net2}
N 180 0 200 -0 {lab=VH}
N 80 -50 80 0 {lab=VH}
N -0 -220 0 -180 {lab=VA}
N 0 180 0 220 {lab=VB}
N 0 80 0 120 {lab=#net2}
N -80 80 0 80 {lab=#net2}
N 0 -120 0 -80 {lab=#net1}
N -20 -80 0 -80 {lab=#net1}
N 180 100 180 140 {lab=VSS}
N 180 0 180 40 {lab=VH}
N 80 0 180 0 {lab=VH}
C {sg13g2_pr/sg13_lv_nmos.sym} -60 50 0 1 {name=M1
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 60 -50 0 0 {name=M3
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -60 -50 2 0 {name=M2
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 60 50 2 1 {name=M4
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} -140 0 0 1 {name=p2 lab=VL}
C {iopin.sym} 200 0 0 0 {name=p4 lab=VH}
C {capa.sym} 0 -150 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 0 150 0 0 {name=C2
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {iopin.sym} 0 -220 0 0 {name=p1 lab=VA}
C {iopin.sym} 0 220 0 0 {name=p3 lab=VB}
C {capa.sym} 180 70 0 0 {name=C3
m=1
value=1f
footprint=1206
device="ceramic capacitor"}
C {iopin.sym} 180 140 0 0 {name=p5 lab=VSS}
