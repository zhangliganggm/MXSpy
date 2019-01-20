__author__ = 'ACE'

/*

Python os lib

*/



struct list
(
	
	__array__ = #(),
	__doc__ = "list can't get args",
	

	fn __del__ = (
		
	),

	-- methods --
	fn items = (
		return this.__array__
	),
	
	fn _append var = (
		append __array__ var
	),
	
	fn insert index var= (
		insertItem  var __array__ index
		return __array__
	),
	
	fn _pop = (
		count = __array__.count
		if count > 0 do(
			item = __array__[count]
			deleteItem __array__ count
			return item
		)
	),
	
	fn remove = (
		
		return "win32"
	),

	fn index var = (
		
		return finditem this.array var
	),
	
	fn extend = (
		
		return undefined
	),
	
	fn sort = (
		sort __array__
		return "win32"
	)
	
)

