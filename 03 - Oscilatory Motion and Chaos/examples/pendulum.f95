program main
  real*8 dtheta(1000000), theta(1000000), temp(1000000)
  call initialize(dt,n,g,l,dtheta,theta,temp)
  call calc_euler(dt,n,g,l,dtheta,theta,temp)
  call save_data(n,theta,temp)
end program main

subroutine initialize(dt,n,g,l,dtheta,theta,temp)
  real*8 dtheta(1), theta(1), temp(1)
  dt = 0.04
  g = 9.81
  l = 1
  t = 60
  n = t/dt
  pi = acos(-1.00)
  write(*,*) "Adicione o valor de theta0"
  read(*,*) theta0
  theta(1) = theta0*pi/180
  dtheta(1) = 0
  temp(1) = 0
end subroutine initialize

subroutine calc_euler(dt,n,g,l,dtheta,theta,temp)
  real*8 dtheta(n), theta(n), temp(n)

  do i =1,n-1
    dtheta(i+1) = dtheta(i) - g*theta(i)*dt/l
    theta(i+1) = theta(i) + dtheta(i+1)*dt
    temp(i+1) = temp(i) + dt
  end do
end subroutine calc_euler

subroutine save_data(n,theta,temp)
  real*8 theta(n), temp(n)
  open(unit=1,file="pendulum.data")
  do i =1,n-1
    write(1,7) temp(i), theta(i)
7   format(F10.3, ",", F10.3)
  end do
  close(1)
end subroutine save_data
