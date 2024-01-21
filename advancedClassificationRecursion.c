#include "NumClass.h"

int numOfDigits(int num)
{
    if (num == 0)
    {
        return 0;
    }
    return 1 + numOfDigits(num / 10);
}

int power(int base, int pow)
{
    if (pow == 0)
    {
        return 1;
    }
    if(pow == 1)
    {
        return base;
    }
    return base * power(base,pow - 1);
}

int sumOfDigitsByPower(int num, int numOfDigits)
{
    if (num == 0)
    {
        return 0;
    }
    return power(num % 10, numOfDigits) + sumOfDigitsByPower(num / 10, numOfDigits);
}

int reversed(int num, int reversedNum)
{
    if(num == 0)
    {
        return reversedNum;
    }
    reversedNum = reversedNum * 10 + num % 10;
    return reversed(num / 10, reversedNum);
}

int isPalindrome(int num)
{
    return num == reversed(num, 0);
}

int isArmstorng(int num)
{
    return num == sumOfDigitsByPower(num, numOfDigits(num));
}