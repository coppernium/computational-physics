        program main
            real*8 vel(100000), tempo(100000), fat1(100000), fat2(100000)
            call variaveis(m,P,h,t,A,eta,C,rho,dt,n,vel,tempo,fat1,fat2)
            call calculo(m,P,h,A,eta,C,rho,dt,n,vel,tempo,fat1,fat2)
            call dados(n, vel, fat1, fat2)
        end program main

        subroutine variaveis(m,P,h,t,A,eta,C,rho,dt,n,vel,tempo,fat1,fat2)
            real*8 vel(1), tempo(1), fat1(1), fat2(1)
            eta = 2*10**(-5)
            A = 0.33
            P = 400
            m = 70
            h = 1
            C = 0.5
            rho = 1.20
            dt = 0.1
            t = 300
            n = int(t/dt)
            vel(1) = 4
            tempo(1) = 0
            fat1(1) = 0
            fat2(1) = 0
            return
        end subroutine variaveis

        subroutine calculo(m,P,h,A,eta,C,rho,dt,n,vel,tempo,fat1,fat2)
            real*8 vel(n), tempo(n), fat1(n), fat2(n)
            do i=1,n-1
                vel(i+1) = vel(i) + (P*dt)/(m*vel(i)) - (C*rho*A*(vel(i)**2)*dt)/(2*m) - eta*A*vel(i)*dt/(h*m)
                fat1(i+1) = fat1(i) + (C*rho*A*(vel(i)**2)*dt)/(2*m)
                fat2(i+1) =fat2(i) + eta*A*vel(i)*dt/(h*m)
                tempo(i+1) = tempo(i) + dt
            end do
        end subroutine calculo

        subroutine dados(n, vel, fat1, fat2)
            real*8 vel(n), fat1(n), fat2(n)
            open(unit=1, file="atrito_comp.dat")
            do i=1,n-1
                write(1,7) vel(i), fat1(i), fat2(i)
7               format(F10.3, ",", F10.3, ",", F10.3)
            end do
            close(1)
        end subroutine dados