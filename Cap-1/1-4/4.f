        PROGRAM main
        IMPLICIT REAL*8 (a-h, l-z)
        a = 4
        call g(a,dados)
        write(*,*) dados 

        END PROGRAM main

        SUBROUTINE f(raio,volume)
        IMPLICIT REAL*8 (a-h, l-z)
        volume = raio**2 
        RETURN 
        END SUBROUTINE f

        SUBROUTINE g(x,res)
        IMPLICIT REAL*8 (a-h,l-z)
        res = sqrt(x) 
        RETURN
        END SUBROUTINE
