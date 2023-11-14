        PROGRAM A
        
        dt = 0.0001
        t = 0
        
        OPEN(UNIT=1, FILE="plot_func.dat")
        DO WHILE ( t .LE. 5)
                res = f(t)
                t = t +dt

                write(1,7) t, res
7       FORMAT(F10.3, F10.3)
        END DO
        CLOSE(1)
        END PROGRAM A

        FUNCTION f(x)
        g = 9.81
        f = -g*(x**2)/2
        END FUNCTION f
