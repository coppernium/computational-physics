program main
  real*8 posx(100000), posy(100000), posz(100000), temp(100000)
  call initialize(dt,n,posx,posy,posz,temp)
  call calc(dt,n,posx,posy,posz,temp)
  call data(n,posx,posy,posz,temp)
end program main

subroutine initialize(dt,n,posx,posy,posz,temp)
  real*8 posx(1), posy(1), posz(1),temp(1)
    dt = 0.01
    t_sim = 300
    n = t_sim/dt
    posx(1) = 0
    posy(1) = 0
    posz(1) = 0
    temp(1) = 0
end subroutine initialize

subroutine calc(dt,n,posx,posy,posz,temp)
  real*8 posx(n), posy(n), posz(n), velx(n), vely(n), velz(n), temp(n)
  ! Variaveis calculo
  g = 9.81
  theta = 35
  pi = acos(-1.00)
  velw = 4.470 ! na direção z
  velx(1) = 0
  vely(1) = 49.174*cos(pi*theta/180)
  velz(1) = 49.174*sin(pi*theta/180)

  ! Calculo
  do i=1,n-1
    ! variaveis variaveis
    velb = sqrt(velx(i)**2 + vely(i)**2 + velz(i)**2)
    B = 0.0039 + 0.0058/(1+exp((velb-35)/5))
    fat = -B*abs(velb-velw)

    ! direção x
    velx(i+1) = velx(i) + fat*(velx(i)-velw)*dt
    posx(i+1) = posx(i) + velx(i)*dt

    ! direção y
    vely(i+1) = vely(i) + fat*vely(i)*dt
    posy(i+1) = posy(i) + vely(i)*dt

    ! direção z
    velz(i+1) = velz(i) + fat*velz(i)*dt -g*dt
    posz(i+1) = posz(i) + velz(i)*dt

    ! tempo
    temp(i+1) = temp(i) + dt

    ! para a simulação se z =0
    if ((i .GT. 5) .and. (posz(i) .LE. 0)) exit

  end do
end subroutine calc

subroutine data(n,posx,posy,posz,temp)
  real*8 posx(n), posy(n), posz(n), temp(n)

  open(unit=1,file="vento_cruzado.data")
  do i=1,n-1
    write(1,7) temp(i),posx(i)
7   format(F10.3, ",", F10.3)
    if ((i .GT. 5) .AND. (posz(i+1) .LE. 0)) then
      write(*,*) posy(i)
      exit
    end if
  end do
  close(1)
end subroutine data
