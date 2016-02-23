reset
#unset logscale
#### Geschwindigkeitsprofil aus Simulation
#set term epslatex size 7cm, 6cm color 
#
#set xlabel '$z$-Position~[$L$]'
#set ylabel 'Geschwindigkeit~[$\kappa/L$]'
#
#set xrange [0:1]
##set autoscale y
#
#set xtics 0.5
#set mxtics 2
#set mytics 2
#
#set ytics 0.0001 
#set output 'v_prof_Ra_1e3.tex'
#plot 'mittel_vprof_Ra_1e3.txt' w lp pointinterval 4 pt 6 lw 2 notitle
#set output
#
#set ytics 5 
#set output 'v_prof_Ra_1e4.tex'
#plot 'mittel_vprof_Ra_1e4.txt' w lp pointinterval 4 pt 6 lw 2 notitle
#set output
#
#set ytics 20
#set output 'v_prof_Ra_1e5.tex'
#plot 'mittel_vprof_Ra_1e5.txt' w lp pointinterval 4 pt 6 lw 2 notitle
#set output
#
#set ytics 100
#set output 'v_prof_Ra_1e6.tex'
#plot 'mittel_vprof_Ra_1e6.txt' w lp pointinterval 4 pt 6 lw 2 notitle
#set output
#
#set ytics 400
#set output 'v_prof_Ra_1e7.tex'
#plot 'mittel_vprof_Ra_1e7.txt' w lp pointinterval 4 pt 6 lw 2 notitle
#set output

### Abbruchfrequenz fc ###
#set term epslatex size 10cm, 6cm color 
#
#set xlabel 'Frequenz~[\si{\hertz}]'
#set ylabel 'Häufigkeit'
#set label '$f_c$' at 0.50,1
#set logscale
#set format x "$10^{%L}$"
#set format y "$10^{%L}$"
#set output 'power_0000.tex'
#set arrow from 0.43,graph(0,0) to 0.43,graph(1,1) nohead
#plot 'Power_0000_2048.dat' every 2 w l lw 3 notitle 
#set output
#
#unset arrow 
#unset label
#unset logscale


## Profil der Abbruchfrequenz ###
set term epslatex size 14cm, 8cm color 
f(x) = m*x + b
fit [0:1] f(x) 'profile.dat' u 1:4:5 via m,b
set output 'v_prof_fc.tex'

set multiplot
set size 1,1
set origin 0,0

set xrange [0:12]
set yrange [0:1]

set xtics 3
set ytics 0.2

set mxtics 2
set mytics 2

set xlabel 'Abstand von der Heizplatte~[\si{\centi\meter}]'
set ylabel '$f_c~[\si{\hertz}]$'
set xrange [-0.5:12]

plot 'profile.dat' u 1:4:5 w yerrorbars pt 7 notitle, f(x) ls 1 lw 3 lc rgb 'black' notitle

set size 0.5,0.5
set origin 0.45,0.45
set xtics 0.5
set ytics 0.5

set xrange [-0.1:1.04]
set yrange [0.4:1]
unset ylabel
unset xlabel
plot 'profile.dat' u 1:4:5 w yerrorbars pt 7 notitle,\
       f(x) lc rgb 'black' lt 1 lw 3 notitle 

unset multiplot 
set output


!epstopdf v_prof_Ra_1e3.eps
!epstopdf v_prof_Ra_1e4.eps
!epstopdf v_prof_Ra_1e5.eps
!epstopdf v_prof_Ra_1e6.eps
!epstopdf v_prof_Ra_1e7.eps
!epstopdf power_0000.eps
!epstopdf v_prof_fc.eps
