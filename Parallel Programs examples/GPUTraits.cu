
#include "cuda_runtime.h"
#include <stdio.h>


int main(){

	cudaDeviceProp prop;  // Object that has access to the gpus traits
	
	int count; 
	cudaGetDeviceCount(&count);
	
	for (int i = 0; i < count; i++){
		cudaGetDeviceProperties(&prop, i);
		printf("name %s \n", prop.name);
		printf("clockrate %i \n", prop.clockRate);
		printf("maxGRID Size %i %i %i\n", prop.maxGridSize[0], prop.maxGridSize[1], prop.maxGridSize[2]);
		printf("max Thread Dim %i %i %i \n", prop.maxThreadsDim[0], prop.maxThreadsDim[1], prop.maxThreadsDim[2]);
		printf("max Threads per Block Dim  %i \n", prop.maxThreadsPerBlock);
		printf("total global memory bytes %lli \n", (long long int)prop.totalGlobalMem);
		printf("total global memory MB %lli \n", ((long long int)prop.totalGlobalMem)/(1024*1024));
		printf("total global memory GB %lli \n", ((long long int)prop.totalGlobalMem)/(1024*1024*1024));
		printf("wrap size %i \n", prop.warpSize);
	
	}
}
