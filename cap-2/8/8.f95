program main
real*8 posx(100000), posy(100000), temp(100000)
end program main

subroutine init_variables(dt,B,n,posx,posy,temp)
  real*8 posx(1), posy(1), temp(1)
  B = 0.0005 !B2/m
  t_simu = 300
  dt = 0.01
  n = t_simu/dt
  posx(1) = 0
  posy(1) = 0
  temp(1) = 0

end subroutine init_variables

subroutine calc_euler(dt,B,n,posx,posy,temp)
  real*8 posx(n), posy(n), temp(n), velx(n), vely(n)
  ! Variaveis para o calculo
  pi = acos(-1.00)
  velx(1) = 700*cos(pi/4)
  vely(1) = 700*sin(pi/4)
  do i=1,n-1

end subroutine calc_euler
