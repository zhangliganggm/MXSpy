__author__ = 'ACE'

/*

Python Random lib


*/

struct MXSmrandom
(

	__doc__ = "help of os like pyhton random",

	-- python random --
	fn randomfloat = (
		
		return random 0.0 1.0
	),
	
	fn randint start end = (
		
		return random start end
	),
	
	fn choice lst = (
		flag = random 1 lst.count
		return lst[flag]
	)

)




	


