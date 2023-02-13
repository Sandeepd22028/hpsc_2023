        """
        Module for finding cuberoots
        """
        def cuberoot(x,debug=False,specialCases=True):
	"""
	
	x: The number whose square root is to be calculated
	debug: Initial value is False.
	specialCases: Initial value is True.

	"""
	#from numpy import nan
	y=1.0
	if specialCases:
		if x==0.:
			return 0.
		
              
	kmax=100
	tol=1.0e-14
	for k in range(kmax):
		if debug:
			print("At iteration number %y, y= %20.15f" %(k,y))
		y0=y
		y = (1./3.)*(2*y+x/(y**2))
		delta_y=y-y0
		if(abs(delta_y/x))<tol:
			break
	if debug:
		print("After %y iterations,  y=%20.15f" %(k+1,y))
	return y

def test_main():
	from numpy import cbrt
	xvalues=[0., 1., -500, 1.e5]
	for x in xvalues:
		print("Testing with x=%20.15e" %x)
		y=cuberoot(x)
		y_numpy=cbrt(x)
		print("cuberoot y = %20.15e, numpy y = %20.15e" %(y,y_numpy))
		assert abs(y-y_numpy) < 1e-14, "Your  cuberoot does not agree with numpy cbrt"
		
