#!/usr/bin/python3

import sys
import numpy as np

# ****************************************************************
# Functions

def lskmod_model(Ls,Rs,f_sr,q_ind,f_center):
    # transistor parameters
    vth = 0.4 # V
    uncox = 170e-6 # A/V^2

    # lsk modulator modeling
    # initial values of Msw
    widthn = np.array([0.5e-6,1e-6,5e-6,10e-6,20e-6,50e-6]) # m
    lengthn = 0.13e-6 # m
    vgs = 1.2 # V
    Ron = 1/(uncox*(widthn/lengthn)*(vgs-vth))
    Rp_ind = Rs*(1+q_ind**2)
    Req = Rp_ind*Ron/(Rp_ind+Ron)

    # output W
    if Rp_ind>10e3:
        factor=100
    elif Rp_ind>5e3:
        factor=50
    else:
        factor=10

    widthn_val = np.interp(Rp_ind/factor,np.flip(Req),np.flip(widthn))
    
    return widthn_val

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

# ****************************************************************
# parsing arguments. These are strings.
#wn_um = float(sys.argv[1])
#cb_ff = float(sys.argv[2])

#Ls = float(sys.argv[1])
#Rs = float(sys.argv[2])
#f_sr = float(sys.argv[3])
#q_ind = float(sys.argv[4])
#f_center = float(sys.argv[5])


# inputs
# ****************************
Ls = 47e-9
Rs = 0.471
f_sr = 1870e6
q_ind = 289 #q_coil @ fosc
f_center = 433e6
# ****************************

a = lskmod_model(Ls,Rs,f_sr,q_ind,f_center)
wn_um = np.round(a*1e6,2)
nf = int(np.floor(wn_um/10) + 1)

# print schematic
print('v {xschem version=3.4.6 file_version=1.2}')
print('G {}')
print('K {}')
print('V {}')
print('S {}')
print('E {}')
print('N 40 0 80 0 {lab=D}')
print('N 0 -50 0 -30 {lab=VA}')
print('N 0 30 0 50 {lab=VB}')
print('N -80 -0 0 -0 {lab=VSS}')
iopin('p1','VA',[0,-50,0,0])
iopin('p2','VSS',[-80,0,0,1])
iopin('p3','D',[80,0,0,0])
iopin('p5','VB',[0,50,0,0])
nmos_sg13_lv_nmos('M1',wn_um,0.13,nf,1,[20,0,0,1])
