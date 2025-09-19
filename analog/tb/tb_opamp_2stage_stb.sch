v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 220 -360 220 -320 {lab=VDD}
N 300 -360 300 -320 {lab=VSS}
N 400 -600 420 -600 {lab=VDD}
N 220 -540 220 -500 {lab=VI}
N 660 -680 660 -660 {lab=VDD}
N 660 -540 660 -500 {lab=VSS}
N 480 -600 580 -600 {lab=#net1}
N 540 -630 580 -630 {lab=VI}
N 540 -570 580 -570 {lab=#net2}
N 780 -600 880 -600 {lab=VO3}
N 760 -420 780 -420 {lab=VO3}
N 780 -600 780 -420 {lab=VO3}
N 540 -420 560 -420 {lab=#net2}
N 540 -570 540 -420 {lab=#net2}
N 840 -540 840 -500 {lab=VSS}
N 740 -600 780 -600 {lab=VO3}
C {vsource.sym} 220 -290 0 0 {name=V1 value=1.5 savecurrent=false}
C {gnd.sym} 220 -260 0 0 {name=l1 lab=GND}
C {vsource.sym} 300 -290 0 0 {name=V2 value=0 savecurrent=false}
C {gnd.sym} 300 -260 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 220 -340 2 0 {name=p2 sig_type=std_logic lab=VDD
}
C {lab_pin.sym} 300 -340 2 0 {name=p3 sig_type=std_logic lab=VSS

}
C {code.sym} 990 -400 0 0 {name=NGSPICE
only_toplevel=true
value="
.param temp=27
.options savecurrents

.ac dec 80 1 10g
.save all v(X999.x) i(v.X999.Vi)

.control

  run
  alter i.X999.Ii acmag=1
  alter v.X999.Vi acmag=0
  run

  let A=ac2.i(v.X999.Vi)
  let B=ac1.i(v.X999.Vi)
  let C=ac2.v(X999.x)
  let D=ac1.v(X999.x)
  let Ttian=(2*(B*C-A*D)+D+A)/(2*(B*C-A*D)+A+D-1)

  gnuplot magfile db(Ttian)
  gnuplot phfile 180*cph(Ttian)/pi

  set appendwrite
  op
  write tb_opamp_2stage.raw

.endc
"}
C {code.sym} 990 -570 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
"}
C {lab_pin.sym} 540 -630 2 1 {name=p9 sig_type=std_logic lab=VI

}
C {isource.sym} 450 -600 3 0 {name=I0 value=200u}
C {lab_pin.sym} 410 -600 1 0 {name=p12 sig_type=std_logic lab=VDD
}
C {lab_pin.sym} 220 -520 2 0 {name=p5 sig_type=std_logic lab=VI

}
C {vsource.sym} 220 -470 0 0 {name=V4 value="dc 0.9 ac 0" savecurrent=false}
C {gnd.sym} 220 -440 0 0 {name=l4 lab=GND}
C {launcher.sym} 590 -320 0 0 {name=h1
descr=Backannotate-OP
tclcommand="xschem annotate_op"}
C {opamp_2stage.sym} 660 -600 0 0 {name=x1}
C {capa.sym} 840 -570 0 0 {name=C2
m=1
value=2p
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 660 -670 2 0 {name=p1 sig_type=std_logic lab=VDD
}
C {lab_pin.sym} 660 -520 2 0 {name=p4 sig_type=std_logic lab=VSS

}
C {lab_pin.sym} 840 -520 2 0 {name=p6 sig_type=std_logic lab=VSS

}
C {loopgainprobe.sym} 660 -420 0 0 {name=X999}
C {lab_pin.sym} 880 -600 2 0 {name=p7 sig_type=std_logic lab=VO3

}
