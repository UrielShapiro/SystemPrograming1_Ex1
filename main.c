#include <stdio.h>
#include "NumClass.h"

int main()
{
    int num1,num2;
    scanf("%d%d", &num1, &num2);        //Receiving 2 numbers as input.
    printf("The Armstrong numbers are:");
    for (int i = num1; i <= num2; i++)
    {
        if(isArmstorng(i))
        {
            printf(" %d", i);
        }
    }
    printf("\nThe Palindromes are:");
    for (int i = num1; i <= num2; i++)
    {
        if(isPalindrome(i))
        {
            printf(" %d", i);
        }
    }
    printf("\nThe Prime numbers are:");
    for (int i = num1; i <= num2; i++)
    {
        if(isPrime(i))
        {
            printf(" %d", i);
        }
    }
    printf("\nThe Strong numbers are:");
    for (int i = num1; i <= num2; i++)
    {
        if(isStrong(i))
        {
            printf(" %d", i);
        }
    }
    printf("\n");
    return 0;
}