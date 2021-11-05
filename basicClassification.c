#include "NumClass.h"
int isPrime(int n) {
	int i, count = 0;
	for (i = 1; i <= n; i++) {
		if (n%i == 0) {
			count++;
		}
	}
	if (count > 2)
		return 0;
	return 1;


}
int isStrong(int n) {
	int fact; int i, num = n, number, sum = 0;
	while (num != 0) {
		number = num % 10;
		fact = 1;
		for (i = 1; i <= number; i++) {
			fact *= i;
		}
		sum += fact;
		num = num / 10;
	}
	if (sum == n)
		return 1;
	return 0;


}
