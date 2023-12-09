        program bicicleta
            real*8 vel(1000), tempo(1000)
            call variaveis(m,P,dt,t,n,vel,tempo)
            call calculo(m,P,dt,n,vel,tempo)
            call dados(n,vel,tempo)
        
        end program bicicleta
        
        subroutine variaveis(m,P,dt,t,n,vel,tempo)
            real*8 vel(1), tempo(1)
            m = 80 !Kg
            P = 400 ! W
            dt = 0.01
            t = 300
            n = int(t/dt)
            vel(1) = 10 !m/s
            tempo(1) = 0
            return
        end subroutine variaveis

        subroutine calculo(m,P,dt,n,vel,tempo)
            real*8 vel(n), tempo(n)
            do i=1,n-1
                vel(i+1) = vel(i) + (P*dt)/(m*vel(i))
                tempo(i+1) = tempo(i) + dt
            end do
            return
        end subroutine calculo

        subroutine dados(n,vel,tempo)
            real*8 vel(n), tempo(n)
            open(unit=1,file="dados.dat")
            do i=1,n
                write(1,*) tempo(i), vel(i)
            end do 
            close(1)
        end subroutine dados