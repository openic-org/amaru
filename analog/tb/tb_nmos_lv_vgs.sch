v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 100 -390 100 -350 {lab=VDD}
N 180 -390 180 -350 {lab=VSS}
N 480 -400 480 -360 {lab=VDD}
N 260 -390 260 -350 {lab=VG}
N 480 -330 480 -260 {lab=VSS}
N 400 -330 440 -330 {lab=VG}
C {vsource.sym} 100 -320 0 0 {name=V1 value=0.75 savecurrent=false}
C {gnd.sym} 100 -290 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 100 -370 0 1 {name=p1 sig_type=std_logic lab=VDD}
C {code_shown.sym} 580 -500 0 0 {name=NGSPICE only_toplevel=false value="
.param temp=27
.param widthn=1u
.param lengthn=0.5u
.dc v3 0 1.5 0.01
.save @n.xm1.nsg13_lv_nmos[ids]
.save @n.xm1.nsg13_lv_nmos[vth]
.save @n.xm1.nsg13_lv_nmos[gm]
.save @n.xm1.nsg13_lv_nmos[gmb]
.save @n.xm1.nsg13_lv_nmos[gds]
.save @n.xm1.nsg13_lv_nmos[cgg]
.save @n.xm1.nsg13_lv_nmos[cgs]
.save @n.xm1.nsg13_lv_nmos[cgd]
.save @n.xm1.nsg13_lv_nmos[cgb]
.save @n.xm1.nsg13_lv_nmos[cdd]
.save @n.xm1.nsg13_lv_nmos[css]
.save @n.xm1.nsg13_lv_nmos[cgsol]
.save @n.xm1.nsg13_lv_nmos[cgdol]
.save @n.xm1.nsg13_lv_nmos[cjs]
.save @n.xm1.nsg13_lv_nmos[cjd]

.control
  set filetype = ascii
  foreach wval 10u 50u 200u 500u
    alterparam widthn = $wval
    reset
    run
    let ids = @n.xm1.nsg13_lv_nmos[ids]
    let vth = @n.xm1.nsg13_lv_nmos[vth]
    let gm = @n.xm1.nsg13_lv_nmos[gm]
    let gmb = @n.xm1.nsg13_lv_nmos[gmb]
    let gds = @n.xm1.nsg13_lv_nmos[gds]
    let cgg = @n.xm1.nsg13_lv_nmos[cgg]
    let cgs = @n.xm1.nsg13_lv_nmos[cgs]
    let cgd = @n.xm1.nsg13_lv_nmos[cgd]
    let cgb = @n.xm1.nsg13_lv_nmos[cgb]
    let cdd = @n.xm1.nsg13_lv_nmos[cdd]
    let css = @n.xm1.nsg13_lv_nmos[css]
    let cgsol = @n.xm1.nsg13_lv_nmos[cgsol]
    let cgdol = @n.xm1.nsg13_lv_nmos[cgdol]
    let cjs = @n.xm1.nsg13_lv_nmos[cjs]
    let cjd = @n.xm1.nsg13_lv_nmos[cjd]
    write nmoslv_vgs2.raw ids vth gm gmb gds cgg cgs cgd cgb cdd css cgsol cgdol cjs cjd
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
