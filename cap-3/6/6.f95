program main
    parameter(idim=100000)
    real*8 x(idim),dx(idim), t(idim)
    ! x é theta
    call init(l,g,q,dt,n,x,dx,t)
    call calc(l,g,q,dt,n,x,dx,t)
    call save_data(n,x,dx,t)
    call execute_command_line('gnuplot -p ' // "plot.plt")
end program main

subroutine init(l,g,q,dt,n,x,dx,t)
    real*8 x(1), t(1), dx(1), x0
    l = 1
    g = 9.81
    dt=0.01
    t_sim = 10
    n = t_sim/dt
    pi = acos(-1.00)

    write(*,*) "Adicione o valor de inicial de theta"
    read(*,*) x0
    write(*,*) "Adicione o valor de q"
    read(*,*) q
    x(1) = x0*pi/180
    dx(1) = 0
    t(1) = 0

end subroutine init

subroutine calc(l,g,q,dt,n,x,dx,t)
    real*8 x(n), dx(n), t(n)
    do i =1,n-1
        dx(i+1) = dx(i) - g*dt*x(i)/l - q*dt*dx(i)
        x(i+1) = x(i) + dx(i+1)*dt
        t(i+1) = t(i) + dt
    end do
end subroutine calc

subroutine save_data(n,x,dx,t)
    real*8 x(n), dx(n), t(n)
    open(unit=1,file="dados1.data")
    do i = 1,n-1
        write(1,7) t(i), x(i)
7       format(F10.3, ",", F10.3)
    end do
    close(1)
end subroutine save_data
