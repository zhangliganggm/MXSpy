## MXSpy
### Call MaxScript like Python

#### Example:

	::str = import "str"
	
	t = str("Hello World")
	t.split(" ")
	> #("Hello", "World")
	
	t.upper()
	> "HELLO WORLD"

	t.lower()
	> "hello world"
	
	(str(";")).join(#("a", "b", "c"))
	> "a;b;c;"

	::os = import "os"
	
	os.path.abspath "ss"
	> "C:\Users\ace\Documents\3dsMax\ss"
	
	os.path.basename "d:\\test.jpg"
	> "test.jpg"

	os.listdir "d:\\test"
	> #("d:\TEST\", "d:\test\68821.rar")
	
	os.path.getsize @"d:\test\68821.rar"
	> 65858989L
		
	::mrandom = import "mrandom"
	
	mrandom.randint 0 9
	> 5
	
	mrandom.choice #("a", "b", "c")
	> "c"

## Complie.py
convert all maxscript to a line

    (
    --mxspy;    __version__ = "0.21";
    base64data = "..."
    execute base64data
    OK
    )
    ...

* Email(394452216@qq.com)
* QQ: 394452216
* blog: http://www.tdace.com

