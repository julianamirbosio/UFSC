typedef struct MinMax
{
 int min;
 int max;
}MinMax;

MinMax *getMinMax(int * array, const int SIZE) {
    
    MinMax *s = (MinMax *) malloc(sizeof(MinMax));

    int min = array[0];
    int max = array[0];
     
    for (int i = 0; i < SIZE; i++){
        if (array[i] < min) {
            min = array[i];
        }
        if (array[i] > max) {
            max = array[i];
        }
    }

}
