v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -390 -70 -390 -30 {lab=VDD}
N -390 30 -390 70 {lab=GND}
N -320 -70 -320 -30 {lab=VSS}
N -320 30 -320 70 {lab=GND}
N -240 -70 -240 -30 {lab=VREF}
N -240 30 -240 70 {lab=GND}
N 250 120 250 160 {lab=VFB}
N 140 0 210 0 {lab=VOUT}
N 20 70 20 140 {lab=VSS}
N -120 50 -100 50 {lab=VFB}
N -120 -50 -100 -50 {lab=VREF}
N 250 50 250 60 {lab=VOUT}
N 250 30 250 50 {lab=VOUT}
N 380 50 380 110 {lab=VOUT}
N 250 50 380 50 {lab=VOUT}
N 380 170 380 200 {lab=GND}
N 380 50 400 50 {lab=VOUT}
N 250 -80 250 -30 {lab=VDD}
N 20 -140 20 -70 {lab=VDD}
N 250 0 320 0 {lab=VSS}
C {sg13g2_pr/sg13_lv_pmos.sym} 230 0 0 0 {name=Mldo7
l=0.13u
w=12u
ng=4
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {vsource.sym} -390 0 0 0 {name=V1 value=1.6 savecurrent=false}
C {res.sym} 250 90 0 0 {name=R1
value=10k
footprint=1206
device=resistor
m=1}
C {code_shown.sym} -800 -110 0 0 {name=NGSPICE
only_toplevel=true
value="
.param temp=27
.option filetype=ascii
.save all

.control
op
set filetype=ascii
write tb_ldo_dc.raw all
.endc
"}
C {gnd.sym} -390 70 0 0 {name=l1 lab=GND}
C {vsource.sym} -320 0 0 0 {name=V2 value=0 savecurrent=false}
C {gnd.sym} -320 70 0 0 {name=l2 lab=GND}
C {vsource.sym} -240 0 0 0 {name=V3 value=0.5 savecurrent=false}
C {gnd.sym} -240 70 0 0 {name=l3 lab=GND}
C {res.sym} 250 190 0 0 {name=R2
value=10k
footprint=1206
device=resistor
m=1}
C {gnd.sym} 250 220 0 0 {name=l4 lab=GND}
C {capa.sym} 380 140 0 0 {name=C1
m=1
value=100p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 380 200 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -390 -60 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -320 -60 0 0 {name=p2 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -240 -60 0 0 {name=p3 sig_type=std_logic lab=VREF}
C {lab_pin.sym} -120 -50 0 0 {name=p4 sig_type=std_logic lab=VREF}
C {lab_pin.sym} 250 140 0 0 {name=p5 sig_type=std_logic lab=VFB}
C {lab_pin.sym} -120 50 0 0 {name=p6 sig_type=std_logic lab=VFB}
C {lab_pin.sym} 20 -120 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 20 120 0 0 {name=p8 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 250 -70 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 170 0 1 0 {name=p11 sig_type=std_logic lab=VOUT}
C {lab_pin.sym} 400 50 2 0 {name=p12 sig_type=std_logic lab=VOUT}
C {lab_pin.sym} 310 0 2 0 {name=p9 sig_type=std_logic lab=VSS}
C {code_shown.sym} -790 -230 0 0 {name=MODEL
only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
"}
C {error_amp.sym} 20 0 0 0 {name=x1}
