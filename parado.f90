program parallel 


	use omp_lib
	implicit none
	integer :: i, j
	
	
!	!$ call omp_set_num_threads(2)  
	
	!$omp parallel num_threads(2)

	!private(i)
		do i=1, 10
		print*, "i = ", i
		end do
	!$omp end parallel
	
	!$omp parallel do 
		do j = 1, 10
		print*, "j = ", j
		end do
	!$omp end parallel do
	
	!OR omp parallel do can be written as 
	!omp parallel
	!omp do
	
	
	!$omp parallel private(j)
	!$omp do
		do j = 1, 10
		print*, "j = ", j
		end do
	!$omp end do
	!$omp end parallel
	
end program parallel
