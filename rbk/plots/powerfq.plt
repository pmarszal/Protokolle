reset

set term epslatex size 11cm, 6cm color 

set xlabel 'Frequenz~[\si{\hertz}]'
set ylabel 'Häufigkeit'

set mxtics 2
set mytics 2
set xtics 50
set ytics 0.1

set output 'power_250.tex'
plot 'Power_errsearch250.dat' w lp pt 6 notitle
set output

!epstopdf power_250.eps
