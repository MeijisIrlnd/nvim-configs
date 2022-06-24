#include <iostream> 

void someFunc() 
{ 
	std::cout << "Some func";
}
int main() 
{ 
	std::cout << "Hello world!\n";
	return 0;
	for(auto i = 0; i < 5; i++) { 
		someFunc();
	}
}
