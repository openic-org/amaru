v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -160 40 -60 40 {lab=VIN}
N -160 -90 -160 40 {lab=VIN}
N -160 -180 -160 -150 {lab=#net1}
N -160 -360 -160 -240 {lab=VIP}
N -60 -140 -60 40 {lab=VIN}
N -280 -360 -280 -200 {lab=VIP}
N -280 -140 -280 40 {lab=VIN}
N -460 -200 -460 -160 {lab=VSS}
N -460 -100 -460 -70 {lab=GND}
N 40 -360 40 -300 {lab=VIP}
N 40 -240 40 -100 {lab=VSS}
N 40 -40 40 40 {lab=VIN}
N -280 40 -160 40 {lab=VIN}
N -280 -360 -160 -360 {lab=VIP}
N -60 -360 -60 -200 {lab=VIP}
N -160 -360 -60 -360 {lab=VIP}
N -60 -360 40 -360 {lab=VIP}
N -60 40 40 40 {lab=VIN}
C {ind.sym} -160 -120 0 0 {name=L1
m=1
value=100n
footprint=1206
device=inductor}
C {res.sym} -160 -210 0 0 {name=R1
value=0.34
footprint=1206
device=resistor
m=1}
C {capa.sym} -60 -170 0 0 {name=C1
m=1
value=0.39578p
footprint=1206
device="ceramic capacitor"}
C {code.sym} -680 -370 0 0 {name=NGSPICE only_toplevel=true value="

.save all
.save V(VIP) V(VIN) V(VIP, VIN)
.save I(VPORT)


.control
  set filetype=ascii        ; ASCII .raw (human-readable)
    run
    ac dec 1000 1Meg 1000Meg
    *tran 0.1u 100u
    let ZIN  = v(VIP, VIN)
    let ABSZ = abs(ZIN)
    let IMZ  = imag(ZIN)
    let REZ  = real(ZIN)
    let Q    = IMZ/REZ
    meas ac F_res when IMZ=0
    write tb_coil1.raw ABSZ Q
    set appendwrite
.endc
"}
C {code.sym} -530 -370 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
"}
C {lab_pin.sym} -280 -360 0 0 {name=p33 sig_type=std_logic lab=VIP}
C {lab_pin.sym} -280 40 0 0 {name=p52 sig_type=std_logic lab=VIN}
C {vsource.sym} -460 -130 0 0 {name=V17 value=0 savecurrent=false}
C {lab_pin.sym} -460 -200 0 0 {name=p35 sig_type=std_logic lab=VSS}
C {gnd.sym} -460 -70 0 0 {name=l4 lab=GND}
C {res.sym} 40 -270 0 0 {name=R2
value=75k
footprint=1206
device=resistor
m=1}
C {res.sym} 40 -70 0 0 {name=R3
value=75k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 40 -170 0 1 {name=p1 sig_type=std_logic lab=VSS}
C {isource.sym} -280 -170 0 0 {name=I0 value="dc 0 ac 1"}
