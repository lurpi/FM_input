# -*- coding: utf-8 -*-
"""
Created on Thu Mar 26 09:52:34 2015

@author: Luca Urpi
"""


import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
plt.rcParams['pdf.fonttype'] = 42 # so text can be edited in Illustrator
plt.rcParams['ps.fonttype'] = 42 # so text can be edited in Illustrator
def out_arr( outfile,list):
 filename=outfile
 f = open(filename, 'w')
 print >> f, "\n".join(list)
 f.close()
 return;

def return_displ(folder,angle_dip): 
 dip=np.radians(angle_dip)
 r0=folder+"\\taskB-2D_time_ANCHOR_TOP.tec"
 r1=folder+"\\taskB-2D_time_ANCHOR_BOT.tec"

 column_hist0 = ("TIME","STRAIN_PLS","PRESSURE1","STRESS_XX","STRESS_YY","STRESS_ZZ","STRESS_XY","STRESS_XZ","STRESS_YZ","VELOCITY_X1","VELOCITY_Y1","VELOCITY_Z1","DISPLACEMENT_X1","DISPLACEMENT_Y1","DISPLACEMENT_Z1","p_(1st_Invariant)","q_(2nd_Invariant)","Effective_Strain")
 column_hist1 = ("TIME","STRAIN_PLS","PRESSURE1","STRESS_XX","STRESS_YY","STRESS_ZZ","STRESS_XY","STRESS_XZ","STRESS_YZ","VELOCITY_X1","VELOCITY_Y1","VELOCITY_Z1","DISPLACEMENT_X1","DISPLACEMENT_Y1","DISPLACEMENT_Z1","p_(1st_Invariant)","q_(2nd_Invariant)","Effective_Strain")

 p0 = pd.read_csv(r0, skiprows=2, header=0, names=column_hist0, delimiter=r"\s+")  
 p1 = pd.read_csv(r1, skiprows=2, header=0, names=column_hist1, delimiter=r"\s+")  

 X= p0["TIME"].values
 Dx1 = p0["DISPLACEMENT_X1"].values
 Dx2 = p1["DISPLACEMENT_X1"].values
 Dy1 = p0["DISPLACEMENT_Y1"].values
 Dy2 = p1["DISPLACEMENT_Y1"].values
 Dz1 = p0["DISPLACEMENT_Z1"].values
 Dz2 = p1["DISPLACEMENT_Z1"].values
 Dx=Dx1-Dx2
 Dy=Dy1-Dy2
 Dz=Dz1 -Dz2 
 Shear=-Dz*np.sin(dip)-Dy*np.cos(dip)
 Norm=Dz*np.cos(dip)-Dy*np.sin(dip)
 obs_point=[]
 txt="time dx dy dz"
 obs_point.append(txt)
 for jjj in range(len(X)):
   if X[jjj]<850.:
     txt0=str(X[jjj])
     txt1=str(Dx[jjj])
     #txt2=str(Dx2[jjj])
     txt3=str(Dy[jjj])
     #txt4=str(Dy2[jjj])
     txt5=str(Dz[jjj])
     #txt6=str(Dz2[jjj])
     txt=txt0+" "+txt1+" "+txt3+" "+txt5
     obs_point.append(txt)
 return X, Dx, Dy, Shear,Norm 
  
X1,Dx1,Dy1,Shear1,Norm1 = return_displ("microstruct_111_elastic-only",65)

X4,Dx4,Dy4,Shear4,Norm4 = return_displ("dilat0_noret",65)
# X4,Dx4,Dy4,Shear4,Norm4 = return_displ("microstruct_FM_dip65_dilation-20",65)

# X5,Dx5,Dy5,Shear5,Norm5 = return_displ("microstruct_FM_dip65_dilation-60",65)
# X6,Dx6,Dy6,Shear6,Norm6 = return_displ("microstruct_FM_dip65_dilation-90",65)
# X7,Dx7,Dy7,Shear7,Norm7 = return_displ("microstruct_FM_dip65_dilation-90_poisson0",65)
# #X5,Dx5,Dy5,Shear5,Norm5 = return_displ("microstruct_FM_dip-65",65)
 

fig, _axs = plt.subplots(nrows=1, ncols=2)
fig.subplots_adjust(hspace=0.03)
fig.subplots_adjust(wspace=0.33)
axs = _axs.flatten()

axs[0].plot(X1[0:-6], Shear1[0:-6]*1e6, 'k-', lw=2.5,label='dip 65 elastic (FM2)')
axs[1].plot(X1[0:-6], Norm1[0:-6]*1e6, 'k--', lw=2.5,label='dip 65 elastic (FM2)')

# axs[0].plot(X2[0:-6], Shear2[0:-6]*1e6, 'g-', lw=2.5,label='dip 65.0 dilation -90 NO return mapping')
# axs[1].plot(X2[0:-6], Norm2[0:-6]*1e6, 'g--', lw=2.5,label='dip 65.0 dilation -90 NO return mapping')

axs[0].plot(X4[0:-6], Shear4[0:-6]*1e6, 'c-', lw=2.5,label='dip 65.0 dilation 0 shear on joint')
axs[1].plot(X4[0:-6], Norm4[0:-6]*1e6, 'c--', lw=2.5,label='dip 65.0 dilation 0 shear on joint')

#axs[0].plot(X5[0:-6], Shear5[0:-6]*1e6, 'r-', lw=2.5,label='dip 65.0 dilation 0 dilat0_noret_prev-dGs-dfs')
#axs[1].plot(X5[0:-6], Norm5[0:-6]*1e6, 'r--', lw=2.5,label='dip 65.0 dilation 0 dilat0_noret_prev-dGs-dfs')# axs[0].plot(X6[0:-6], Shear6[0:-6]*1e6, 'c-', lw=2.5,label='dip 65.0 dilation -90')
# axs[1].plot(X6[0:-6], Norm6[0:-6]*1e6, 'c-*', lw=2.5,label='dip 65.0 dilation -90')

# axs[0].plot(X7[0:-6], Shear7[0:-6]*1e6, 'y-', lw=2.5,label='dip 65.0 dilation -90 poisson 0')
# axs[1].plot(X7[0:-6], Norm7[0:-6]*1e6, 'y--', lw=2.5,label='dip 65.0 dilation -90 poisson 0')




axs[0].set_title(" Shear displacement", fontsize=22)
axs[1].set_title(" Normal displacement", fontsize=22)

#ax1.plot(X, Dx1, 'ro',label='P receiver')
axs[1].set_xlabel('Time (s)', fontsize=28)
axs[0].set_xlabel('Time (s)', fontsize=28)
axs[0].set_ylabel('Displacement ($\mu$m)', fontsize=28)
axs[1].set_ylabel('Displacement ($\mu$m)', fontsize=28)
axs[0].tick_params(axis='y', labelsize=24)
axs[0].tick_params(axis='x', labelsize=24)
axs[1].tick_params(axis='y', labelsize=24)
axs[1].tick_params(axis='x', labelsize=24)
axs[0].set_xlim(0,600)
axs[1].set_xlim(0,600)
axs[0].set_ylim(0,950)
axs[1].set_ylim(0,950)
#ax2 = ax1.twinx()
#ax2.plot(X_st/86400, lake_level, 'k--', label='water level')
#ax2.set_ylabel('Lake level', fontsize=20)
plt.tight_layout()
axs[0].legend()
axs[1].legend()
axs[0].grid()
axs[1].grid()

plt.suptitle("FM2", fontsize=28)
plt.savefig("microstruct_displ-anchors.pdf",dpi=600)
plt.savefig("microstruct_displ-anchors.png",dpi=600)
plt.show()


