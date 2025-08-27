v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -40 0 -40 50 {lab=A}
N -60 0 -40 0 {lab=A}
N -40 -50 -40 0 {lab=A}
N 0 0 0 20 {lab=xxx}
N 0 0 70 0 {lab=xxx}
N 0 -20 0 0 {lab=xxx}
N 0 -100 0 -50 {lab=VDD}
N -0 50 -0 100 {lab=VSS}
C {sg13g2_pr/sg13_lv_nmos.sym} -20 50 0 0 {name=M1
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -20 -50 0 0 {name=M2
l=0.13u
w=2u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} 0 -100 0 0 {name=p1 lab=VDD}
C {iopin.sym} 0 100 0 0 {name=p2 lab=VSS}
C {iopin.sym} -60 0 0 1 {name=p3 lab=A}
C {iopin.sym} 70 0 0 0 {name=p4 lab=Z}
