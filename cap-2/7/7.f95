        program main
        real*8 posx(10000), posy(10000), temp(10000)

        end program main

        subroutine init_var(dt,t,n,B2,g,m,posx,posy,temp)
                real*8 posx(1), posy(1), temp(1)
                m = 70
                dt = 0.1
                t = 300
                B2 = 0.5
                n=t/dt
                g = 9.81
                temp(1)=0
                posx(1)=0
                posy(1)=0

        end subroutine init_var

        subroutine calc_euler(dt,n,B2,g,m,posx,posy,temp)
                real*8 posx(n),posy(n),velx(n),vely(n),temp(n)
                velx(1)=0
                vely(1)=0
                ! Constantes nas contas
                a = 6.5*(10**(-3))
                alpha = 2.5
                T0 = 300
                do i=1,n-1
                        v = sqrt(velx(i)**2 + vely(i)**2)
                        Fd = B2*v*(1-a*posy(i)/T0)**(alpha)
                        ! Calculo da velocidade e posição x
                        posx(i+1) = posx(i) + velx(i)*dt
                        velx(i+1) = velx(i) - Fd*velx(i)/m
                        ! Calculo da velocidade e posição x
                        posy(i+1) = posy(i) + vely(i)*dt
                        vely(i+1) = vely(i) - Fd*vely(i)/m
                        ! Atualiza o tempo
                        temp(i+1) = temp(i) + dt
                end do
        end subroutine calc_euler

