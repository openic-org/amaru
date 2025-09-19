v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 40 -530 40 -490 {lab=VSS}
N 900 -480 900 -440 {lab=VG}
N 240 -620 240 -500 {lab=VIP}
N 240 -340 360 -340 {lab=VIN}
N 240 -620 360 -620 {lab=VIP}
N 240 -440 240 -340 {lab=VIN}
N 900 -380 900 -340 {lab=VSS}
N 580 -620 580 -530 {lab=VIP}
N 360 -510 360 -480 {lab=#net1}
N 360 -620 360 -570 {lab=VIP}
N 360 -420 360 -340 {lab=VIN}
N 460 -620 460 -530 {lab=VIP}
N 360 -340 460 -340 {lab=VIN}
N 460 -470 460 -340 {lab=VIN}
N 460 -340 580 -340 {lab=VIN}
N 580 -470 580 -340 {lab=VIN}
N 460 -620 580 -620 {lab=VIP}
N 360 -620 460 -620 {lab=VIP}
N 740 -620 760 -620 {lab=VIP}
N 740 -340 760 -340 {lab=VIN}
N 820 -340 820 -300 {lab=VSS}
N 790 -340 820 -340 {lab=VSS}
N 790 -620 820 -620 {lab=VSS}
N 820 -620 820 -580 {lab=VSS}
N 790 -380 820 -380 {lab=VSS}
N 820 -380 820 -340 {lab=VSS}
N 790 -580 820 -580 {lab=VSS}
N 740 -620 740 -540 {lab=VIP}
N 580 -620 740 -620 {lab=VIP}
N 740 -420 740 -340 {lab=VIN}
N 580 -340 740 -340 {lab=VIN}
N 680 -480 700 -480 {lab=VSS}
N 780 -480 900 -480 {lab=VG}
C {vsource.sym} 40 -460 0 0 {name=V2 value=0 savecurrent=false}
C {gnd.sym} 40 -430 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 40 -510 0 1 {name=p2 sig_type=std_logic lab=VSS}
C {code_shown.sym} 230 -730 0 0 {name=MODEL only_toplevel=false value="
.lib cornerMOSlv.lib mos_tt
"}
C {lab_pin.sym} 680 -480 0 0 {name=p9 sig_type=std_logic lab=VSS}
C {vsource.sym} 900 -410 0 0 {name=V1 value=0 savecurrent=false}
C {lab_pin.sym} 900 -460 0 1 {name=p4 sig_type=std_logic lab=VG}
C {lab_pin.sym} 240 -620 0 0 {name=p33 sig_type=std_logic lab=VIP}
C {lab_pin.sym} 240 -340 0 0 {name=p52 sig_type=std_logic lab=VIN}
C {isource.sym} 240 -470 0 0 {name=I0 value="dc 0 ac 1"}
C {code.sym} 830 -740 0 0 {name=NGSPICE only_toplevel=true value="

.save all
.save V(VIP) V(VIN)
.ac dec 1000 350Meg 550Meg

.control
  set filetype=ascii        ; ASCII .raw (human-readable)
  run
  alter v1 dc=1.2
  run
  let ZIN0  = ac1.v(VIP) - ac1.v(VIN)
  let ABSZ0 = abs(ZIN0)
  let IMZ0  = imag(ZIN0)
  let REZ0  = real(ZIN0)
  let Q0    = IMZ0/REZ0
  let ZIN1  = ac2.v(VIP) - ac2.v(VIN)
  let ABSZ1 = abs(ZIN1)
  let IMZ1  = imag(ZIN1)
  let REZ1  = real(ZIN1)
  let Q1    = IMZ1/REZ1
  write tb_lskm_g1.raw ABSZ0 Q0 ABSZ1 Q1
  set appendwrite
.endc
"}
C {lab_pin.sym} 900 -360 0 1 {name=p1 sig_type=std_logic lab=VSS}
C {capa.sym} 580 -500 0 0 {name=C2
m=1
value=2.72p
footprint=1206
device="ceramic capacitor"}
C {ind.sym} 360 -450 0 0 {name=L1
m=1
value=47n
footprint=1206
device=inductor}
C {res.sym} 360 -540 0 0 {name=R1
value=0.471
footprint=1206
device=resistor
m=1}
C {capa.sym} 460 -500 0 0 {name=C1
m=1
value=0.15412p
footprint=1206
device="ceramic capacitor"}
C {sg13g2_pr/sg13_lv_nmos.sym} 790 -360 3 1 {name=M2
l=0.13u
w=0.5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 820 -320 0 1 {name=p3 sig_type=std_logic lab=VSS}
C {sg13g2_pr/sg13_lv_nmos.sym} 790 -600 3 0 {name=M3
l=0.13u
w=0.5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 820 -600 0 1 {name=p5 sig_type=std_logic lab=VSS}
C {lskmod_gen.sym} 740 -480 0 0 {name=x1
Ls=47e-9
Rs=0.471
f_sr=1870e6
q_coil=289
f_op=433e6
schematic="lskmod.py(@Ls\\,@Rs\\,@f_sr\\,@q_coil\\,@f_op\\)"
tclcommand="edit_file [abs_sym_path lskmod.py]"}
