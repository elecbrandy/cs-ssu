#include <stdio.h>

extern void copy_array(int arr1[], int arr2[], int n);

void print_array(int arr[], int n)
{
  for (int i = 0; i < n ; i++)
    printf("%d ", arr[i]);
  printf("\n");
}

int main()
{
  int arrOri[5] = { 2, 12, -1, 10, 7 };
  int arrCpy[5] = { 0, };
  int num = 5;

  printf("Array Original :");
  print_array(arrOri, num);

  printf("Array Copy :");
  print_array(arrCpy, num);

  copy_array(arrOri, arrCpy, num);

  printf("Array Original :");
  print_array(arrOri, num);

  printf("Array Copy :");
  print_array(arrCpy, num);

  return 0;
}

