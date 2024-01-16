# plot.plt
set term x11 font "-*-helvetica-medium-r-*-*-14-*-*-*-*-*-*-*"
set title "Fortran Example"
# set terminal png size 1600,1200 font "Hevetica,30"
# set output "ImgData.png"
set nokey
set grid
set xlabel "x"
set ylabel "y"
m="dados1.data"
plot m using 1:2 with lines linecolor 2 linetype 7
