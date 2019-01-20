__author__ = 'ACE'

/*

Python threading lib

#Example(MaxScript)

fn test = (
	for a in 1 to 10 do(
		print a
		sleep 0.5
		--slow.... 
		)

)

backthread = threading()
backthread.start_new_thread test 

*/

struct MXSthreading
(

	__doc__ = "help of os like pyhton thread",
	BackgroundWorker = undefined,

	fn start_new_thread func args:undefined =(
		
		this.BackgroundWorker = DotNetObject "System.ComponentModel.BackgroundWorker"
		DotNet.AddEventHandler this.BackgroundWorker "DoWork" func 
		this.BackgroundWorker.WorkerSupportsCancellation = true
		this.BackgroundWorker.RunWorkerAsync()
	),
	
	fn stop = (
		this.BackgroundWorker.CancelAsync()
		this.BackgroundWorker.Dispose()
	)
)

__name__ == "debug"

if __name__ == "__main__" do(
	
	
)