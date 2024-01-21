#include "NumClass.h"

int isPrime(int num)
{
    if(num == 0)
    {
        return 0;
    }
    for (int i = 2; i*i < num; i++)
    {
        if(num % i == 0)
        {
            return 0;
        }
    }
    return 1;
}

int isStrong(int num)
{
    if(num == 0)
    {
        return 0;
    }
    int copyNum = num;
    int sum = 0;
   while(copyNum > 0)
   {
    sum += factorial(copyNum % 10);
    copyNum /= 10;
   }
   return (sum == num);
}

int factorial(int num)
{
    if(num == 0)
    {
        return 1;
    }
    return num * factorial(num -1);
}