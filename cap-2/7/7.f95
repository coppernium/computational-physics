        program main
        real*8 posx(50000), posy(50000), temp(50000)
        call init_var(dt,t,n,B,posx,posy,temp)
        call calc_euler(dt,n,B,posx,posy,temp)
        call save_data(n,posx,posy)

        end program main

        subroutine init_var(dt,t,n,B,posx,posy,temp)
                real*8 posx(1), posy(1), temp(1)
                ! Variaveis globais
                dt = 0.1
                t = 300
                B = 0.06 !B2/m
                n=t/dt
                temp(1)=0
                posx(1)=0
                posy(1)=0

        end subroutine init_var

        subroutine calc_euler(dt,n,B,posx,posy,temp)
                real*8 posx(n),posy(n),velx(n),vely(n),temp(n)

                ! Constantes nas contas
                a = 6.5*(10**(-3))
                alpha = 2.5
                T0 = 300
                velx(1)=700*cos(pi/4)
                vely(1)=700*sin(pi/4)
                pi=acos(-1.00)
                g = 9.81

                ! Roda a simulação
                do i=1,n-1
                        v = sqrt(velx(i)**2 + vely(i)**2)
                        !Fd = B*v*(1-a*posy(i)/T0)**(alpha)
                        Fd = B*v


                        ! Calculo da velocidade e posição x
                        posx(i+1) = posx(i) + velx(i)*dt
                        velx(i+1) = velx(i) - B*v*velx(i)*dt

                        ! Calculo da velocidade e posição x
                        posy(i+1) = posy(i) + vely(i)*dt
                        vely(i+1) = vely(i) -g*dt -B*v*vely(i)*dt

                        ! Atualiza o tempo
                        temp(i+1) = temp(i) + dt
                        if (((i .GT. 10)).and. (posy(i+1)) .LE. 0) exit

                end do
        end subroutine calc_euler

        subroutine save_data(n,posx,posy)
                real*8 posx(n),posy(n)
                open(unit=1,file="data1.data")
                do i =1,n-1
                        write(1,7) posx(i), posy(i)
7                       format(F10.3,",",F10.3)
                        if (((i .GT. 10)).and. (posy(i+1)) .LE. 0) exit
                end do
        end subroutine save_data