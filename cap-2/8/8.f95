program main
real*8 posx(100000), posy(100000), temp(100000)

call init_variables(dt,B,n,posx,posy,temp)
call calc_euler(dt,B,n,posx,posy,temp)
call save_data(n,posx,posy)
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
  g = 9.81
  do i=1,n-1
    ! Atrito
    Fat = -B*sqrt(velx(i)**2 + vely(i)**2)

    ! Calc x
    velx(i+1) = velx(i) + Fat*velx(i)*dt
    posx(i+1) = posx(i) + velx(i)*dt
    ! Calc y
    vely(i+1) = vely(i) + (-g + Fat*vely(i))*dt
    posy(i+1) = posy(i) + vely(i)*dt
    ! Atualiza o tempo
    temp(i+1) = temp(i) + dt
  end do
end subroutine calc_euler

subroutine save_data(n,posx,posy)
  real*8 posx(n), posy(n)

  open(UNIT=1, FILE="dados.data")
  do i =1,n-1
    write(1,7) posx(i), posy(i)
7   format(F10.3, ",", F10.3)
  end do
  close(1)
end subroutine save_data
