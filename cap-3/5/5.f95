program main
    parameter(idim=1000)
    real*8 x(idim), y(idim)
    call init(x,y)
    call calc(x,y)
    call save_data(x,y)
    call execute_command_line('gnuplot -p ' // "plot.plt")
end program main

function f(x)
    real*8 x
    f = x**2
end function f

subroutine init(x,y)
    real*8 x(1), y(1)
    x(1) = 0
    y(1) = 0
end subroutine

subroutine calc(x,y)
    parameter(idim=1000)
    real*8 x(idim), y(idim), val
    do i=1,idim-1
        val = i*0.01
        x(i+1) = val
        y(i+1) = f(val)
    end do
end subroutine calc

subroutine save_data(x,y)
    parameter(idim=1000)
    real*8 x(idim), y(idim)
    open(UNIT=1,FILE="dados.data")
    do i =1,idim-1
        write(1,7) x(i), y(i)
7       format(F10.3,",",F20.6)
    end do
    close(1)
end subroutine save_data
