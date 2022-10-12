int Task(int *array,int size,int *B){
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
