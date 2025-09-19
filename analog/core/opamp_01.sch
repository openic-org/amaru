v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -160 0 -140 0 {lab=VIP}
N 140 0 160 0 {lab=VIM}
N -100 30 -100 60 {lab=#net1}
N 100 30 100 60 {lab=#net1}
N 0 60 100 60 {lab=#net1}
N -100 -80 -100 -30 {lab=#net2}
N 100 -180 100 -130 {lab=VDD}
N -100 -180 -100 -130 {lab=VDD}
N -100 -180 100 -180 {lab=VDD}
N -40 -130 60 -130 {lab=#net2}
N -100 -80 -40 -80 {lab=#net2}
N -100 -100 -100 -80 {lab=#net2}
N -40 -130 -40 -80 {lab=#net2}
N -60 -130 -40 -130 {lab=#net2}
N 100 -60 100 -30 {lab=VO}
N 0 60 0 100 {lab=#net1}
N -100 60 0 60 {lab=#net1}
N 0 130 0 180 {lab=VSS}
N -260 130 -260 180 {lab=VSS}
N -200 130 -40 130 {lab=#net3}
N -260 80 -260 100 {lab=#net3}
N -260 -180 -260 -100 {lab=VDD}
N -260 -180 -100 -180 {lab=VDD}
N -260 80 -200 80 {lab=#net3}
N -260 -40 -260 80 {lab=#net3}
N -200 80 -200 130 {lab=#net3}
N -220 130 -200 130 {lab=#net3}
N -100 0 100 0 {lab=VSS}
N -260 180 0 180 {lab=VSS}
N 100 -100 100 -60 {lab=VO}
N 100 -60 160 -60 {lab=VO}
C {sg13g2_pr/sg13_lv_nmos.sym} -120 0 0 0 {name=M1
l=0.25u
w=10u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 120 0 0 1 {name=M2
l=0.25u
w=10u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -80 -130 0 1 {name=M3
l=4u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 80 -130 0 0 {name=M4
l=4u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -20 130 0 0 {name=M5
l=2u
w=2u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -240 130 0 1 {name=M6
l=2u
w=2u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {isource.sym} -260 -70 0 0 {name=I0 value=100n}
C {iopin.sym} 160 0 0 0 {name=p7 lab=VIM}
C {iopin.sym} -160 0 0 1 {name=p8 lab=VIP}
C {iopin.sym} -260 180 0 1 {name=p9 lab=VSS}
C {iopin.sym} -260 -180 0 1 {name=p10 lab=VDD}
C {iopin.sym} 160 -60 0 0 {name=p11 lab=VO}
C {lab_pin.sym} 0 0 3 1 {name=p12 sig_type=std_logic lab=VSS}
