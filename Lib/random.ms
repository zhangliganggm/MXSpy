__author__ = 'ACE'

/*

Python Random lib


*/

struct MXSrandom
(

	__doc__ = "help of os like pyhton random",

	fn __init__ = (
		#pass
	),

	fn __new__ = (
		global pyrandom = this
		globalVars.set "pyrandom" this
	),
	
	fn __del__ = (
		
	),

	-- python random --
	fn randomfloat = (
		
		return random 0.0 1.0
	),
	
	fn randint start end = (
		
		return random start end
	),
	
	fn choice lst= (
		flag = random 1 lst.count
		return lst[flag]
	),
		
	on create do(
		this.__new__()
		this.__init__()
	)
)




	


