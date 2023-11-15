        PROGRAM main
        IMPLICIT REAL*8 (a-h, o-z)

        v = 40 !m/s
        x = 0
        t = 0
        dt = 0.5

C       Abre arquivo
        OPEN(UNIT=1, FILE="res.dat")
        DO WHILE (t .LT. 10)
                x = x + v*dt
                t = t + dt
                x_a = f(t)
                write(1,7) t, x, x_a
7               FORMAT(F10.3, ", ", F10.3, ", ", F10.3)
        END DO
C       Fecha arquivo
        close(1)
        END PROGRAM main

        FUNCTION f(x)
        IMPLICIT REAL*8 (a-h, o-z)
        f = x*40
        RETURN
        END FUNCTION f

