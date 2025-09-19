#!/usr/bin/python3

import sys
import numpy as np

# ****************************************************************
# Functions

def ldo_01_model(Iload,Vldo,Vrect,Vref):
    # transistor parameters
    vthp = 0.5 # V
    upcox = 22.1e-6 # A/V^2
    lambdap = 0.06 # 1/V
    cgsp_w_l130nm = 0.89*1e-15/1e-6 # F/m
    cgdp_w_l130nm = 0.13*1e-15/1e-6 # F/m
    cdbp_w = 0.28*1e-15/1e-6 # F/m
    csbp_w = 0.36*1e-15/1e-6 # F/m
    covp_w = 300/500*1e-15/1e-6 # F/m

    # LDO modeling
    # ****************************************
    # Opamp Macro-model
    Gm = 2e-6
    Rea = 14e6
    Cea = 50e-15

    # default values
    Rldo1 = 0.5e6
    Rldo2 = 0.5e6

    Cldo = np.array([5e-9,20e-9,80e-9,400e-9,1200e-9,5000e-9]) # F

    Rload = Vldo / Iload
    Rldo1 = Rldo2*(Vldo/Vref - 1)

    vdropout = Vrect - Vldo
    if vdropout>0.2:
        vdropout = 0.2

    # initial values of Mp
    widthp = np.array([10e-6,20e-6,50e-6,100e-6,200e-6,500e-6]) # m
    lengthp = 0.25e-6 # m

    vgs = 0.5 # V

    gmp = np.sqrt(2*upcox*(widthp/lengthp)*Iload)
    rop = 1/(lambdap*Iload)

    cgsp = cgsp_w_l130nm*widthp
    cgdp = cgdp_w_l130nm*widthp
    cdbp = cdbp_w*widthp
    csbp = csbp_w*widthp
    covp = covp_w*widthp

    Cvg = cgsp + cgdp

    beta = Rldo2/(Rldo1+Rldo2)

    Loopgain = gmp * Rload * beta * Gm * Rea

    Vrect_min = Vldo + np.sqrt((2*Iload)/(upcox*(widthp/lengthp)))

    # Poles - Time Constants
    tc1 = Rload * Cldo
    tc2 = Rea * (Cea + Cvg)

    pi_value = 3.14159

    p1 = 1/(2*pi_value*tc1)
    p2 = 1/(2*pi_value*tc2)

    # Gain-BW product
    gbw=[[],[],[],[],[],[]]
    for i in range(0,6):
        gbw[i] = Loopgain*p1[i]


    # output W
    widthp_val = np.interp(vdropout,np.flip(Vrect_min-Vldo),np.flip(widthp))

    # Output Cldo
    p2_val = np.interp(widthp_val,widthp,p2)
    gbw_wp = p1*np.interp(widthp_val,widthp,Loopgain)
    Cldo_val = np.interp(p2_val/10,np.flip(gbw_wp),np.flip(Cldo))

    return widthp_val, lengthp, Cldo_val, Rldo1, Rldo2

def nmos_sg13_lv_nmos(name,w_um,l_um,ng,m,position):
    libraryname = 'sg13g2_pr'
    modelname = 'sg13_lv_nmos'
    print('C {' + libraryname + '/' + modelname + '.sym} ' + str(position[0]) + ' ' + str(position[1]) + ' ' + str(position[2]) + ' ' + str(position[3]) + ' {name=' + name)
    print('l=' + str(l_um) + 'u')
    print('w=' + str(w_um) + 'u')
    print('ng=' + str(ng))
    print('m=' + str(m))
    print('model=' + modelname)
    print('spiceprefix=X')
    print('}')


def pmos_sg13_lv_pmos(name,w_um,l_um,ng,m,position):
    libraryname = 'sg13g2_pr'
    modelname = 'sg13_lv_pmos'
    print('C {' + libraryname + '/' + modelname + '.sym} ' + str(position[0]) + ' ' + str(position[1]) + ' ' + str(position[2]) + ' ' + str(position[3]) + ' {name=' + name)
    print('l=' + str(l_um) + 'u')
    print('w=' + str(w_um) + 'u')
    print('ng=' + str(ng))
    print('m=' + str(m))
    print('model=' + modelname)
    print('spiceprefix=X')
    print('}')

def iopin(name,label,position):
    pintype = 'iopin'
    print('C {' + pintype + '.sym} ' + str(position[0]) + ' ' + str(position[1]) + ' ' + str(position[2]) + ' ' + str(position[3]) + ' {name=' + name + ' lab=' + label +'}')

def labpin(name,label,position):
    pintype = ''
    print('C {lab_pin.sym} ' + str(position[0]) + ' ' + str(position[1]) + ' ' + str(position[2]) + ' ' + str(position[3]) + ' {name=' + name + ' sig_type=std_logic lab=' + label +'}')

def capa(name,cap_fF,position):
    print('C {capa.sym} ' + str(position[0]) + ' ' + str(position[1]) + ' ' + str(position[2]) + ' ' + str(position[3]) + ' {name=' + name)
    print('m=1')
    print('value=' + str(cap_fF) + 'f')
    print('footprint=1206')
    print('device="ceramic capacitor"}')

def capa_nF(name,cap_nF,position):
    print('C {capa.sym} ' + str(position[0]) + ' ' + str(position[1]) + ' ' + str(position[2]) + ' ' + str(position[3]) + ' {name=' + name)
    print('m=1')
    print('value=' + str(cap_nF) + 'n')
    print('footprint=1206')
    print('device="ceramic capacitor"}')

def res(name,res_kOhm,position):
    print('C {res.sym} ' + str(position[0]) + ' ' + str(position[1]) + ' ' + str(position[2]) + ' ' + str(position[3]) + ' {name=' + name)
    print('value=' + str(res_kOhm) + 'k')
    print('footprint=1206')
    print('device=resistor')
    print('m=1}')

def comp(name,comp_name,position):
    print('C {' + comp_name + '.sym} ' + str(position[0]) + ' ' + str(position[1]) + ' ' + str(position[2]) + ' ' + str(position[3]) + ' {name=' + name + '}')

# ****************************************************************
# parsing arguments. These are strings.
Iload = float(sys.argv[1])
Vldo = float(sys.argv[2])
Vrect = float(sys.argv[3])
Vref = float(sys.argv[4])

[a,b,c,d,e] = ldo_01_model(Iload,Vldo,Vrect,Vref)
wp_um = np.round(a*1e6,2)
lp_um = np.round(b*1e6,2)
Cldo_nF = np.round(c*1e9,2)
Rldo1_kOhm = np.round(d/1e3,2)
Rldo2_kOhm = np.round(e/1e3,2)

nf = int(np.floor(wp_um/10) + 1)

# print schematic
print('v {xschem version=3.4.6 file_version=1.2}')
print('G {}')
print('K {}')
print('V {}')
print('S {}')
print('E {}')
print('N 220 0 220 40 {lab=VLDO}')
print('N 220 100 220 140 {lab=VSS}')
print('N -60 -10 -60 30 {lab=VSS}')
print('N -60 -130 -60 -90 {lab=VDD}')
print('N 120 0 120 20 {lab=VLDO}')
print('N 120 0 220 0 {lab=VLDO}')
print('N 120 -20 120 0 {lab=VLDO}')
print('N 120 180 120 220 {lab=VSS}')
print('N -140 -30 -120 -30 {lab=VREF}')
print('N -220 -70 -220 100 {lab=VB}')
print('N -220 -70 -120 -70 {lab=VB}')
print('N 120 -130 120 -50 {lab=VDD}')
print('N -60 -130 120 -130 {lab=VDD}')
print('N 0 -50 80 -50 {lab=VA}')
print('N 120 100 120 120 {lab=VA}')
print('N 220 0 260 0 {lab=VLDO}')
print('N 60 100 120 100 {lab=VA}')
print('N 120 80 120 100 {lab=VA}')
print('N -220 100 -60 100 {lab=VB}')
iopin('p2','VREF',[-140,-30,0,1])
iopin('p4','VLDO',[260,0,0,0])
iopin('p1','VDD',[120,-130,0,0])
iopin('p3','VB',[-60,100,0,0])
iopin('p5','VSS',[120,220,0,0])
iopin('p8','VA',[60,100,0,1])
labpin('p9','VG',[40,-50,3,1])
labpin('p6','VSS',[220,120,0,1])
labpin('p7','VSS',[-60,10,0,1])
capa_nF('C1',Cldo_nF,[220,70,0,0])
res('R1',Rldo1_kOhm,[120,50,0,0])
res('R2',Rldo2_kOhm,[120,150,0,0])
pmos_sg13_lv_pmos('M1',wp_um,lp_um,nf,1,[100,-50,0,0])
comp('x1','opamp_01',[-60,-50,0,0])
