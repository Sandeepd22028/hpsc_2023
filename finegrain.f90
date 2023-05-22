program fine ! using fine grain parallel do to solve ODE using Eulers method

	use omp_lib
	implicit none
	
	integer, parameter :: n = 10, nsteps = 10
	integer :: i, m
	real(kind = 8), dimension(n) :: u, eta
	real(kind = 8) :: t, dt, c
	
	c =1.d0
	
	!$omp parallel do
		do i = 1, n
			u(i) = eta(i)
		end do
	!$omp end parallel do
	
	do m = 1, nsteps
!		!$omp parallel do
		!$omp parallel do
			do i = 1, n
		!		do m = 1, nsteps
				u(i) = (1.d0 + dt * c) * u(i)	
		!		enddo
			end do
		!$omp end parallel do	
!	!$omp end parallel do
	end do
	
	do i = 1, n
		print*, u(i)
	end do
	
end program fine
