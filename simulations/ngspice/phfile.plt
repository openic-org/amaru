set encoding utf8
set termoption noenhanced
set title "** sch_path: /home/designer/shared/amaru/analog/tb/tb_ldo_01_stb.sch"
set xlabel "Hz"
set grid
set logscale x
set xrange [1e+00:1e+11]
set mxtics 10
set grid mxtics
unset logscale y 
set yrange [-9.503708e+01:1.915766e+02]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'phfile.data' using 1:2 with lines lw 1 title "180*cph(ttian)/pi"
