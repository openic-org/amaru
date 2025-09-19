#!/usr/bin/python3

import sys
import numpy as np

# ****************************************************************
# Functions

def capb_unit_model(Ls,Rs,f_sr,q_ind,f_center,n):
    # transistor parameters
    vth = 0.4 # V
    uncox = 170e-6 # A/V^2
    lambdan = 0.18 # 1/V
    cgs_w_l130nm = 1.19*1e-15/1e-6 # F/m
    cgd_w_l130nm = 0.65*1e-15/1e-6 # F/m
    cdb_w = 0.31*1e-15/1e-6 # F/m
    csb_w = 0.4*1e-15/1e-6 # F/m
    cov_w = 300/500*1e-15/1e-6 # F/m
    
    # cap bank modeling
    # ****************************************
    # initial values of Msw
    widthn = np.array([0.5e-6,1e-6,5e-6,10e-6,20e-6,50e-6]) # m
    lengthn = 0.13e-6 # m
    vgs = 1.2 # V

    cgs = cgs_w_l130nm*widthn
    cgd = cgd_w_l130nm*widthn
    cdb = cdb_w*widthn
    csb = csb_w*widthn
    cov = cov_w*widthn

    c1off = 2*(cdb + csb + 2*cov)/2
    c1on = 2*(cdb + csb + cgd + cgs)/2

    Ron = 1/(uncox*(widthn/lengthn)*(vgs-vth))
    Ron = 1.5*Ron

    # unit cap = cb
    pi_value = 3.14159

    c_par = 1/(Ls * (2*pi_value*f_sr)**2)
    Rp_ind = Rs*(1+q_ind**2)
    f_ul = 1.1*f_center
    f_step = (f_ul-f_center)/(2**(n-1))
    c_res = 1/((2*pi_value*f_center)**2 * Ls)
    cb = 2*(1/((2*pi_value*(f_center-f_step))**2 * Ls) - c_res)
    c_ext = 1/((2*pi_value*f_ul)**2 * Ls)

    Cs_cap = c1on * (1 + (2*pi_value*f_center*Ron*c1on)**2)/((2*pi_value*f_center*Ron*c1on)**2)
    Rs_cap = Ron / (1+(2*pi_value*f_center*Ron*c1on)**2)

    Rp_cap = 1/((Rs_cap)*(2*pi_value*f_center*cb)**2)
    Rp_cap_total = (2*Rp_cap)/(2**n - 1)

    # output W
    widthn_val = np.interp(Rp_ind/10,Rp_cap_total,widthn)
    
    return widthn_val, cb

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
Ls = float(sys.argv[1])
Rs = float(sys.argv[2])
f_sr = float(sys.argv[3])
q_ind = float(sys.argv[4])
f_center = float(sys.argv[5])
n = float(sys.argv[6])

[a,b] = capb_unit_model(Ls,Rs,f_sr,q_ind,f_center,n)
wn_um = np.round(a*1e6,2)
cb_fF = np.round(b*1e15,2)

nf = int(np.floor(wn_um/10) + 1)

# print schematic
print('v {xschem version=3.4.6 file_version=1.2}')
print('G {}')
print('K {}')
print('V {}')
print('S {}')
print('E {}')
print('N 0 0 180 -0 {lab=VSS}')
print('N 0 80 100 80 {lab=#net1}')
print('N 0 30 0 80 {lab=#net1}')
print('N 0 -80 100 -80 {lab=#net2}')
print('N -80 0 -40 0 {lab=B}')
print('N 0 80 -0 100 {lab=#net1}')
print('N 130 -80 180 -80 {lab=VSS}')
print('N 180 -0 180 80 {lab=VSS}')
print('N 130 80 180 80 {lab=VSS}')
print('N 130 -140 130 -120 {lab=B}')
print('N 130 120 130 140 {lab=B}')
print('N 0 -80 0 -30 {lab=#net2}')
print('N 0 -100 0 -80 {lab=#net2}')
print('N 180 -20 180 -0 {lab=VSS}')
print('N 180 -20 220 -20 {lab=VSS}')
print('N 180 -80 180 -20 {lab=VSS}')
print('N -0 -180 0 -160 {lab=VA}')
print('N -0 160 -0 180 {lab=VB}')
capa('C1',cb_fF,[0,-130,0,0])
capa('C2',cb_fF,[0,130,2,0])
iopin('p1','VA',[0,-180,0,0])
iopin('p2','VSS',[220,-20,0,0])
iopin('p3','B',[-80,0,0,1])
iopin('p5','VB',[0,180,0,0])
labpin('p4','B',[130,-140,0,1])
labpin('p6','B',[130,140,0,1])
nmos_sg13_lv_nmos('M1',wn_um,0.13,nf,1,[-20,0,0,0])
nmos_sg13_lv_nmos('M2',wn_um,0.13,nf,1,[130,100,3,0])
nmos_sg13_lv_nmos('M3',wn_um,0.13,nf,1,[130,-100,3,1])