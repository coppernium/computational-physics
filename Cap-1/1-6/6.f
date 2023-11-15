        PROGRAM TEST
        IMPLICIT REAL*8 (a-h,l-z)

C       Constantes
        a = 10  ! Pessoas que nascem 
        b = 13  ! Pessoas que morrem
        N = 1000 ! Pop inicial
        t = 0
        dt = 0.0001
C       Abre arquivos
        OPEN(UNIT=1, FILE="data.dat")
C       Calc
        DO WHILE (t+dt .LT. 50)
          dN = a*N*dt - b*(N**2)*dt
          N = N + dN*dt
          t = t + dt
          write(1,7) t, N
7         FORMAT(F10.3, ", ", F10.3)
        END DO
C       Fecha arquivo
        close(1)
        END PROGRAM TEST
