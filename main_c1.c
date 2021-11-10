#include <stdint.h>
#include <stdio.h>

void func (int32_t* input_array, size_t size);

int main() {
    printf("Hello world!\n");
    int32_t a1[] = {4, -5, 3, 2, 7, 1, 6};
    size_t size1 = 7;
    printf("\nExample #1:\nstarting array: [%d, %d, %d, %d, %d, %d, %d]\n", size1, a1[0], a1[1], a1[2], a1[3], a1[4], a1[5], a1[6]);

    func(a1, size1);
    printf("sorted array: [%d, %d, %d, %d, %d, %d, %d]\n", a1[0], a1[1], a1[2], a1[3], a1[4], a1[5], a1[6]);


    int32_t a2[] = {-10, -9, -8, -3456789, 98765, 567};
    size_t size2 = 6;
    printf("\nExample #2:\nstarting array: [%d, %d, %d, %d, %d, %d]\n", size2, a2[0], a2[1], a2[2], a2[3], a2[4], a2[5]);

    func(a2, size2);
    printf("sorted array: [%d, %d, %d, %d, %d, %d]\n", a2[0], a2[1], a2[2], a2[3], a2[4], a2[5]);

    int32_t a3[] = {1000000, 9999, 777, -284531, 5, 0};
    size_t size3 = 6;
    printf("\nExample #3:\nstarting array: [%d, %d, %d, %d, %d, %d]\n", size3, a3[0], a3[1], a3[2], a3[3], a3[4], a3[5]);
    func(a3, size3);
    printf("sorted array: [%d, %d, %d, %d, %d, %d]\n", a3[0], a3[1], a3[2], a3[3], a3[4], a3[5]);

    printf("\nDone!:)\n");


    return 0;
}
