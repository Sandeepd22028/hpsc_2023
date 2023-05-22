program omp_parallel_do_loops

	use omp_lib		!will be used for parallelizing the problem
	
!---------------------------------------------------------------------------------------------
!--------------------Without parallelizing the code/problem-----------------------------------	
!---------------------------------------------------------------------------------------------	
	implicit none
	
	integer, parameter :: n = 10**8
	integer :: i
	real(kind=8) ::x, dx
	real(kind=8), dimension(n):: y

	real :: start, finish
	
	call CPU_TIME(start)
	
	dx = 1.d0/(n+1.d0)	
	
	do i = 1, n 
		x = i * dx
		y(i) = exp(x)*cos(x)*sin(x)*sqrt(5*x + 6.d0)
	end do
	
	call CPU_TIME(finish)
	print*, finish-start ! give time in seconds
!-----------------------------------------------------------------------------------------------	
!-----------------------------------------------------------------------------------------------


!-----------------------------------------------------------------------------------------------
!---------------Parallelizing the do loop using !$omp parallel do 
!-----------------------------------------------------------------------------------------------

	!declaring x to be a private variable, omp parallel do indicates the block of codes
	!will be can be parallelized
	call CPU_TIME(start)

	!$omp parallel do private(x)	

	do i = 1, n
		x = i * dx
		y(i) = exp(x)*cos(x)*sin(x)*sqrt(5*x + 6.d0)
	end do
	
	call CPU_TIME(finish)
	
	print*,finish-start
	

!------------------------------------------------------------------------------------------------
!----------------using 2 threds to calculate y(i)------------------------------------------------
!------------------------------------------------------------------------------------------------	


	call CPU_TIME(start)
	
	!$ call omp_set_num_threads(2)
	!$omp parallel do private(x)	
	
	do i = 1, n
		x = i * dx
		y(i) = exp(x)*cos(x)*sin(x)*sqrt(5*x + 6.d0)
	end do
	
	call CPU_TIME(finish)
	
	print*,finish-start





		
		
end program omp_parallel_do_loops


