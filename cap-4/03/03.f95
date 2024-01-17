program main
    parameter(idim=10000)
    real*8 x(idim), y(idim), t(idim)

    call init(dt,n,x,y,t)
    call calc(dt,n,x,y,t)
    call sdata(dt,n,x,y,t)

    call execute_command_line('python3 ' // "plot-03.py")
end program main

subroutine init(dt,n,x,y,t)
    real*8 x(1), y(1), t(1)
    AU = 1
    yr = 1
    dt = 0.01*yr
    t_sim = 10*yr
    n = int(t_sim/dt)

    x(1) = 1*AU
    y(1) = 0*AU
    t(1) = 0*yr
end subroutine init

subroutine calc(dt,n,x,y,t)
    real*8 x(n), y(n), t(n), vx(n), vy(n)
    pi = acos(-1.00)

    vx(1) = 0
    vy(1) = 2*pi
    do i =1,n
        r = sqrt(x(i)**2 + y(i)**2)

        vx(i+1) = vx(i) - dt*4*(pi**2)*x(i)/(r**3)
        x(i+1) = x(i) + vx(i+1)*dt

        vy(i+1) = vy(i) - dt*4*(pi**2)*y(i)/(r**3)
        y(i+1) = y(i) + vy(i+1)*dt

        t(i+1) = t(i) + dt
    end do
end subroutine calc

subroutine sdata(dt,n,x,y,t)
    real*8 x(n), y(n), t(n)

    open(unit=1, file="dados.data")
    do i = 1,n
        write(1,7) t(i), x(i), y(i)
7       format(E10.3, ",", E10.3, ",", E10.3)
    end do
    close(1)
end subroutine sdata
