program main
  real*8 theta(100000), dtheta(100000), temp(100000), E(100000)

  call initialize(dt,n,m,l,g,theta,dtheta,temp,E)
  call calc(dt,n,m,l,g,theta,dtheta,temp,E)
  call save_data(n,theta,temp,E)
end program main

subroutine initialize(dt,n,m,l,g,theta,dtheta,temp,E)
  real*8 theta(1), dtheta(1), temp(1), E(1)
  t = 60
  dt = 0.01
  n = t/dt
  m = 1
  l = 1
  g = 9.81
  pi = acos(-1.00)

  write(*,*) "Valor de theta inicial"
  read(*,*) theta0

  E(1) = 0
  theta(1) = theta0*pi/180
  dtheta(1) = 0
  temp(1) = 0
end subroutine initialize

subroutine calc(dt,n,m,l,g,theta,dtheta,temp,E)
  real*8 theta(n), dtheta(n), temp(n), E(n)
  do i=1,n-1
    dtheta(i+1) = dtheta(i) - g*theta(i)*dt/l
    theta(i+1) = theta(i) + dtheta(i+1)*dt

    E(i+1) = E(i) + m*g*l*(dtheta(i)**2 + g*(theta(i)**2)/l)*(dt**2)/2
    temp(i+1) = temp(i) + dt
  end do

end subroutine calc

subroutine save_data(n,theta,temp,E)
  real*8 theta(n), temp(n), E(n)
  open(unit=1, file="dados1.data")
  do i =1,n-1
    write(1,7) temp(i), theta(i), E(i)
7   format(F10.3, ",", F10.3,","F10.3)
  end do
  close(1)
end subroutine save_data
