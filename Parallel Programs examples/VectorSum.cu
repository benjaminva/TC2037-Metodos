
#include "cuda_runtime.h"
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#define N (4096*4096)
#define HILOS_POR_BLOQUE 512

__global__ void sumaenlagpu(int *a, int *b, int *c, int n){
	int index = threadIdx.x + blockIdx.x*blockDim.x;
	if (index < n){
		c[index] = a[index] + b[index];
	}
}

void sumaenlacpu(int *a, int *b, int *c, int n){
	for(int i = 0; i< n; i++){
		c[i] = a[i] + b[i];
	}
}

void numerosAleatorios(int *a, int n){
	for (int i = 0; i < n; i++){
		a[i] = rand() % 100000;
	}
}

int comparaeneteros(int *a, int *b, int n){
	int pass = 0;
	for (int i = 0; i < n; i++){
		if (a[i] != b[i])
			printf("Los valores  en a[%i] = %i y en b[%i] = %i", i, a[i], i, b[i]);
	}
	if (pass == 0){
		printf("Comprobacion aceptada \n");
	}
	else{
		printf("No paso la comprobacion \n");
	}
	return pass;
}

int main(){
	int *a, *b, *c;
	int *d_a, *d_b, *d_c;
	int tam = N*sizeof(int);
	
	
	cudaMalloc((void**)&d_a, tam);
	cudaMalloc((void**)&d_b, tam);
	cudaMalloc((void**)&d_c, tam);

	a = (int*)malloc(tam);
	b = (int*)malloc(tam);
	c = (int*)malloc(tam);

	numerosAleatorios(a,N);
	numerosAleatorios(b,N);
	
	cudaMemcpy(d_a, a, tam, cudaMemcpyHostToDevice);
	cudaMemcpy(d_b, b, tam, cudaMemcpyHostToDevice);

	clock_t tiempogpu = clock();

	
	sumaenlagpu << <N / HILOS_POR_BLOQUE, HILOS_POR_BLOQUE >> >(d_a, d_b, d_c, N);
	printf("Tiempo transcurrido al procesador en GPU: %f\n", ((double)clock() - tiempogpu) / CLOCKS_PER_SEC);
	
	cudaMemcpy(c, d_c, tam, cudaMemcpyDeviceToHost);
	
	int *c_h;
	c_h = (int *)malloc(tam);
	
	clock_t tiempocpu = clock();
	sumaenlacpu(a, b, c_h, N);
	printf("Tiempo transcurrido al procesador en CPU: %f\n", ((double)clock() - tiempocpu) / CLOCKS_PER_SEC);
	comparaeneteros(c, c_h, N);

	
	free(a);
	free(b);
	free(c);
	cudaFree(d_a);
	cudaFree(d_b);
	cudaFree(d_c);
	return 0;
}
