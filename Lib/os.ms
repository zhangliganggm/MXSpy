__author__ = 'ACE'

/*

Python os lib

*/


struct MXSpath
(
	fn abspath filename =
	(
		return pathConfig.convertPathToAbsolute filename
	),
	
	fn basename filename =
	(
		return filenameFromPath filename
	),
	
	fn dirname filename =
	(
		return getFilenamePath filename
	),
	
	fn exists filename =
	(
		return doesFileExist filename
	),
	
	fn getctime filename =
	(
		return getFileCreateDate filename
	),
	fn getctime filename =
	(
		return getFileModDate filename
	),
	fn join filename1 filename2 =
	(
		return pathConfig.appendPath  filename1 filename2
	),
	fn isabs filename =
	(
		return pathConfig.isAbsolutePath  filename
	),
	
	fn getsize filename =
	(
		return getFileSize  filename
	)

)

struct MXSos
(
	path = MXSpath,
	
	__doc__ = "help of os like pyhton os",
	
	fn __init__ = (
		#pass
	),

	fn __new__ = (
		global os = this
		globalVars.set "os" this
	),
	
	fn __del__ = (
		
	),

	-- methods --
	
	fn rename filename newname = (
		
		renameFile filename newname
	),
	
	fn mkdir filename = (
		
		makeDir filename
	),
	
	fn listdir filename = (
		
		getDirectories  filename + getFiles (filename+ "\\*.*")
	),
		
	on create do(
		this.__new__()
		this.__init__()
	)

)




	


