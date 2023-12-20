program main
  real*8 posx(100000), posy(100000), velx(100000), vely(100000)
  call initialize(dt,n,posx,posy)
  call calc_euler(dt,n,posx,posy)
  call save_data(n,posy,posx)
end program main

subroutine initialize(dt,n,posx,posy)
  real*8 posx(1), posy(1)
  dt = 0.01
  t_simu = 300
  n = t_simu/dt
  posx(1) = 0
  posy(1) = 0
end subroutine initialize

subroutine calc_euler(dt,n,posx,posy)
  real*8 posx(n), posy(n), velx(n), vely(n)
  g = 9.81
  pi = acos(-1.00)
  velx(1) = 53.2
  vely(1) = 53.2

  do i =1,n-1
    vel = sqrt(velx(i)**2 + vely(i)**2)
    B = 0.0039 + 0.0058/(1+exp((vel-35)/5))
    atr = - B*vel
    ! Calculo x
    velx(i+1) = velx(i) - atr*velx(i)*dt
    posx(i+1) = posx(i) + velx(i)*dt

    ! Calculo y
    vely(i+1) = vely(i) - atr*vely(i)*dt - g*dt
    posy(i+1) = posy(i) + vely(i)*dt

    ! Para o calculo
    if ((i .GT. 5) .AND. (posy(i) .LE. 0)) exit
  end do

end subroutine calc_euler

subroutine save_data(n,posy,posx)
  real*8 posy(n), posx(n)
  open(unit=1,file="dados1.data")
  do i = 1,n-1
    write(1,7) posx(i), posy(i)
7   format(F10.3,",", F10.3)
    if ((i .GT. 5) .AND. (posy(i+1) .LE. 0)) exit
  end do
  close(1)
end subroutine save_data
