program main
  real*8 posx(100000), posy(100000)
  call initialize(dt,n,B,posx,posy)
  call calc_euler(dt,n,B,posx,posy)
  call save_data(n,posx,posy)
end program main

subroutine initialize(dt,n,B,posx,posy)
  real*8 posx(1), posy(1)
    dt = 0.1
    B = 4/100000
    t_simu = 300
    n = t_simu/dt
    posx(1) = 0
    posy(1) = 0
end subroutine initialize

subroutine calc_euler(dt,n,B,posx,posy)
  real*8 posx(n), posy(n), velx(n), vely(n), atr
  ! Variaveis
  pi = acos(-1.00)
  velx(1)=700*cos(pi/4)
  vely(1)=700*sin(pi/4)
  !
  ! Simulação
  do i=1,n-1
    open(unit=9,file="valores_g.txt")

    do j=1,7
      read(9,*) altura, glista
      if (posy(i) .GE. altura*1000) then
        g = glista
      end if
    end do
    ! Atrito
    den = (1 - ((6.5/1000)*posy(i)/300))**(2.5)
    atr = -B*den*sqrt(velx(i)**2 + vely(i)**2)

    ! Calculo de x
    velx(i+1) = velx(i) + atr*velx(i)*dt
    posx(i+1) = posx(i) + velx(i)*dt
    !Calculo de y
    vely(i+1) = vely(i) + atr*vely(i)*dt - g*dt
    posy(i+1) = posy(i) + vely(i)*dt
    ! Para quando y(i) =0
    if ((i .GT. 5) .AND. (posy(i+1) .LE. 0)) exit
    close(9)

  end do
end subroutine calc_euler

subroutine save_data(n,posx,posy)
  real*8 posx(n), posy(n)
  open(unit=1,file="dados1.data")
  do i = 1,n-1
    write(1,7) posx(i), posy(i)
7   format(F10.3, ",", F10.3)
  if ((i .GT. 5) .AND. (posy(i+1) .LE. 0)) exit
  end do
  close(1)
end subroutine save_data
