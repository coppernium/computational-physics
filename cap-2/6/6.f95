            program main
                real*8 posx(10000), posy(10000), velx(10000), vely(10000), temp(10000)
                call ini_variables(n,dt,t,B2, m,g,velx,vely,posx,posy,temp)
                call calc_euler(n,dt, B2, m,g,velx, vely,posx,posy,temp)
                call save_data(n,velx,vely,posx,posy,temp)

            end program main

            subroutine ini_variables(n,dt,t,B2, m,g,velx,vely,posx,posy,temp)
                real*8 posx(1),posy(1), velx(1), vely(1), temp(1)
                t = 300
                dt = 0.1
                m = 30
                g = 9.81
                n = t/dt
                B2 = 0
                velx(1)=10
                vely(1)=40
                posx(1) = 0
                posy(1)= 0
                temp(1)=0
            end subroutine ini_variables

            subroutine calc_euler(n,dt, B2, m,g,velx, vely,posx,posy,temp)
                real*8 posx(n), posy(n), velx(n), vely(n), temp(n)
                do i=1,n-1
                    ! Cálculo do atrito
                    v = sqrt(velx(i)**2 + vely(i)**2)
                    fx = B2*v*velx(i)/m
                    fy = B2*v*vely(i)/m
                    ! Cálculo da posi e velocidade
                    posx(i+1)=posx(i) + velx(i)*dt
                    velx(i+1)=velx(i) - fx*dt/m
                    posy(i+1) = posy(i) +vely(i)*dt
                    vely(i+1) = vely(i) -g*dt/m - fy*dt/m
                    !marca o tempo
                    temp(i+1) = temp(i) + dt
                    !if (posy(i) +vely(i)*dt .LE. 0) exit
                end do
            end subroutine calc_euler

            subroutine save_data(n,velx,vely,posx,posy,temp)
                real*8 velx(n), vely(n), posx(n), posy(n), temp(n)
                open(unit=1,file="data1.data")
                do i =1,n-1
                    if ((i .GE. 20) .AND. (posy(i) .LE. 0)) exit
                    write(1,7) temp(i), velx(i), vely(i), posx(i), posy(i)
7                   format(F10.3,",",F10.3,",",F10.3,",",F10.3,",",F10.3)
                end do
            end subroutine save_data