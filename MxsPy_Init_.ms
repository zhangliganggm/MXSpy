__author__ = "ACE"

__modeles__ = #()

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
	
	lib_path = #("Lib")
	
	if superclassof != StructDef then(
		self_path = getsourcefilename()
		self_path = getFilenamePath self_path
		
		for a in lib_path do(
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
	
	packfilenames = search_lib libname
	if packfilenames.count > 0 do(
		filein packfilenames[1] quite:true
		)
		
	spack = execute("MXS"+libname+"()")
	if spack != undefined then (
		append __modeles__ spack
		return space
	)else(
		print "cant'import"
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