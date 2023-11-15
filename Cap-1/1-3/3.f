        PROGRAM PARAQUEDISTA
        IMPLICIT REAL*8 (a-h, o-z)

c       Constantes
        t = 0
        dt = 0.01
        a = 10
        b = -1
        v = 0

C       Abre arquivo
        OPEN(UNIT=1,FILE="data.dat")
C       Cálculo Método de Euler
        DO WHILE ( t+dt .LT. 30)
                da = a - b*v 
                v = v + da*dt
                t = t + dt
                write(1,7) t,v
7               FORMAT(F10.3,", ", F10.3)
        END DO

C       Fecha arquivo
        close(1)
        END PROGRAM PARAQUEDISTA
