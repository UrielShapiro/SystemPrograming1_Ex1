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
        return 1;       //x^0 = 1
    }
    if(pow == 1)
    {
        return base;    //x^1 = x
    }
    return base * power(base,pow - 1);  //x^n = x*x^(n-1)
}
/*
Returns the sum of each digit of "num" to the power of the number of digits in "num".
*/
int sumOfDigitsByPower(int num, int numOfDigits)
{
    if (num == 0)
    {
        return 0;
    }
    return power(num % 10, numOfDigits) + sumOfDigitsByPower(num / 10, numOfDigits);
}
/*
return "num" reversed
example: reversed(123,0) = 321
*/
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