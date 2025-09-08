v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 100 -390 100 -350 {lab=VDD}
N 180 -390 180 -350 {lab=VSS}
N 480 -400 480 -330 {lab=VDD}
N 260 -390 260 -350 {lab=VG}
N 400 -330 440 -330 {lab=VG}
N 480 -300 480 -260 {lab=VSS}
C {vsource.sym} 100 -320 0 0 {name=V1 value=1.5 savecurrent=false}
C {gnd.sym} 100 -290 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 100 -370 0 1 {name=p1 sig_type=std_logic lab=VDD}
C {code_shown.sym} 580 -500 0 0 {name=NGSPICE only_toplevel=false value="
.param temp=27
.param widthp=1u
.param lengthp=0.5u
.dc v3 0 1.5 0.01
.save @n.xm1.nsg13_lv_pmos[ids]
.save @n.xm1.nsg13_lv_pmos[vth]
.save @n.xm1.nsg13_lv_pmos[gm]
.save @n.xm1.nsg13_lv_pmos[gmb]
.save @n.xm1.nsg13_lv_pmos[gds]
.save @n.xm1.nsg13_lv_pmos[cgg]
.save @n.xm1.nsg13_lv_pmos[cgs]
.save @n.xm1.nsg13_lv_pmos[cgd]
.save @n.xm1.nsg13_lv_pmos[cgb]
.save @n.xm1.nsg13_lv_pmos[cdd]
.save @n.xm1.nsg13_lv_pmos[css]
.save @n.xm1.nsg13_lv_pmos[cgsol]
.save @n.xm1.nsg13_lv_pmos[cgdol]
.save @n.xm1.nsg13_lv_pmos[cjs]
.save @n.xm1.nsg13_lv_pmos[cjd]

.control
  set filetype = ascii
  foreach wval 10u 50u 200u 500u
    alterparam widthp = $wval
    reset
    run
    let ids = @n.xm1.nsg13_lv_pmos[ids]
    let vth = @n.xm1.nsg13_lv_pmos[vth]
    let gm = @n.xm1.nsg13_lv_pmos[gm]
    let gmb = @n.xm1.nsg13_lv_pmos[gmb]
    let gds = @n.xm1.nsg13_lv_pmos[gds]
    let cgg = @n.xm1.nsg13_lv_pmos[cgg]
    let cgs = @n.xm1.nsg13_lv_pmos[cgs]
    let cgd = @n.xm1.nsg13_lv_pmos[cgd]
    let cgb = @n.xm1.nsg13_lv_pmos[cgb]
    let cdd = @n.xm1.nsg13_lv_pmos[cdd]
    let css = @n.xm1.nsg13_lv_pmos[css]
    let cgsol = @n.xm1.nsg13_lv_pmos[cgsol]
    let cgdol = @n.xm1.nsg13_lv_pmos[cgdol]
    let cjs = @n.xm1.nsg13_lv_pmos[cjs]
    let cjd = @n.xm1.nsg13_lv_pmos[cjd]
    write pmoslv_vgs2.raw ids vth gm gmb gds cgg cgs cgd cgb cdd css cgsol cgdol cjs cjd
    set appendwrite
  end
.endc

"}
C {vsource.sym} 180 -320 0 0 {name=V2 value=0.75 savecurrent=false}
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
C {sg13g2_pr/sg13_lv_pmos.sym} 460 -330 0 0 {name=M1
l=lengthp
w=widthp
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
