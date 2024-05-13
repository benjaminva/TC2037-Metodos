#include <iostream>
#include <thread>
#include <algorithm>
// #include <chrono>

#define SIZE 100000000

using namespace std::chrono;
using namespace std;

void set_values(int start, int end, int* a){
	for (int i = start; i < end; i++) {
		 a[i] = 1;
	}
}

void add(int start, int end, int* a1, int* a2, int* b){
	for (int i = start; i < end; i++) {
		 b[i] = a1[i] + a2[i];
	}
}


int main(){

	int *arg1 = new int[SIZE];
	int *arg2 = new int[SIZE];
	int *res = new int[SIZE];

	// to check time
	// auto start = high_resolution_clock::now();


	thread set1(set_values, 0, SIZE/2, arg1);
	thread set2(set_values, SIZE/2 ,SIZE, arg1);
	thread set3(set_values, 0, SIZE/2, arg2);
	thread set4(set_values,  SIZE/2 ,SIZE, arg2);

	set1.join();
	set2.join();
	set3.join();
	set4.join();

	thread add1(add, 0, SIZE/2, arg1, arg2, res);
	thread add2(add, SIZE/2, SIZE, arg1, arg2, res);

	add1.join();
	add2.join();

	// to check time
	// auto stop = high_resolution_clock::now();

	long long unsigned int num = 0;

	for (int i = 0; i < SIZE; i++) {
		 num += res[i];
	}

	cout << num << endl;

	// to check time
	// auto duration = duration_cast<microseconds>(stop - start);
	// cout << "time " <<  duration.count()  << endl;

	return 0;
}
