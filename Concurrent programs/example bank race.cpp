#include <iostream>
#include <thread>

using namespace std;

int balance = 0;

void deposit(int num){

  balance = balance + num;

}

int main()
{

  thread t[20000];

  for (int i = 0; i < 20000; i ++){
      t[i] = thread(deposit, 1);
  }

  for (int i = 0; i < 20000; i ++){
      t[i].join();
  }

    cout << balance << endl;
    return 0;
}
