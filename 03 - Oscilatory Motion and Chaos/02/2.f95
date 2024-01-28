program main
  implicit none
  real*8 t(10000), x(10000)

end program main

function f(t,x)
  IMPLICIT NONE
  real :: f
  real :: t,x

  f = 3*t**2
end function

subroutine initialize(dt,n,t,x)
  real*8 t(1),x(1)
  t(1) = -1.00
  x(1) = -1.00
  t_sim = 1
  dt = 0.01
  n = t_sim/dt
end subroutine initialize

subroutine calc(dt,n,t,x)
  real*8 t(n),x(n)
  do i=1,n-1
    k1 = f(t(i)       , x(i))
    k2 = f(t(i) + dt/2, x(i) + dt*k1/2)
    k3 = f(t(i) + dt/2, x(i) + dt*k2/2)
    k4 = f(t(i) + dt  , x(i) + dt*k3)

    x(i+1) = x(i) + dt*(k1+k2*2 + k3*2 + k4)/6
    t(i+1) = t(i) + dt
  end do
end subroutine calc
