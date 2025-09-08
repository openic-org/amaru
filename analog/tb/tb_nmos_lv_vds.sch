v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 100 -390 100 -350 {lab=VDD}
N 180 -390 180 -350 {lab=VSS}
N 260 -390 260 -350 {lab=VG}
N 400 -330 440 -330 {lab=VG}
N 480 -400 480 -360 {lab=VDD}
N 480 -330 480 -260 {lab=VSS}
C {vsource.sym} 100 -320 0 0 {name=V1 value=0.75 savecurrent=false}
C {gnd.sym} 100 -290 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 100 -370 0 1 {name=p1 sig_type=std_logic lab=VDD}
C {code_shown.sym} 580 -500 0 0 {name=NGSPICE only_toplevel=false value="
.param temp=27
.param widthn=1u
.param lengthn=1u
.dc v1 0 1.5 0.01
.save @n.xm1.nsg13_lv_nmos[ids]

.control
  set filetype = ascii
  foreach wval 10u 50u 200u 500u
    alterparam widthn = $wval
    reset
    run
    let ids = @n.xm1.nsg13_lv_nmos[ids]
    let ro = 1/deriv(ids)
    write nmoslv_vds3.raw ids ro
    set appendwrite
  end
.endc

"}
C {vsource.sym} 180 -320 0 0 {name=V2 value=0 savecurrent=false}
C {gnd.sym} 180 -290 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 180 -370 0 1 {name=p2 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 480 -380 0 1 {name=p3 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 480 -280 0 1 {name=p4 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 400 -330 0 0 {name=p7 sig_type=std_logic lab=VG}
C {code_shown.sym} 200 -500 0 0 {name=MODEL only_toplevel=false value="
.lib cornerMOSlv.lib mos_tt
"}
C {vsource.sym} 260 -320 0 0 {name=V3 value=0.75 savecurrent=false}
C {gnd.sym} 260 -290 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 260 -370 0 1 {name=p5 sig_type=std_logic lab=VG}
C {sg13g2_pr/sg13_lv_nmos.sym} 460 -330 0 0 {name=M1
l=lengthn
w=widthn
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
