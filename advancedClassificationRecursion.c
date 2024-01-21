#include "NumClass.h"

int numOfDigits(int num)
{
    if (num == 0)
    {
        return 0;
    }
    return 1 + num / 10;
}

int sumOfDigitsByPower(int num, int numOfDigits)
{
    if (num == 0)
    {
        return 0;
    }
    return power(num % 10, numOfDigits) + sumOfDigitsByPower(num / 10, numOfDigits);
}

int power(int base, int pow)
{
    if(pow == 1)
    {
        return base;
    }
    return base * power(base,pow - 1);
}

int reversed(int num, int reversedNum)
{
    if(num == 0)
    {
        return 0;
    }
    reversedNum = reversedNum * 10 + num % 10;
    return reversed(reversedNum, num / 10);
}

int isPalindrome(int num)
{
    return (num == reversed(num, 0))? 1:0;
}

int isArmstorng(int num)
{
    return num == sumOfDigitsByPower(num, numOfDigits(num))? 1:0;
}