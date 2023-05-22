program test

	use omp_lib
	implicit none
	integer :: thread_num
	
	!$ call omp_set_num_threads(2)			
	! specidies number of threads to use 
	
	print*, "Testing openmp...."
	
	!$omp parallel private(thread_num)  
						!if private(variable) is not declared then by deafault thread_num will be shared variabel
						!
	!$	thread_num = omp_get_thread_num()

!	!$omp critical
						!we dont need to use ompcritical for private variable
						!if we dont use ompcritical for shared variacbnle we will get wrong output
!	!$	thread_num = omp_get_thread_num() 
							!omp_get_thread_num() is a subroutine
	!$	print*, "This Thread = ", thread_num
!	!$omp end critical 

	!$omp end parallel
	
end program test  
