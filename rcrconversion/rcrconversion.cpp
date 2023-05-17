// rcrconversion.cpp : Defines the entry point for the application.
//

#include "rcrconversion.h"

using namespace std;

int main()
{
	cout << "Hello CMake." << endl;
	int subnum = 3;
	printf("3 - 5 = %d\n", subtract(&subnum, 5));
	return 0;
}

int subtract(int* a, int b) {
	return *a - b;
}
