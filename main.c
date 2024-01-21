#include <stdio.h>
#include "NumClass.h"

int main()
{
    int num1;
    int num2;
    printf("Enter 2 numbers: /n");

    scanf("%d%d", &num1, &num2);
    printf("The Prime numbers are: ");
    for (int i = num1; i <= num2; i++)
    {
        if(isPrime(i))
        {
            printf(", ",i);
        }
    }
    
}