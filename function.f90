program myfunc !how to write and use functions(similar to subroutines) in a fortran code
!implicit none
!	use globals
!	real(kind = 8) :: z !,x
!	real(kind = 8),parameter :: n = 10
!	real :: myfunc
	
!	integer :: i, j  
	
	
	
	
	!x = 0.d0
	!	do i = 1, n
	!	x = x++
	
!function myfunc(x)
	
	real(kind=8), intent(in) :: x
	real(kind=8), intent(out) :: myfunc
!	real :: z
	use globals
	count = count + 1 ! count times called
	
	z = exp(x)
	myfunc = z*cos(x) + count
	
!end function myfunc		

	print*,myfunc!, x, z

	
end program myfunc
