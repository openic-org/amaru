v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -100 -160 -100 -110 {lab=VDD}
N 0 -160 100 -160 {lab=VDD}
N 100 -160 100 -110 {lab=VDD}
N -100 -60 -100 -30 {lab=#net1}
N 100 -50 100 -30 {lab=VOUT}
N -0 -110 60 -110 {lab=#net1}
N -100 -60 -0 -60 {lab=#net1}
N -100 -80 -100 -60 {lab=#net1}
N -0 -110 -0 -60 {lab=#net1}
N -60 -110 -0 -110 {lab=#net1}
N 0 0 100 0 {lab=VSS}
N 0 0 0 50 {lab=VSS}
N -100 0 0 0 {lab=VSS}
N -100 30 -100 100 {lab=#net2}
N 0 100 100 100 {lab=#net2}
N 100 30 100 100 {lab=#net2}
N -160 0 -140 -0 {lab=VFB}
N 140 0 160 0 {lab=VREF}
N 0 -200 0 -160 {lab=VDD}
N -100 -160 0 -160 {lab=VDD}
N 100 -50 210 -50 {lab=VOUT}
N 100 -80 100 -50 {lab=VOUT}
N 0 100 -0 150 {lab=#net2}
N -100 100 0 100 {lab=#net2}
N 0 180 0 240 {lab=VSS}
N -200 180 -40 180 {lab=#net3}
N -280 120 -280 150 {lab=#net3}
N -280 120 -200 120 {lab=#net3}
N -200 120 -200 180 {lab=#net3}
N -240 180 -200 180 {lab=#net3}
N -280 180 -280 240 {lab=VSS}
N -280 -160 -280 -100 {lab=VDD}
N -280 -160 -100 -160 {lab=VDD}
N -280 -40 -280 120 {lab=#net3}
N -280 240 -0 240 {lab=VSS}
N 0 240 -0 270 {lab=VSS}
N 0 50 130 50 {lab=VSS}
N 130 50 130 240 {lab=VSS}
N 0 240 130 240 {lab=VSS}
C {sg13g2_pr/sg13_lv_nmos.sym} -120 0 0 0 {name=Mldo1
l=0.13u
w=1.2u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 80 -110 0 0 {name=Mldo4
l=0.13u
w=2.4u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {ipin.sym} 160 0 0 1 {name=p1 lab=VREF}
C {iopin.sym} 0 -200 2 1 {name=p2 lab=VDD}
C {opin.sym} 210 -50 0 0 {name=p3 lab=VOUT}
C {ipin.sym} -160 0 0 0 {name=p4 lab=VFB}
C {sg13g2_pr/sg13_lv_nmos.sym} 120 0 0 1 {name=Mldo2
l=0.13u
w=1.2u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -80 -110 0 1 {name=Mldo3
l=0.13u
w=2.4u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -20 180 0 0 {name=Mldo5
l=0.13u
w=2u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -260 180 0 1 {name=Mldo6
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {iopin.sym} 0 270 2 1 {name=p5 lab=VSS}
C {isource.sym} -280 -70 0 0 {name=I0 value=2u}
