reset
#unset logscale
#### Korrelation Geschwindigkeit tau bei verschiedenen Thermistoren ### 
#set term epslatex size 14cm, 8cm color 
#
#set xlabel '$\tau$~[\si{\second}]'
#set ylabel '$\left(\Ta_i \star \Ta_j\right)\left(\tau\right)$~[\si{\second\squared}]'
#
#set autoscale 
#set style line 1 lt 1 lw 3 pt 6 ps 2
#set xtics 10
#set mxtics 2
#set mytics 2
#set ytics 0.002
#set output 'v_correlation_12.tex'
#plot    'Geschwindigkeit_korrelation.dat' u 1:2 w lp pointinterval 10 pt 6 lt 1 lc rgb 'red' lw 3 ps 1.5 t '$\Ta _1 \star \Ta_2$' ,\
#        'Geschwindigkeit_korrelation.dat' u 1:3 w lp pointinterval 10 pt 6 lt 1 lc rgb 'blue' lw 3 ps 1.5 t '$\Ta _2 \star \Ta_3$' ,\
#        'Geschwindigkeit_korrelation.dat' u 1:4 w lp pointinterval 10 pt 6 lt 1 lc rgb 'green' lw 3 ps 1.5 t '$\Ta _3 \star \Ta_4$' ,\
#        'Geschwindigkeit_korrelation.dat' u 1:5 w lp pointinterval 10 pt 6 lt 1 lc rgb 'black' lw 3 ps 1.5 t '$\Ta _4 \star \Ta_5$' ,\
#        'Geschwindigkeit_korrelation.dat' u 1:6 w lp pointinterval 10 pt 6 lt 1 lc rgb 'violett' lw 3 ps 1.5 t '$\Ta _5 \star \Ta_6$' ,\
#        'v_corr_max.dat' index 0 pt 15 ps 2 lc rgb 'orange' t 'Maximum'
#
#set output


set term epslatex size 8cm, 6cm color 
set xlabel '$z$-Position~[\si{\centi\meter}]'
set ylabel 'Geschwindigkeit~[\si{\centi\meter\per\second}]'
set xtics 5
set ytics 0.2
set output 'vel_corr_therm.tex'
plot 'v_corr_max.dat' index 1 u (100*$2):(100*$1) pt 7 ps 2 notitle
set output


!epstopdf vel_corr_therm.eps
!epstopdf v_correlation_12.eps
