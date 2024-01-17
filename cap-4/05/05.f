        program main
            parameter(idim=100000)
            real*8 x(idim), y(idim), K(idim), t(idim)
            real*8 L(idim), V(idim), E(idim)

            call init(dt,n,x,y,t)
            call calc(dt,n,x,y,t,K,L,V,E)
            call data_energy(dt,n,t,K,L,V,E)
            call data_pos(dt,n,x,y,t)
        end program main

        subroutine init(dt,n,x,y,t)
            real*8 x(1), y(1), t(1)
            AU = 1
            yr = 1
            dt = 0.001*yr
            t_sim = 10*yr
            n = int(t_sim/dt)

            x(1) = 1*AU
            y(1) = 0.00
            t(1) = 0.00

        end subroutine init

        subroutine calc(dt,n,x,y,t,K,L,V,E)
            real*8 K(n), L(n), V(n), E(n), t(n)
            real*8 x(n), y(n), vx(n), vy(n)

            pi = acos(-1.00)
            vx(1) = 0
            vy(1) = 5

            do i = 1,n
                r = sqrt(x(i)**2 + y(i)**2)

                vx(i+1) = vx(i) - dt*4*(pi**2)*x(i)/(r**3)
                x(i+1) = x(i) + dt*vx(i+1)

                vy(i+1) = vy(i) - dt*4*(pi**2)*y(i)/(r**3)
                y(i+1) = y(i) + dt*vy(i+1)

                vel = sqrt(vx(i+1)**2 + vy(i+1)**2)
                K(i) = 0.5*(vel**2)
                L(i) = r*vel
                V(i) = -0.5*x(i)/r**2 - 0.5*y(i)/r**2 + (L(i)**2)/r**2
                E(i) = K(i) + V(i)

               
               t(i+1) = t(i) + dt
            end do
        end subroutine calc

        subroutine data_energy(dt,n,t,K,L,V,E)
            real*8 K(n), L(n), V(n), E(n), t(n)

            open(unit=1, file="energy.data")
            do i = 1,n
                write(1,7) t(i), E(i)
7               format(F10.3, ",", F10.3)
            end do 
            close(1)
        end subroutine data_energy

        subroutine data_pos(dt,n,x,y,t)
            real*8 x(n), y(n), t(n)

            open(unit=2, file="orbit.data")
            do i = 1,n
                write(2,8) t(i), x(i), y(i)
8               format(F10.3, ",", F10.3, ",", F10.3)
            end do 
            close(2)
        end subroutine data_pos
