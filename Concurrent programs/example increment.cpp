#include <iostream>
#include <thread>

using namespace std;

void increment(int num){

    for(int i=0; i<20; i++){
        cout << " Number " << num << " :" << i << endl;

    }
}

int main()
{
    thread t1(increment, 1);
    thread t2(increment, 2);

    t1.join();
    t2.join();

    return 0;
}
