#!/usr/bin/python3

import sys

# ****************************************************************
# Functions
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


# ****************************************************************
# parsing arguments. These are strings.
wn_um = float(sys.argv[1])
wp_um = float(sys.argv[2])

# print schematic
print('v {xschem version=3.4.6 file_version=1.2}')
print('G {}')
print('K {}')
print('V {}')
print('S {}')
print('E {}')
print('N -40 0 -40 50 {lab=A}')
print('N -60 0 -40 0 {lab=A}')
print('N -40 -50 -40 0 {lab=A}')
print('N 0 0 0 20 {lab=xxx}')
print('N 0 0 70 0 {lab=xxx}')
print('N 0 -20 0 0 {lab=xxx}')
print('N 0 -100 0 -50 {lab=VDD}')
print('N -0 50 -0 100 {lab=VSS}')
nmos_sg13_lv_nmos('M1',wn_um,0.13,1,1,[-20,50,0,0])
pmos_sg13_lv_pmos('M2',wp_um,0.13,1,1,[-20,-50,0,0])
iopin('p1','VDD',[0,-100,0,0])
iopin('p2','VSS',[0,100,0,0])
iopin('p3','A',[-60,0,0,1])
iopin('p4','Z',[70,0,0,0])

