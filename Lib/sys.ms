__author__ = 'ACE'

/*

Python Sys lib


*/

struct MXSsys
(

	__doc__ = "help of os like pyhton sys",

	fn __init__ = (
		#pass
	),

	fn __new__ = (
		global os = this
		globalVars.set "sys" this
	),
	
	fn __del__ = (
		
	),

	-- methods --
	
	fn path filename newname = (
		
		renameFile filename newname
	),
	
	fn platform  filename = (
		
		makeDir filename
	),
	
	fn modules = (

		return __modeles__
	),
		
	on create do(
		this.__new__()
		this.__init__()
	)
)




	


