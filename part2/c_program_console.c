#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define max_size 20


extern int Task(int array[],int size,int *B);

int main(int argc, char* argv[]) {
  int A[max_size];
  int B[max_size];
  int length;
  int i;
  FILE *input, *output;
  //Ввод из консоли.
  if(argc<2 || atoi(argv[1]) == 0){
      printf("Input length (0 < length <= %d): ", max_size);
  scanf("%d", &length);
  if(length < 1 || length > max_size) {
    printf("Incorrect length = %d\n", length);
    return 1; }
      for(i = 0; i < length; ++i) {
    printf("A[%d]? ", i);
    scanf("%d", A + i);
  }
  //Ввод из файла.
  } else if(atoi(argv[1]) == 1){
    input = fopen("input.txt", "r");
    fscanf(input, "%d", &length);
     if(length < 1 || length > max_size) {
    printf("Incorrect length = %d\n", length);
    return 1; }
      for(i = 0; i < length; ++i) {
       fscanf(input,"%d", A + i);
  }
    //Ввод из рандома.
  } else if(atoi(argv[1]) == 2){
      srand(time(NULL));
      length = 0;
      while(length < 1 || length > max_size){
          length = rand();
      }
      for(i = 0; i < length; ++i) {
       A[i] = rand();
       if(A[i]%4 == 0){
           A[i] *=-1;
       }
  }
  }
    int b_size = Task(A,length,B);
    if(argc>1 && atoi(argv[1]) == 1){
         output = fopen("output.txt", "w");
         for(i = 0; i < b_size; ++i) {
        fprintf(output, "%d", B[i]);    
  }
   return 0;
    }
    for(i = 0; i < b_size; ++i) {
    printf("%d ", B[i]);
  }
  return 0;
}
