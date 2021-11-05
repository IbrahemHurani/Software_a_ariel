
#include "NumClass.h"
int power(int x,int y){
   int sum=1;
   int i;
   for(i=1;i<=y;i++){
	   sum=sum*x;
   }
   return sum;
}
int isArmstrong2(int n, int sum, int digits) {
	if (n == 0)
		return sum;
	int Reminder = n % 10;
	sum += power(Reminder, digits);
	return isArmstrong2(n / 10, sum, digits);
}
int countDigits(int n) {
	if (n == 0)
		return 0;
	return 1 + countDigits(n / 10);
}
int isArmStrong(int n) {
	int sum = 0, digits;
	digits = countDigits(n);
	int tempSum = isArmstrong2(n, sum, digits);
	if (tempSum == n)
		return 1;
	return 0;

}
int isPalindrome2(int n, int sum) {
	if (n < 0) {
		printf("the number is negtive ");
		return 0;
	}
	if (n == 0)
		return sum;
	int digits = n % 10;
	sum = (sum * 10) + digits;
	return isPalindrome2(n / 10, sum);

}

int isPalindrome(int n) {
	int sum = 0;
	int temp = isPalindrome2(n, sum);
	if (temp == n)
		return 1;
	return 0;
}
