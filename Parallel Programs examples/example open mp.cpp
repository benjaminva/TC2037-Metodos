// taken from https://www.geeksforgeeks.org/introduction-to-parallel-programming-with-openmp-in-cpp/

// C++ Program to implement calculate
// the sum of the first n natural numbers
// using Parallel Programming
#include <chrono>
#include <iostream>

// Parallel programming function
int sum_parallel(int n)
{
	int sum = 0;
  #pragma omp parallel for reduction(+ : sum)
	for (int i = 0; i <= n; ++i) {
		sum += i;
	}
	return sum;
}

// Driver Function
int main()
{
	const int n = 100000000;

	auto start_time = std::chrono::high_resolution_clock::now();

	int result_parallel = sum_parallel(n);

	auto end_time = std::chrono::high_resolution_clock::now();

	std::chrono::duration<double> parallel_duration	= end_time - start_time;

	std::cout << "Parallel result: " << result_parallel
			<< std::endl;
	std::cout << "Parallel duration: "
			<< parallel_duration.count() << " seconds"
			<< std::endl;

	return 0;
}
