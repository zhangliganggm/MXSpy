__author__ = "ACE"

__modeles__ = #()
__lib_paths__ = #("//lib")
None = undefined

fn getFilesRecursive root pattern =
(
	dir_array = GetDirectories (root+"/*")
	for d in dir_array do
	  join dir_array (GetDirectories (d+"/*"))
	my_files = #()
	for f in dir_array do
	  join my_files (getFiles (f + pattern))
	my_files
)

fn search_lib libname = (
	/*
	find *.ms *.mse in sys.path
	*/
	
	if superclassof != StructDef then(
		self_path = getsourcefilename()
		self_path = getFilenamePath self_path
		
		for a in __lib_paths__ do(
			lib_path = (self_path+(a+"\\"+libname+".ms"))

			found = getfiles lib_path
			if found != #() do
				return found
			)
	)else(
			return #()
		)
	
	)


fn import libname = (
	-- find lib of *.ms
	packfilenames = search_lib libname
	
	if packfilenames.count > 0 do(
		filein packfilenames[1] quite:true
		module_init = execute("MXS"+libname+"()")
		)
		
	if module_init != undefined then(
		append __modeles__ spack
		return OK
	)else(
		print "cant'import module " + libname
	)
)

fn len var= (
	return var.count()

	)
	
fn __set__ var = (
	
	return makeUniqueArray var
)

struct list
(
	
	__array__ = #(),
	__doc__ = "list can't get args",
	
	__append__ = append,
	
	fn __init__ = (
		#pass
	),

	fn __new__ = (
		--global list = this
		--globalVars.set "list" this

	),
	
	fn __del__ = (
		
	),

	-- methods --
	fn items = (
		return this.__array__
	),
	
	fn py arg = (
		if arg == "[0]" do(/*...*/)
	),
	
	fn append var = (
		__append__ __array__ var
	),
	
	fn insert index var= (
		insertItem  var __array__ index
		return __array__
	),
	
	fn pop = (
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
	),

	on create do(
		this.__new__()
		this.__init__()
	)
)

--set debug
__name__ = "__main__111"

if __name__ == "__main__" do(
	import "os"

	-- abspath
	abspathz = os.path.abspath "ss"
	print abspathz
	print "- - - - - - - - - - - - -"
		
	-- list path
	lst = os.listdir "d:\\test"
	for a in lst do print a
	print "- - - - - - - - - - - - -"
		
	--  filesize
	for a in lst do(
		print (os.path.getsize a)
		)
	print "- - - - - - - - - - - - -"
		
	--  filesize
	for a in lst do(
		print (os.path.basename a)
		)
)