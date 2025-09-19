v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 180 -80 180 -40 {lab=0}
N 260 -160 300 -160 {lab=a}
N 180 -160 180 -140 {lab=x}
N 180 -160 200 -160 {lab=x}
N 60 -160 100 -160 {lab=b}
N 160 -160 180 -160 {lab=x}
C {lab_pin.sym} 170 -160 1 0 {name=p6 sig_type=std_logic lab=x

}
C {vsource.sym} 230 -160 3 0 {name=Vi value="dc 0 ac 1" savecurrent=false}
C {isource.sym} 180 -110 2 0 {name=Ii value="dc 0 ac 0"}
C {vsource.sym} 130 -160 3 0 {name=Vnodebuffer value=0 savecurrent=false}
C {iopin.sym} 300 -160 0 0 {name=p1 lab=a}
C {iopin.sym} 60 -160 0 1 {name=p2 lab=b}
C {gnd.sym} 180 -40 0 0 {name=l5 lab=GND}
