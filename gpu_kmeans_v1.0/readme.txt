Current version V 1.0 compiles under Linux and requires the installation of
CUDA (any version) and MATLAB mex compiler (any version).

To build successfully, the macros MATLAB_ROOT and CUDA_LIB in the Makefile might have to be modified if
the installation paths of MATLAB and CUDA in your computer are not the default.

To generate the mex function issue "make" in the main folder.
After that, the mex function (cudaKmeans.mexa) will be in folder bin/.
Use it through MATLAB function kmeans_gpu located in the same folder.
Type "help kmeans_gpu" in MATLAB's command prompt for more details.
To use the toolbox correctly always call the kmeans_gpu.m function in your
program and not cudaKmeans.mexa.

To temporarily install GPU k-means clustering Toolbox as a MATLAB toolbox
execute the script install.m in the main folder from MATLAB command prompt.

To permanently install the Toolbox in MATLAB execute the above script as root.

To verify successful installation run the script demos/TestAll from MATLAB.

To uninstall simply execute uninstall.m in the main folder from MATLAB command
prompt.

Please report any problems at nsismani@auth.gr
