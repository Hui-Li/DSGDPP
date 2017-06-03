# MF

This project contains code performing matrix factorizations in a parallel and distributed fashion.
 
### Requirements
- Ubuntu 16.04
- MPICH 3.2
- GCC 5.4
- mpi^2: install using prerequire/mpi2.tar.bz2
  
  - The original repo for mpi^2: https://github.com/uma-pi1/mpi2
  - Small changes has been made in our mpi2.tar.bz2 file so it can works with new compiler and boost. 
  
- F2C: install using prerequire/install_f2c.sh (replace /home/<your-login>/local with your user name)

### Build
To build, cd to <mf-root>/build, then run
   - For optimized build (default; release with CPU-specific optimizations): cmake -DCMAKE_BUILD_TYPE=NativeRelease ../
   - For generic release (release without CPU-specific optimizations): cmake -DCMAKE_BUILD_TYPE=Release ../
   - For development (never use to measure runtime!): cmake -DCMAKE_BUILD_TYPE=Debug ../
   - make	     	    (this takes a while)

### Documents (Optionally)
Run doxygen in the main directory to create documentation files.   