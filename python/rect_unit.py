#!/usr/bin/python3

import sys
import numpy as np

# ****************************************************************
# Functions

def rect_unit_model(Ls,Rs,f_sr,q_ind,f_center,Vrect,Vrfpeak,Isys):
    # transistor parameters
    # L=0.13um - W>100um
    vthn = 0.4 # V
    uncox = 160e-6 # A/V^2
    lambdan = 0.16 # 1/V
    cgsn_w_l130nm = 1.19*1e-15/1e-6 # F/m
    cgdn_w_l130nm = 0.65*1e-15/1e-6 # F/m
    cdbn_w = 0.31*1e-15/1e-6 # F/m
    csbn_w = 0.4*1e-15/1e-6 # F/m
    covn_w = 300/500*1e-15/1e-6 # F/m

    vthp = 0.475 # V
    upcox = 49.79e-6 # A/V^2
    lambdap = 0.75 # 1/V
    cgsp_w_l130nm = 0.91*1e-15/1e-6 # F/m
    cgdp_w_l130nm = 0.52*1e-15/1e-6 # F/m
    cdbp_w = 0.28*1e-15/1e-6 # F/m
    csbp_w = 0.36*1e-15/1e-6 # F/m
    covp_w = 300/500*1e-15/1e-6 # F/m

    # rectifier modeling
    # ****************************************
    # initial values of Mn & Mp
    widthn = np.array([50e-6,100e-6,200e-6,500e-6,800e-6,1000e-6]) # m
    lengthn = 0.13e-6 # m
    # initial values of Mn
    widthp = np.array([50e-6,100e-6,200e-6,500e-6,800e-6,1000e-6]) # m
    lengthp = 0.13e-6 # m

    vgs = 0.5 # V

    cgsn = cgsn_w_l130nm*widthn
    cgdn = cgdn_w_l130nm*widthn
    cdbn = cdbn_w*widthn
    csbn = csbn_w*widthn
    covn = covn_w*widthn

    cgsp = cgsp_w_l130nm*widthn
    cgdp = cgdp_w_l130nm*widthn
    cdbp = cdbp_w*widthn
    csbp = csbp_w*widthn
    covp = covp_w*widthn

    #c1off = (cdb + csb + 2*cov)/2
    #c2off = c1off

    #c1on = (cdb + csb + cgd + cgs)/2
    #c2on = c1on

    Rnon = 1/(uncox*(widthn/lengthn)*(vgs-vthn))
    Rpon = 1/(upcox*(widthp/lengthp)*(vgs-vthp))

    # Specs
    pi_value = 3.14159

    c_par = 1/(Ls * (2*pi_value*f_sr)**2)
    Rp_ind = Rs*(1+q_ind**2)
    f_ul = 1.1*f_center
    c_res = 1/((2*pi_value*f_center)**2 * Ls)

    
    Cc = np.array([5e-12,10e-12,20e-12,50e-12,100e-12,200e-12]) # F
    Z_Cc = 1/(2*pi_value*f_center*Cc)

    vdropn = Isys*Rnon
    vdropp = Isys*Rpon
    vdropcc = Isys*Z_Cc

    vdrop_total_max = np.round(Vrfpeak-vthp,4)

    # Ripple
    vripple = 0.05*Vrect
    Cr = Isys / (2*f_center*vripple)

    # output W
    widthp_val = np.interp(vdrop_total_max,np.flip(vdropp),np.flip(widthp))
    # increase Wp by 10% to add Wn
    widthp_val = 1.1*widthp_val

    vdn=vdrop_total_max-np.interp(widthp_val,widthp,vdropp)
    widthn_val = np.interp(vdn,np.flip(vdropn),np.flip(widthn))

    # output Cc
    Cc_val = np.interp(vdrop_total_max*0.025,np.flip(vdropcc),np.flip(Cc))

    return widthn_val, widthp_val, Cc_val, Cr

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

def capa_pF(name,cap_pF,position):
    print('C {capa.sym} ' + str(position[0]) + ' ' + str(position[1]) + ' ' + str(position[2]) + ' ' + str(position[3]) + ' {name=' + name)
    print('m=1')
    print('value=' + str(cap_pF) + 'p')
    print('footprint=1206')
    print('device="ceramic capacitor"}')

# ****************************************************************
# parsing arguments. These are strings.
#wn_um = float(sys.argv[1])
#cc_ff = float(sys.argv[2])

#Ls = float(sys.argv[1])
#Rs = float(sys.argv[2])
#f_sr = float(sys.argv[3])
#q_ind = float(sys.argv[4])
#f_center = float(sys.argv[5])
#Vrect = float(sys.argv[6])
#Vrfpeak = float(sys.argv[7])
#Isys = float(sys.argv[8])

# Inputs
# ************************
Ls = 47e-9
Rs = 0.471
f_sr = 1870e6
q_ind = 289 #q_coil
f_center = 433e6
Vrect = 1.6
Vrfpeak = 0.5
Isys = 80e-6 # A
# ************************

[a,b,c,d] = rect_unit_model(Ls,Rs,f_sr,q_ind,f_center,Vrect,Vrfpeak,Isys)
wn_um = np.round(a*1e6,2)
wp_um = np.round(b*1e6,2)
cc_pF = np.round(c*1e12,2)
cr_pF = np.round(d*1e12,2)
nfwn = int(np.floor(wn_um/10) + 1)
nfwp = int(np.floor(wp_um/10) + 1)

# print schematic
print('v {xschem version=3.4.6 file_version=1.2}')
print('G {}')
print('K {}')
print('V {}')
print('S {}')
print('E {}')

print('N -80 0 -80 50 {lab=VL}')
print('N -140 0 -80 0 {lab=VL}')
print('N 80 0 80 50 {lab=VH}')
print('N -80 -50 -80 0 {lab=VL}')
print('N -20 -80 -20 50 {lab=#net1}')
print('N -80 -80 -20 -80 {lab=#net1}')
print('N -40 50 -20 50 {lab=#net1}')
print('N 20 -50 20 80 {lab=#net2}')
print('N 20 80 80 80 {lab=#net2}')
print('N -40 -50 20 -50 {lab=#net2}')
print('N 20 -50 40 -50 {lab=#net2}')
print('N -20 50 40 50 {lab=#net1}')
print('N 0 -80 80 -80 {lab=#net1}')
print('N 0 80 20 80 {lab=#net2}')
print('N 180 0 200 -0 {lab=VH}')
print('N 80 -50 80 0 {lab=VH}')
print('N -0 -220 0 -180 {lab=VA}')
print('N 0 180 0 220 {lab=VB}')
print('N 0 80 0 120 {lab=#net2}')
print('N -80 80 0 80 {lab=#net2}')
print('N 0 -120 0 -80 {lab=#net1}')
print('N -20 -80 0 -80 {lab=#net1}')
print('N 180 100 180 140 {lab=VSS}')
print('N 180 0 180 40 {lab=VH}')
print('N 80 0 180 0 {lab=VH}')


nmos_sg13_lv_nmos('M1',wn_um,0.13,nfwn,1,[-60,50,0,1])
nmos_sg13_lv_nmos('M2',wn_um,0.13,nfwn,1,[-60,-50,2,0])

pmos_sg13_lv_pmos('M3',wp_um,0.13,nfwp,1,[60,-50,0,0])
pmos_sg13_lv_pmos('M4',wp_um,0.13,nfwp,1,[60,50,2,1])

capa_pF('C1',cc_pF,[0,-150,0,0])
capa_pF('C2',cc_pF,[0,150,0,0])
capa_pF('C3',cr_pF,[180,70,0,0])

iopin('p2','VL',[-140,0,0,1])
iopin('p4','VH',[200,0,0,0])
iopin('p1','VA',[0,-220,0,0])
iopin('p3','VB',[0,220,0,0])
iopin('p5','VSS',[180,140,0,0])
