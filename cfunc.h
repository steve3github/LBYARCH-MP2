#ifndef KERNEL_H
#define KERNEL_H

void cKernel(float* arr, long long int size, float* values) {
	int i, j, ctr;
	float val;
	clock_t begin, end;
	printf("\n\n");
	printf("================ C Kernel ================\n");
	printf("Enter Array size:\n");
	scanf_s("%d", &size);

	arr = (float*)malloc(size * sizeof(float));
	ctr = 0;
	for (i = 0; i < size; i++) {
		arr[i] = 1;
	}

	for (i = 0; i < 10; i++) {
		values[i] = 0;
	}

	begin = clock();
	for (i = 3; i < size; i++) {
		val = 0;
		for (j = i - 3; j < i + 4; j++) {
			val += arr[j];
		}

		if (ctr < 10) {
			values[ctr] = val;
		}
		ctr += 1;
	}
	end = clock();
	for (i = 0; i < 10; i++) {
		printf("%f\n", values[i]);
	}

	double time_taken = (double)(end - begin) / CLOCKS_PER_SEC;
	printf("Time taken: %f seconds", time_taken);
	end = clock();
}

#endif 
