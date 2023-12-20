program main
  open(unit=1, file="valores_g.txt")
  read(*,*) posy
  g = 0
  do i=1,7
    read(1,*) altura, glista
    if (posy .GE. altura*1000) then
      g= glista
    end if
  end do
  write(*,*) g
  close(1)

end program main
