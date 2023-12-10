        program main
            real*8 vel(5000), tempo(5000)
            call variaveis(m,C,r,A,P,t,n,dt,vel,tempo)
            call calculo(m,C,r,A,P,n,dt,vel,tempo)
            call dados(n,vel,tempo)
        end program main

        subroutine variaveis(m,C,r,A,P,t,n,dt,vel,tempo)
        real*8 vel(1), tempo(1)
            m = 70
            C = 0.5
            A = 0.33
            r = 1.204
            P= 400*3
            t = 300
            dt = 0.1
            n = int(t/dt)
            vel(1) = 4
            tempo(1) =0
            return
        end subroutine variaveis

        subroutine calculo(m,C,r,A,P,n,dt,vel,tempo)
            real*8 vel(n), tempo(n)
            do i=1,n-1
                vel(i+1)= vel(i) + (P*dt)/(m*vel(i)) - (C*r*A*(vel(i)**2)*dt)/(2*m)
                tempo(i+1)=tempo(i) + dt
            end do
        end subroutine calculo

        subroutine dados(n,vel,tempo)
            real*8 vel(n), tempo(n)
            open(UNIT=1, FILE="dados3.dat")
                do i=1,n-1
                    write(1,7) tempo(i), vel(i)
7                   FORMAT(F10.3, ",", F10.3)
                end do
            close(1)
        end subroutine dados