program main 
    real*8 theta(100000), dtheta(100000), temp(100000)

    call init(dt,n,g,l,theta,dtheta,temp)
    call calc_euler(dt,n,g,l,theta,dtheta,temp)
    call save_data(n,theta,dtheta,temp)

    
end program main

subroutine init(dt,n,g,l,theta,dtheta,temp)
    real*8 theta(1), dtheta(1), temp(1)
    g = 9.81
    dt = 0.01
    t_sim = 30
    n = t_sim/dt
    l = 1
    pi = acos(-1.00)
    write(*,*) "Angulo inicial"
    read(*,*) theta0
    theta(1) = pi*theta0/180
    dtheta(1) = 0
    temp(1) = 0
end subroutine

subroutine calc_euler(dt,n,g,l,theta,dtheta,temp)
    real*8 theta(n), dtheta(n), temp(n)
    do i=1,n-1
        dtheta(i+1) = dtheta(i) - g*sin(theta(i))/l
        theta(i+1) = theta(i) + dtheta(i+1)*dt
        temp(i+1) = temp(i) + dt
    end do
end subroutine calc_euler

subroutine save_data(n,theta,dtheta,temp)
    real*8 theta(n), dtheta(n), temp(n)
    open(unit=1,file="dados1.data")
    do i =1,n-1
        write(1,7) temp(i), theta(i), dtheta(i)
7       format(F10.3,", ", F10.3)
    end do

    close(1)
end subroutine save_data