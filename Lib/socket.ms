__author__ = 'ACE'

/*

Python threading lib

#Example(MaxScript)

import "socket"
sever = socket()
sever.connect "127.0.0.1" 18868
sever.recv()

*/


struct MXSsocket
(

	__doc__ = "help of os like pyhton socket",
	theTcpListener = undefined,
	
	fn __init__ = (
		#pass

	),

	fn __new__ = (
		global socket = MXSsocket
		globalVars.set "socket" MXSsocket
	),
	

	fn close=(
		this.theTcpListener.Stop()
	),

	fn connect ipaddres port =(
		IPAddress = DotNetClass "System.Net.IPAddress"
		theIPAddress = IPAddress.Parse ipaddres
		this.theTcpListener = DotNetObject "System.Net.Sockets.TcpListener" theIPAddress port
		this.theTcpListener.Start()
		return OK
	),

	fn recv size:8192 =(
        theSocket = this.theTcpListener.AcceptSocket()
        theByteStream = DotNetObject "System.Byte[]" size
        theSocket.Receive theByteStream
        Encoding = DotnetClass  "System.Text.Encoding"
        theString = Encoding.UTF8.GetString(theByteStream)
		return theString
		
	),

	on create do(
		this.__new__()
		this.__init__()
	)
)

__name__ == "debug"

if __name__ == "__main__" do(
	local ip
	local port
	ip = "127.0.0.1"
	port = 18868

)