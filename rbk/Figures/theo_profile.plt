reset
set term epslatex color size 8cm, 6cm
unset key
unset xtics
unset ytics
set xlabel '$T$'
set ylabel '$L$'

set xrange [0:1]
set yrange [0:1]

f(x) = -(atan(40*(x-0.5))-1.5)/3
g(x) = -x +1 
set output 'temp_profile.tex'

plot    f(x) ls 1 lw 3 lc rgb 'black' t 'high Ra'  ,\
        g(x) ls 2 lw 3 lc rgb 'black' t 'low Ra'

set output

set xlabel '$L$'
set ylabel '$v$'
f(x) = -((x/a +b)**2 +c)*d

a=1
b=-0.25
c=-b**2
d=-8

unset xtics
unset ytics
set xrange [0.012:3.33]
set yrange [-5:0.6]

set output 'vel_profile.tex'
plot -f(x-0.6) ls 1 lw 3 lc rgb 'black' t 'high Ra', -f(x-2.25) ls 1 lw 3 lc rgb 'black' notitle ,\
-5 ls 2 lw 3 lc rgb 'black' notitle

set output




!epstopdf temp_profile.eps
!epstopdf vel_profile.eps
