#include "NumClass.h"
int isArmstorng(int num)
{
    int numOfDigits = getNumOfDigits(num);
    int numCopy = num;
    int sum = 0;

    while(numCopy > 0)
    {
        sum += power(numCopy%10, numOfDigits);
        numCopy/10;
    }
    return (num == sum)? 1:0;
}

int getNumOfDigits(int num)
{
    int amount = 0;
    while(num > 0)
    {
        amount++;
        num/=10;
    }
    return amount;
}

int power(int base, int pow)
{
    while(pow > 1)
    {
        base *= base;
        pow--;
    }
    return base;
}

int isPalindrome(int num)
{
    int reversed = 0;
    int numCopy = num;
    while(numCopy > 0)
    {
        reversed = reversed * 10 + numCopy % 10;
        numCopy /= 10;
    }
    return (reversed == num)? 1:0;
}
