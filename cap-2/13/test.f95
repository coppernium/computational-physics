program main
  real*8 posx(100000), posy(100000), velx(100000), vely(100000), temp(100000)
  ! Chama as subroutine
  call initialize(dt,n,posx,posy,velx,vely,temp)
  call calc(dt,n,posx,posy,velx,vely,temp)
  call dados(n,posx,posy,velx,vely)
end program main

subroutine initialize(dt,n,posx,posy,velx,vely,temp)
  real*8 posx(1), posy(1), velx(1), vely(1), temp(1)
  ! Variaveis
  t = 300
  dt = 0.01
  n = t/dt
  pi = acos(-1.00)
  posx(1) = 0
  posy(1) = 0
  velx(1) = 50*cos(0.61)
  vely(1) = 50*sin(0.61)
  temp(1) = 0
end subroutine initialize

subroutine calc(dt,n,posx,posy,velx,vely,temp)
  real*8 posx(n), posy(n), velx(n), vely(n), temp(n)
  ! Variaveis
  g = 9.81
  velw = 4.5
  ! Simulação

  do i =1,n-1
    vel = sqrt(velx(i)**2 + vely(i)**2)
    B = 0.0039 + 0.0058/(1+exp((vel-35)/5))
    fat = -B*abs(vel-velw)

    ! Calculo x
    velx(i+1) = velx(i) + (velx(i)-velw)*fat*dt
    posx(i+1) = posx(i) + velx(i)*dt

    ! Calculo y
    vely(i+1) = vely(i) + vely(i)*fat*dt -g*dt
    posy(i+1) = posy(i) + vely(i)*dt

    ! Temp
    temp(i+1) = temp(i) + dt

    ! para a simulação se y = 0
    if ((i .GT. 5) .AND. (posy(i) .LE. 0)) exit
  end do

end subroutine calc

subroutine dados(n,posx,posy,velx,vely)
  real*8 posx(n), posy(n), velx(n), vely(n)

  open(unit=1,file="dados_test.data")
  do i=1,n-1
    write(1,7) posx(i), posy(i)
7   format(F10.3, ",", F10.3)
    if ((i .GT. 5) .AND. (posy(i+1) .LE. 0)) exit
  end do
  close(1)
end subroutine dados
