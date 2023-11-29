        PROGRAM BICICLETA
                REAL*8 velocidade(100000), tempo(1000000)
                call inicia_variaveis(g,dt,n,velocidade,tempo)
                call calculo(g,dt,n,velocidade,tempo)
                call salvar(velocidade,tempo,n)
        END PROGRAM BICICLETA

        SUBROUTINE inicia_variaveis(g,dt,n,vel,temp)
                REAL*8 vel(1),temp(1)
                dt = 0.1
                g = 9.81
                tempo = 300
                n = int(tempo/dt)

                vel(1) = 10
                temp(1) = 0
        END SUBROUTINE inicia_variaveis

        SUBROUTINE calculo(g,dt,n,vel,temp)
                REAL*8 vel(n), temp(n)

                DO i=1,n
                        temp(i+1) = temp(i) + dt
                        vel(i+1) = vel(i) + g*dt
                END DO
        END SUBROUTINE calculo

        SUBROUTINE salvar(vel,temp,n)
                REAL*8 vel(n), temp(n)

                OPEN(UNIT=1, FILE="tempo.dat")
                DO i=1,n
                        write(1,7) temp(i), vel(i)
7                       FORMAT(F10.3, ", ", F10.3)
                END DO
                CLOSE(1)
        END SUBROUTINE salvar