#include<stdio.h>
#include "NumClass.h"
int main() {
	int number1, number2;
	printf("Enter the First Number:");
	scanf("%d", &number1);
	printf("Enter the second Number:");
	scanf("%d", &number2);
	int i;
	printf("\nThe ArmStrong numbers are:\n");
	for (i = number1; i <= number2; i++) {
		if (isArmStrong(i) == 1)
			printf(" %d ", i);
	}
	printf("\nThe Palindrome numbers are:\n");
	for (i = number1; i <= number2; i++) {
		if (isPalindrome(i) == 1)
			printf(" %d ", i);
	}
	printf("\nThe Prime numbers are:\n");
	for (i = number1; i <= number2; i++) {
		if (isPrime(i) == 1)
			printf(" %d ", i);
	}
	printf("\nthe Strong numbers are:\n");
	for (i = number1; i <= number2; i++) {
		if (isStrong(i) == 1)
			printf(" %d ", i);
	}
	

return 0;

}