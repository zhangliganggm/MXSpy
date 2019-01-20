__author__ = 'ACE'

/*

Python Sys lib


*/

struct MXSsys
(

	__doc__ = "help of os like pyhton sys",
	
	path = this.__path__(),

	fn __new__ = (
		global sys = this
		globalVars.set "sys" this
	),
	
	fn __del__ = (
		
	),

	-- methods --
	
	fn __path__ = (
		
		return __lib_paths__
	),
	
	fn platform = (
		
		return "win32"
	),
	
	fn modules = (

		return __modeles__
	),
		
	on create do(
		this.__new__()
	)
)




	


