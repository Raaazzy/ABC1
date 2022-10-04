#include <stdio.h>

#define max_size 1000
//Array A
int A[max_size];
//Array B
int B[max_size];
//A length
int length;
//iterator
int i;
//Solution function
int Task(int array[],int size){
    int j;
    int counter = 0;
    for(j = 0;j < size; ++j){
        if(array[j] < 0 && array[j]%2 == 0){
            B[counter] = array[j];
            ++counter;
        }
    }
    return counter;
}
int main() {
  printf("Input length (0 < length <= %d): ", max_size);
  scanf("%d", &length);

  if(length < 1 || length > max_size) {
    printf("Incorrect length = %d\n", length);
    return 1;
  }
    
  for(i = 0; i < length; ++i) {
    printf("A[%d]? ", i);
    scanf("%d", A + i);
  }
  int b_size = Task(A,length);
    for(i = 0; i < b_size; ++i) {
    printf("%d ", B[i]);
  }
  return 0;
}
