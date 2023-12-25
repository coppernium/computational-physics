program main
  real*8 posx(100000), posy(100000), posz(100000)

  call initialize(dt,n,S,posx,posy,posz)
  call calc_euler(dt,n,S,posx,posy,posz)
  call dados(n,posx,posy,posz)
end program main

subroutine initialize(dt,n,S,posx,posy,posz)
  real*8 posx(1), posy(1), posz(1)
  t_sim = 300
  dt = 0.01
  n=t_sim/dt
  S = 0.00041
  posx(1)=0
  posy(1)=0
  posz(1)=0
end subroutine initialize

subroutine calc_euler(dt,n,S,posx,posy,posz)
  real*8 posx(n), posy(n), posz(n), velx(n), vely(n), velz(n)
  ! Váriaveis para o cálculo
  g = 9.81
  pi = acos(-1.00)
  velx(1) = 31.29
  vely(1) = 0
  velz(1) = 0
  w = 188.495

  do i=1,n-1
    ! Variaveis variaveis
    velt = sqrt(velx(i)**2 + vely(i)**2 + velz(i)**2)
    B = 0.0039 + 0.0058/(1+exp((velt-35)/5))
    !B = 0.00004
    fat = -B*velt
    ! Calculo em x
    velx(i+1) = velx(i) + fat*velx(i)*dt
    posx(i+1) = posx(i) + velx(i)*dt

    ! Calculo em y
    vely(i+1) = vely(i) - g*dt
    posy(i+1) = posy(i) + vely(i)*dt

    ! Calculo em z
    velz(i+1) = velz(i) + S*velx(i)*w*dt
    posz(i+1) = posz(i) + velz(i)*dt

    ! Para ao chegar em x = 120 [m]
    if ((i .GT. 5) .AND. (abs(posx(i)) .GT. 120)) exit
  end do
end subroutine calc_euler

subroutine dados(n,posx,posy,posz)
  real*8 posx(n), posy(n), posz(n)
  open(UNIT=1, file="dados1.data")
  do i=1,n-1
    write(1,7) posx(i), posz(i)
7   format(F10.3, ",", F10.3)
    if ((i .GT. 5) .AND. (abs(posx(i+1)) .GT. 120)) exit

  end do
  close(1)
end subroutine dados
