v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 40 0 80 0 {lab=D}
N 0 -50 0 -30 {lab=VA}
N 0 30 0 50 {lab=VB}
N -80 -0 0 -0 {lab=VSS}
C {iopin.sym} 0 -50 0 0 {name=p1 lab=VA}
C {iopin.sym} -80 0 0 1 {name=p2 lab=VSS}
C {iopin.sym} 80 0 0 0 {name=p3 lab=D}
C {iopin.sym} 0 50 0 0 {name=p5 lab=VB}
C {sg13g2_pr/sg13_lv_nmos.sym} 20 0 0 1 {name=M1
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
