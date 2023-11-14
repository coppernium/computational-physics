      PROGRAM TEST
      IMPLICIT REAL*8 (a-h,o-z)


      write(*,*) "Enter radii"
      read(*,*) rad1, rad2

      ! Calculo preciso :)
      call volume(rad1,vol1)
      call volume(rad2,vol2)
      result = abs(vol1-vol2)
C     Print dos resultados
      write(*,*) The difference is, result
      END PROGRAM TEST

      SUBROUTINE volume(rad,vol)
      IMPLICIT REAL*8 (a-h,o-z)
C     Variaveis
      pi = acos(-1.d0)

      vol = 4*pi*(rad**3)/3
      END SUBROUTINE volume
