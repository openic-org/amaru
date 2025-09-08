v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 80 -380 80 -340 {lab=VDD}
N 160 -380 160 -340 {lab=VSS}
N 470 -280 530 -280 {lab=Z}
N 530 -280 530 -260 {lab=Z}
N 420 -340 420 -300 {lab=VDD}
N 420 -260 420 -220 {lab=VSS}
N 530 -200 530 -160 {lab=VSS}
N 320 -200 320 -160 {lab=VSS}
N 320 -280 320 -260 {lab=A}
N 320 -280 380 -280 {lab=A}
C {vsource.sym} 80 -310 0 0 {name=V1 value=1.2 savecurrent=false}
C {gnd.sym} 80 -280 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 80 -360 0 1 {name=p1 sig_type=std_logic lab=VDD}
C {capa.sym} 530 -230 0 0 {name=C1
m=1
value=10f
footprint=1206
device="ceramic capacitor"}
C {code_shown.sym} 640 -330 0 0 {name=NGSPICE only_toplevel=false value="
.param temp=27
.tran 50p 20n
.save all
"}
C {vsource.sym} 160 -310 0 0 {name=V2 value=0 savecurrent=false}
C {gnd.sym} 160 -280 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 160 -360 0 1 {name=p2 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 420 -320 0 1 {name=p3 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 420 -240 0 1 {name=p4 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 530 -180 0 1 {name=p5 sig_type=std_logic lab=VSS}
C {vsource.sym} 320 -230 0 1 {name=V3 value="dc 0 pulse 0 1.2 2n 100p 100p 2n 4n" savecurrent=false}
C {lab_pin.sym} 320 -180 0 1 {name=p6 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 320 -280 0 0 {name=p7 sig_type=std_logic lab=A}
C {lab_pin.sym} 530 -280 0 1 {name=p8 sig_type=std_logic lab=Z}
C {code_shown.sym} 640 -190 0 0 {name=MODEL only_toplevel=false value="
.lib cornerMOSlv.lib mos_tt
"}
C {inv_1x_gen.sym} 420 -280 0 0 {name=x1
wn_um=2
wp_um=4
schematic="test_pcell.py(@wn_um\\,@wp_um\\)"
tclcommand="edit_file [abs_sym_path test_pcell.py]"}
