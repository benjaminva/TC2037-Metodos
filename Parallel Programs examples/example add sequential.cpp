#include <iostream>
// #include <chrono>

#define SIZE 100000000

using namespace std::chrono;
using namespace std;

int main(){

	int *arg1 = new int[SIZE];
	int *arg2 = new int[SIZE];
	int *res = new int[SIZE];

	// auto start = high_resolution_clock::now();

	for (int i = 0; i < SIZE; i++) {
		 arg1[i] = 1;
	}


	for (int i = 0; i < SIZE; i++) {
		 arg2[i] = 1;
	}

	for (int i = 0; i < SIZE; i++) {
		 res[i] = arg1[i] + arg2[i];
	}

	// auto stop = high_resolution_clock::now();


	long long unsigned int num;

	for (int i = 0; i < SIZE; i++) {
		 num = num + res[i];
	}

	cout << num << endl;

	// auto duration = duration_cast<microseconds>(stop - start);

	// cout << "time " <<  duration.count()  << endl;

	return 0;
}
