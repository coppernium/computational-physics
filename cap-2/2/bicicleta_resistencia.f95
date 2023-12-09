        program main
            real*8 vel(5000), tempo(5000)
            call variaveis(m,C,r,A,P,t,n,dt,vel,tempo)
            write(*,*) n
        end program main

        subroutine variaveis(m,C,r,A,P,t,n,dt,vel,tempo)
        real*8 vel(1), tempo(1)
            m = 70
            C = 0.5
            A = 0.33
            r = 1.14
            P= 400
            t = 300
            dt = 0.1
            n = int(t/dt)
            vel(1) = 4
            tempo(1) =0
            return
        end subroutine variaveis