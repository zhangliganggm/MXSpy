(
	__version__ = "0.21"
	__version_date__ = "2019-1-20 18:30"
	__author__ = "ACE"
	::__modeles__ = #()
	::__sys_paths__ = #("//lib")

	fn mxspy_search_lib libname = (
		/*
		find *.ms in sys.path
		*/
		
		if superclassof libname != StructDef do(
			self_path = getFilenamePath (getsourcefilename())
			
			for a in __sys_paths__ do(
				lib_path = (self_path+(a+"\\"+libname+".ms"))
				found = getfiles lib_path
				if found.count > 0 do(
					return found
				)
			)
		)
		return #()
	)

	fn import libname = (
		
		packfilenames = mxspy_search_lib libname
		
		if packfilenames.count > 0 then(

			filein packfilenames[1]
			
			if libname == "std" do(return OK)
			
			if libname == "os" then(
				command = "mxs_obj = MXS"+libname+"();"
				
			)else(
				
				command = "mxs_obj = MXS"+libname+";"
			)
			module_init = execute command
		)else(
			
			is_obj = execute ("iskindof "+libname+" StructDef")
			
			if is_obj == true do(
				obj = execute libname
				return obj
			)
			)
			
		if module_init != undefined then(
			append __modeles__ spack
			return module_init
			
		)else(
			print "cant'import module " + libname
		)
	)

	::import = import

)

-- debug
__name__ = "__main__"

if __name__ == "__main__" do(



)