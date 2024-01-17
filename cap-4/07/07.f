        program main
            parameter(idim=10000)
	        implicit real*16 (a-h,o-z)  !todas as variáveis serão de dupla precisão
            real*16 x1(idim), y1(idim), x2(idim), y2(idim)
            real*16 t(idim)
            real*16 M

            call variaveis(dt, n, G, M, x1, y1, x2, y2, t)
            call calc(dt, n, G, M, x1, y1, x2, y2, t)
            call data_orbit(n,x1, y1, x2, y2, t)

        end program main


        subroutine variaveis(dt, n, G, M, x1, y1, x2, y2, t)
            parameter(idim=1)
	        implicit real*16 (a-h,o-z)  !todas as variáveis serão de dupla precisão
            real*16 x1(idim), y1(idim), x2(idim), y2(idim)
            real*16 t(idim)
            real*16 M

            M = 5.972d24
C           pode dar ruim por ser um numero mt pequeno
            G = 6.67d-8
            AU = 1.495d11
            yr = 365*3600
            dt = 0.001*yr
            t_sim = 10*yr
            n = t_sim/dt
            
            x1(1) = AU + 0.01*AU
            y1(1) = AU 
            x2(1) = AU
            y2(1) = AU
            t(1) = 0*yr


        end subroutine variaveis

        subroutine calc(dt, n, G, M, x1, y1, x2, y2, t)
	        implicit real*16 (a-h,o-z)  !todas as variáveis serão de dupla precisão
            real*16 x1(n), y1(n), x2(n), y2(n)
            real*16 vx1(n), vy1(n), vx2(n), vy2(n)
            real*16 t(n)
            real*16 M

            M1 = M
            M2 = M*1000000
            vx1(1) = 0
            vy1(1) = 0
            vx2(1) = 0
            vy2(1) = 0
 
            do i = 1,n
                r1 = sqrt(x1(i)**2 + y1(i)**2)
                r2 = sqrt(x2(i)**2 + y2(i)**2)

                vx1(i+1) = vx1(i) - dt*G*M2*x1(i)/r1**3
                x1(i+1) = x1(i) + dt*vx1(i+1)

                vy1(i+1) = vy1(i) - dt*G*M2*y1(i)/r1**3
                y1(i+1) = y1(i) + dt*vy1(i+1)

                vx2(i+1) = vx2(i) - dt*G*M1*x2(i)/r2**3
                x2(i+1) = x2(i) + dt*vx2(i+1)

                vy2(i+1) = vy2(i) - dt*G*M1*y2(i)/r2**3
                y2(i+1) = y2(i) + dt*vy2(i+1)




                t(i+1) = t(i) + dt
            end do

        end subroutine calc

        subroutine data_orbit(n,x1, y1, x2, y2, t)
	        implicit real*16 (a-h,o-z)  !todas as variáveis serão de dupla precisão
            real*16 x1(n), y1(n), x2(n), y2(n)
            real*16 t(n)

            open(unit=1, file="orbit.data")
            do i = 1,n
                write(1,7) t(i), x1(i), y1(i), x2(i), y2(i)
7               format(E10.3,",",E10.3,",",E10.3,",",E10.3,",",E10.3)
            end do
            close(1)

        end subroutine data_orbit
