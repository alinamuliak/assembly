#include <stdint.h>
#include <stdio.h>

void func (float* a, float* b, float* x, size_t size);

int main() {
    printf("Hello world!\n");

    float a1[] = {1, 2, 10};
    float b1[] = {2, 1, 0};
    float x1[] = {0, 0, 0};
    size_t size1 = 3;
    printf("\nExample #1:\n");
    printf("array a: [%.2f, %.2f, %.2f]\n", a1[0], a1[1], a1[2]);
    printf("array b: [%.2f, %.2f, %.2f]\n", b1[0], b1[1], b1[2]);
    func(a1, b1, x1, size1);
    printf("array x: [%.2f, %.2f, %.2f]\n", x1[0], x1[1], x1[2]);


    float a2[] = {2.0, 6.0, -20.25, 1.0, 0.0};
    float b2[] = {1.0, -3.0, 30.50, 5.77, 8.0};
    float x2[] = {0, 0, 0, 0, 0};
    size_t size2 = 5;
    printf("\nExample #2:\n");
    printf("array a: [%.2f, %.2f, %.2f, %.2f, %.2f]\n", a2[0], a2[1], a2[2], a2[3], a2[4]);
    printf("array b: [%.2f, %.2f, %.2f, %.2f, %.2f]\n", b2[0], b2[1], b2[2], b2[3], b2[4]);
    func(a2, b2, x2, size2);
    printf("array x: [%.2f, %.2f, %.2f, %.2f, %.2f]\n", x2[0], x2[1], x2[2], x2[3], x2[4]);
    
    float a3[] = {2.05, -1, -1819, 1.0, 0.0, -5.55};
    float b3[] = {-1.025, 777.777, 3628, 12345654, -26.10};
    float x3[] = {0, 0, 0, 0, 0};
    size_t size3 = 6;
    printf("\nExample #3:\n");
    printf("array a: [%.3f, %.3f, %.3f, %.3f, %.3f, %.3f]\n", a3[0], a3[1], a3[2], a3[3], a3[4], a3[5]);
    printf("array b: [%.3f, %.3f, %.3f, %.3f, %.3f, %.3f]\n", b3[0], b3[1], b3[2], b3[3], b3[4], b3[5]);
    func(a3, b3, x3, size3);
    printf("array x: [%.3f, %.3f, %.3f, %.3f, %.3f, %.3f]\n", x3[0], x3[1], x3[2], x3[3], x3[4], b3[5]);
    
    printf("\nDone!:))\n");
    return 0;
}
