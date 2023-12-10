        program main
            real*8 vel(100000), tempo(100000)
            call variaveis(m,P,h,t,A,eta,C,rho,dt,n,vel,tempo)
            call calculo(m,P,h,A,eta,C,rho,dt,n,vel,tempo)
            call dados(n,vel,tempo)
        end program main

        subroutine variaveis(m,P,h,t,A,eta,C,rho,dt,n,vel,tempo)
            real*8 vel(i), tempo(1)
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
            vel(1) = 40
            tempo(1) = 0
            return
        end subroutine variaveis

        subroutine calculo(m,P,h,A,eta,C,rho,dt,n,vel,tempo)
            real*8 vel(n), tempo(n)
            do i=1,n
                vel(i+1) = vel(i) + (P*dt)/(m*vel(i)) - (C*rho*A*(vel(i)**2)*dt)/(2*m) - eta*A*vel(i)*dt/(h*m)
                tempo(i+1) = tempo(i) + dt
            end do
        end subroutine calculo

        subroutine dados(n,vel,tempo)
            real*8 vel(n), tempo(n)
            open(unit=1, file="dados1.dat")
            do i=1,n-1
                write(1,7) tempo(i), vel(i)
7               format(F10.3, ",", F10.3)
            end do
            close(1)
        end subroutine dados