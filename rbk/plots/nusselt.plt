reset
#set fit errorvariables
#nu3(x) = nu3
#nu4(x) = nu4
#nu5(x) = nu5
#nu6(x) = nu6
#nu7(x) = nu7
#
#
#
#fit [0.2:5.0] nu3(x) 'nu_Ra_1e3.txt' via nu3
#fit [0.2:5.0] nu4(x) 'nu_Ra_1e4.txt' via nu4
#fit [0.2:5.0] nu5(x) 'nu_Ra_1e5.txt' via nu5
#fit [0.2:5.0] nu6(x) 'nu_Ra_1e6.txt' via nu6
#fit [0.2:5.0] nu7(x) 'nu_Ra_1e7.txt' via nu7
#
#set print 'nu_fit.dat' append
#
#print nu3, "\t", nu3_err
#print nu4, "\t", nu4_err
#print nu5, "\t", nu5_err
#print nu6, "\t", nu6_err
#print nu7, "\t", nu7_err


set term epslatex size 10cm, 6cm color

f(x) = m*x + b
set format x "$10^{%L}$"
set format y "$10^{%L}$"
set logscale
fit f(x) 'nu_fit.dat' index 2 u (log($1)):(log($2)) via m, b
set xtics 1,100,1e10

g(x) = exp(m*log(x) + b)

set xrange [1e2:1e10]
set arrow 1 from 3e6,9 to 1.10e8,9 lw 3.4 lc rgb 'gray' nohead
set arrow 2 from 1e8,9  to 1e8,23 lw 3.4 lc rgb 'gray'  nohead
set label 1 sprintf("%.3f",m) at 2e8,13
set xlabel 'Ra'
set ylabel 'Nu'

set output 'ra_vs_nu.tex'
plot    'nu_fit.dat' index 0 u 1:2:3 pt 7 ps 2 notitle ,\
        'nu_fit.dat' index 1 u 1:2:3 pt 6 ps 2 lc rgb 'red' notitle ,\
        g(x) lt 1 lw 3 lc rgb 'black' notitle
set output


!epstopdf ra_vs_nu.eps



