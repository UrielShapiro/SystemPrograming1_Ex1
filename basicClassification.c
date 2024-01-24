#include "NumClass.h"
//We assume the input is >= 0 in all of our functions.
int isPrime(int num)
{
    if(num == 0)
    {
        return FALSE;
    }
    for (int i = 2; i*i <= num; i++)
    {
        if(num % i == 0)
        {
            return FALSE;
        }
    }
    return TRUE;
}

int factorial(int num)
{
    if(num == 0)
    {
        return 1;
    }
    return num * factorial(num -1);
}

int isStrong(int num)
{
    if(num == 0)
    {
        return FALSE;
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