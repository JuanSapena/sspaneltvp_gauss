**Installing Optimization module for Gauss**
 Copy the files to the folders:.
 1. target path\src source code files 
 2. target path\lib library files
 3. target path\examples example files

In order to use the procedures in the OPTIMIZATION Module the OPTMUM library must be active. This is done by including optmum in the LIBRARY statement at the
top of your program or command file:
	***library optmum;***
This enables GAUSS to find the procedure OPTMUM and other procedures used by OPTMUM.
If you plan to make any right hand references to the global variables (which are described in a later section), you will also need the statement:
	***#include optmum.ext;***
Finally, to reset global variables in succeeding executions of the command file the following instruction can be used:
	***optset;***