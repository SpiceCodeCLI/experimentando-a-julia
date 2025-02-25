#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define N 3

void printMatrix(double matrix[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            printf("%8.3f ", matrix[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

void multiplyMatrices(double A[N][N], double B[N][N], double result[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            result[i][j] = 0;
            for (int k = 0; k < N; k++) {
                result[i][j] += A[i][k] * B[k][j];
            }
        }
    }
}

void transposeMatrix(double matrix[N][N], double result[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            result[j][i] = matrix[i][j];
        }
    }
}

double determinant(double matrix[N][N]) {
    return matrix[0][0] * (matrix[1][1] * matrix[2][2] - matrix[1][2] * matrix[2][1]) -
           matrix[0][1] * (matrix[1][0] * matrix[2][2] - matrix[1][2] * matrix[2][0]) +
           matrix[0][2] * (matrix[1][0] * matrix[2][1] - matrix[1][1] * matrix[2][0]);
}

void inverseMatrix(double matrix[N][N], double result[N][N]) {
    double det = determinant(matrix);
    if (det == 0) {
        printf("Matrix is singular, cannot find inverse.\n");
        return;
    }
    double invDet = 1.0 / det;
    result[0][0] = (matrix[1][1] * matrix[2][2] - matrix[1][2] * matrix[2][1]) * invDet;
    result[0][1] = (matrix[0][2] * matrix[2][1] - matrix[0][1] * matrix[2][2]) * invDet;
    result[0][2] = (matrix[0][1] * matrix[1][2] - matrix[0][2] * matrix[1][1]) * invDet;
    result[1][0] = (matrix[1][2] * matrix[2][0] - matrix[1][0] * matrix[2][2]) * invDet;
    result[1][1] = (matrix[0][0] * matrix[2][2] - matrix[0][2] * matrix[2][0]) * invDet;
    result[1][2] = (matrix[0][2] * matrix[1][0] - matrix[0][0] * matrix[1][2]) * invDet;
    result[2][0] = (matrix[1][0] * matrix[2][1] - matrix[1][1] * matrix[2][0]) * invDet;
    result[2][1] = (matrix[0][1] * matrix[2][0] - matrix[0][0] * matrix[2][1]) * invDet;
    result[2][2] = (matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0]) * invDet;
}

int main() {
    double A[N][N] = {
        {2, -1, 0},
        {1, 3, -2},
        {0, 4, 1}
    };
    
    double B[N][N] = {
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9}
    };
    
    double result[N][N];
    
    printf("Matrix A:\n");
    printMatrix(A);
    printf("Matrix B:\n");
    printMatrix(B);
    
    multiplyMatrices(A, B, result);
    printf("Product of A and B:\n");
    printMatrix(result);
    
    transposeMatrix(A, result);
    printf("Transpose of A:\n");
    printMatrix(result);
    
    printf("Determinant of A: %.3f\n", determinant(A));
    
    inverseMatrix(A, result);
    printf("Inverse of A:\n");
    printMatrix(result);
    
    return 0;
}