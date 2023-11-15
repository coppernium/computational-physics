        PROGRAM TEST
        IMPLICIT REAL*8 (a-h,o-z)
C       Variaveis
        v0 = 0
        dt = 0.00001
        g = 9.81
        t = 0
        z = 100 !100m
        z_a = z
        v = 0

C
        OPEN(UNIT=1, FILE="1.dat")
C
        DO WHILE (t .LE. 2)
        IF (z+v*dt .LE. 0) EXIT

        v = v - g*dt
        z = z + v*dt
        t = t + dt

C       z_a = z_a -g*(t**2)/2

C       Salva os resultados
        write(1,7) t, z
7       Format(F10.3, F10.3)

        END DO
C
        close(1)

        END PROGRAM TEST
