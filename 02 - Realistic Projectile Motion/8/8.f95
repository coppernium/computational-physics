program main
real*8 posx(100000), posy(100000), temp(100000), grav(100000)

call init_variables(dt,B,n,posx,posy,temp,grav)
call calc_euler(dt,B,n,posx,posy,temp,grav)
call save_data(n,posx,posy,grav)
end program main

subroutine init_variables(dt,B,n,posx,posy,temp,grav)
  real*8 posx(1), posy(1), temp(1), grav(1)
  B = 0.00005 !B2/m
  t_simu = 300
  dt = 0.01
  n = t_simu/dt
  posx(1) = 0
  posy(1) = 0
  temp(1) = 0
  grav(1) = 9.806
end subroutine init_variables

subroutine calc_euler(dt,B,n,posx,posy,temp,grav)
  real*8 posx(n), posy(n), temp(n), velx(n), vely(n),grav(n)
  ! Variaveis para o calculo
  pi = acos(-1.00)
  velx(1) = 700*cos(pi/4)
  vely(1) = 700*sin(pi/4)
  do i=1,n-1
    open(unit=2, file="valores_g.txt")
    do j=1,7
      read(2,*) altura,glista
      if (posy(i) .GE. altura*1000) THEN
        g = glista
      end if
    end do
    ! Adiciona o valor da gravidade
    grav(i+1) = g
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

    ! Parar de calcular se y = 0
    if ((i .GT. 5) .AND. (posy(i+1) .LE. 0)) exit
    close(2)
  end do
end subroutine calc_euler

subroutine save_data(n,posx,posy,grav)
  real*8 posx(n), posy(n),grav(n)

  open(UNIT=1, FILE="dados.data")
  do i =1,n-1
    write(1,7) posx(i), posy(i), grav(i)
7   format(F10.3, ",", F10.3, ",", F10.3)
  ! Parar de calcular se y = 0
  if ((i .GT. 5) .AND. (posy(i+1) .LE. 0)) exit
  end do
  close(1)
end subroutine save_data
