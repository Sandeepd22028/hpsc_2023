program reduction
	use omp_lib
	implicit none
	
	integer, parameter :: n = 10
	integer :: i
	real :: y
	real, dimension (n) :: x
	logical :: anyzero	
	
	y = -1.3d0
	!$omp parallel do reduction(max : y)
	do i = 1, n
		y = max(y, x(i))
	end do
	print*, "max of x = ", y
	
	!reduction with .or.
	
!	logical anyzero
	anyzero =.false.
	
	!$omp parallel do reduction(.or. : anyzero)
	do i = 1, n
		anyzero = anyzero .or. (x(i) == 0.d0)
	end do
	print*, 'anyzero = ', anyzero
	
end program reduction
