#include "NumClass.h"

int getNumOfDigits(int num)
{
    int amountOfDigits = 0;
    while(num > 0)
    {
        amountOfDigits++;
        num/=10;
    }
    return amountOfDigits;
}

int power(int base, int pow)
{
    int product = 1;
    while(pow > 0)
    {
        product *= base;
        pow--;
    }
    return product;
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
    return reversed == num;
}

int isArmstorng(int num)
{
    int numOfDigits = getNumOfDigits(num);
    int numCopy = num;
    int sum = 0;

    while(numCopy > 0)
    {
        sum += power(numCopy%10, numOfDigits);
        numCopy/=10;
    }
    return num == sum;
}
