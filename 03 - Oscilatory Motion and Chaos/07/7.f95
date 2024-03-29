program main
    parameter(idim=100000)
    real*8 x(idim), dx(idim), t(idim)
    ! x = theta
    call init(g,l,q,Fd,omgd,dt,n,x,dx,t)
    call calc(g,l,q,Fd,omgd,dt,n,x,dx,t)
    call save_data(n,x,dx,t)

    call execute_command_line('gnuplot -p ' // "plot.plt")
end program main


subroutine init(g,l,q,Fd,omgd,dt,n,x,dx,t)
    real*8 x(1), dx(1), t(1)
    
    dt = 0.01
    g = 9.81
    l = 1
    q = 0
    Fd = 2
    omgd = 1

    t_sim = 30
    n = t_sim/dt

    x(1) = 2
    dx(1) = 0
    t(1) = 0

end subroutine init

subroutine calc(g,l,q,Fd,omgd,dt,n,x,dx,t)
    real*8 x(n), dx(n), t(n)

    do i = 1,n-1
        dx(i+1) = dx(i) - g*dt*x(i)/l - q*dt*x(i) + Fd*sin(omgd*t(i))
        x(i+1) = x(i) + dx(i+1)
        t(i+1) = t(i) + dt
    end do
end subroutine calc

subroutine save_data(n,x,dx,t)
    real*8 x(n), dx(n), t(n)

    open(unit=1,file="dados1.data")
    do i =1,n-1
        write(1,7) t(i), x(i)
7       format(F10.3, ",", F10.3 )
    end do
    close(1)
end subroutine save_data
