! Teste
        program main
        real*8 vel(100000), tempo(100000), altura(100000)
        call variaveis(n,dt,t,theta,P,tempo,vel,altura)
        call calculo(n,dt,theta,P,tempo,vel,altura)
        call dados(n,tempo,vel,altura)
        end program main

        subroutine variaveis(n,dt,t,theta,P,tempo,vel,altura)
        real*8 vel(1), tempo(1), altura(1)
        t = 300
        P = 400
        dt = 0.1
        n = t/dt
        pi = acos(-1.0)
        theta = pi/4
        altura(1) = 0
        tempo(1) = 0
        vel(1) = 4
        end subroutine variaveis

        subroutine calculo(n,dt,theta,P,tempo,vel,altura)
                real*8 vel(n), tempo(n), altura(n)
                do i =1,n-1
                        vel(i+1) = vel(i) + (P*dt)/(m*vel(i))- g*altura(i)/vel(i)
                        altura(i+1) = altura(i) + vel(i)*dt*sin(theta)
                        tempo(i+1) = tempo(i) + dt
                end do
        end subroutine

        subroutine dados(n,tempo,vel,altura)
                real*8 vel(n), tempo(n), altura(n)
                open(unit=1, file="dados1.data")
                        do i=1,n-1
                                write(1,7) tempo(i), vel(i), altura(i)
7                               format(F10.3, ",", F10.3, ",", F10.3)
                        end do
                close(1)
        end subroutine dados