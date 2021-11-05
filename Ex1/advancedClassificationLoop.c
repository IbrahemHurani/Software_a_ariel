
#include "NumClass.h"
int countDigits(int number) {
	int count = 0;
	do {
		count++;
		number /= 10;
	} while (number != 0);
	return count;
}
int power(int x,int y){
   int sum=1;
   int i;
   for(i=1;i<=y;i++){
	   sum=sum*x;
   }
   return sum;
}
int isArmStrong(int n) {
	int numberOfdigits = countDigits(n);
	int sum = 0, num = n;
	while (num != 0) {
		int digits = num % 10;
		sum += power(digits, numberOfdigits);
		num /= 10;
	}
	if (sum == n)
		return 1;
	return 0;

}

int isPalindrome(int n) {
	int num = n, sum = 0;
	while (num != 0) {
		int digits = num % 10;
		sum = (sum * 10) + digits;
		num /= 10;
	}
	if (sum == n)
		return 1;
	return 0;

}