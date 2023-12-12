            program main
            real*8 vel(10000), tempo(10000)
            call variaveis(dt,t,n,m,F,P,vel,tempo)
            call calculo(dt,n,P,m,F,vel,tempo)
            call dados(n,vel,tempo)
            end program main

            subroutine variaveis(dt,t,n,m,F,P,vel,tempo)
                real*8 vel(1), tempo(1)
                m = 70
                P = 400
                dt = 0.1
                t = 300
                n = int(t/dt)
                F = 400/7
                vel(1) = 0
                tempo(1) = 0
            end subroutine variaveis

            subroutine calculo(dt,n,P,m,F,vel,tempo)
                real*8 vel(n), tempo(n)
                do i = 1,n-1
                    if (vel(i)*F .LT. P) then
                        vel(i+1)= vel(i) + F*dt/m
                    else
                        vel(i+1) = vel(i) + (P*dt)/(m*vel(i))
                    end if
                        tempo(i+1) = tempo(i) + dt
                end do
            end subroutine calculo

            subroutine dados(n,vel,tempo)
                real*8 vel(n), tempo(n)
                open(unit=1,file="dados1.data")
                do i = 1,n-1
                    write(1,7)  tempo(i), vel(i)
7                   format(F10.3,",", F10.3)
                end do
                close(1)
            end subroutine dados