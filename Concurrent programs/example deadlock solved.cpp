#include<iostream>
#include<mutex>
#include<thread>

std::mutex m1;
std::mutex m2;

void thread1() {
      std::cout << "1. Acquiring m1."  << std::endl;
      std::this_thread::sleep_for(std::chrono::milliseconds(100));
      m1.lock();
      std::cout << "1. Acquiring m2" << std::endl;
      m2.lock();
      m1.unlock();
      m2.unlock();
}

void thread2() {
      std::cout << "2. Acquiring m2"  << std::endl;
      m1.lock();
      std::this_thread::sleep_for(std::chrono::milliseconds(100));
      std::cout << "2. Acquiring m1"  << std::endl;
      m2.lock();
      m1.unlock();
      m2.unlock();
}

int main() {
    std::cout << "starting thread 1:" << std::endl;
    std::thread t1(thread1);

    std::cout << "starting thread 2:"  << std::endl;
    std::thread t2(thread2);

    t1.join();
    t2.join();
}
