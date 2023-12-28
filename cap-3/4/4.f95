program name
    real*8 x(10000), dx(10000), temp(10000)

    call init(dt,n,a,k,x,dx,temp)
    call calc(dt,n,a,k,x,dx,temp)
    call save_data(n,x,dx,temp)
end program name

subroutine init(dt,n,a,k,x,dx,temp)
    real*8 x(1), dx(1), temp(1)
    dt = 0.01
    a = 3
    k = 1
    t_sim = 30
    n = t_sim/dt
    x(1) = 1
    dx(1) = 0
    temp(1) = 0
end subroutine init

subroutine calc(dt,n,a,k,x,dx,temp)
    real*8 x(n), dx(n), temp(n)
    
    do i = 1,n-1
        dx(i+1) = dx(i) -k*(x(i)**a)
        x(i+1) = x(i) + dt*dx(i+1)
        temp(i+1) = temp(i) + dt
    end do
end subroutine calc

subroutine save_data(n,x,dx,temp)
    real*8 x(n), dx(n), temp(n)
    open(unit=1,file="dados1.data")
    do i =1,n-1
        write(1,7) temp(i), x(i), dx(i)
7       format(F10.3, ",", F10.3, ",", F10.3)
    end do
    close(1)
end subroutine save_data