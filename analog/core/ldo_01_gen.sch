v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 220 0 220 40 {lab=VLDO}
N 220 100 220 140 {lab=VSS}
N -60 -10 -60 30 {lab=VSS}
N -60 -130 -60 -90 {lab=VDD}
N 120 0 120 20 {lab=VLDO}
N 120 0 220 0 {lab=VLDO}
N 120 -20 120 0 {lab=VLDO}
N 120 180 120 220 {lab=VSS}
N -140 -30 -120 -30 {lab=VREF}
N -220 -70 -220 100 {lab=VB}
N -220 -70 -120 -70 {lab=VB}
N 120 -130 120 -50 {lab=VDD}
N -60 -130 120 -130 {lab=VDD}
N 0 -50 80 -50 {lab=VA}
N 120 100 120 120 {lab=VA}
N 220 0 260 0 {lab=VLDO}
N 60 100 120 100 {lab=VA}
N 120 80 120 100 {lab=VA}
N -220 100 -60 100 {lab=VB}
C {iopin.sym} -140 -30 0 1 {name=p2 lab=VREF}
C {iopin.sym} 260 0 0 0 {name=p4 lab=VLDO}
C {iopin.sym} 120 -130 0 0 {name=p1 lab=VDD}
C {iopin.sym} -60 100 0 0 {name=p3 lab=VB}
C {iopin.sym} 120 220 0 0 {name=p5 lab=VSS}
C {capa.sym} 220 70 0 0 {name=C1
m=1
value=1n
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 220 120 0 1 {name=p6 sig_type=std_logic lab=VSS}
C {opamp_01.sym} -60 -50 0 0 {name=x1}
C {sg13g2_pr/sg13_lv_pmos.sym} 100 -50 0 0 {name=M1
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} -60 10 0 1 {name=p7 sig_type=std_logic lab=VSS}
C {res.sym} 120 150 0 0 {name=R2
value=500k
footprint=1206
device=resistor
m=1}
C {res.sym} 120 50 0 0 {name=R1
value=500k
footprint=1206
device=resistor
m=1}
C {iopin.sym} 60 100 0 1 {name=p8 lab=VA}
C {lab_pin.sym} 40 -50 3 1 {name=p9 sig_type=std_logic lab=VG}
