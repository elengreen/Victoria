/*
В одномерном массиве, состоящем из n вещественных элементов, вычислить:
1) среднее арифметическое всех положительных элементов;
2) сумму элементов, расположенных до максимального элемента.
*/

#include <stdio.h> 
#include <locale.h> 
#include <time.h>
#include <stdlib.h>
#include <limits.h>

int main()
{
	setlocale(LC_ALL, "Rus");
	srand(time(NULL));

	char c = '\n';
	int num = 0; //номер команды меню
	int size = 0;
	int *a = NULL;
	bool flag = false;

	int t = 0;
	float pol = 0; //все положительные элементы массива
	float kolvo = 0; //кол-во всех положительных элементов массива
	int max = 0;
	int doo = 0; //сумма элементов массива до максимального
	do
	{
		do
		{
			printf("\n*************************************************************************\n");
			printf("**                              МЕНЮ	                               **\n");
			printf("*************************************************************************\n");
			printf("**                  Введите номер команды от 1 до 5:                   **\n");
			printf("** 1. Ввод элементов массива с клавиатуры                              **\n");
			printf("** 2. Заполнение массива случайными числами                            **\n");
			printf("** 3. Среднее арифметическое всех положительных элементов массива      **\n");
			printf("** 4. Сумма элементов массива, расположенных до максимального элемента **\n");
			printf("** 5. Выход                                                            **\n");
			printf("*************************************************************************\n");
			while (scanf_s("%d%c", &num, &c, 1) != 2 || c != '\n')
			{
				while (getchar() != '\n');
			}
		} while ((num <= 0) || (num > 5));



		switch (num)
		{
		case 1:
			size = 0;
			do
			{
				printf("Введите размер массива: ");
				while ((scanf_s("%d%c", &size, &c, 1) != 2 || c != '\n'))
				{
					while (getchar() != '\n');
				}
			} while (size <= 0);
			a = new int[size];
			for (int i = 0; i < size; i++)
			{
				do
				{
					printf("Введите %d-й элемент последовательности: ", i + 1);
					while ((scanf_s("%d%c", &a[i], &c, 1) != 2 || c != '\n'))
					{
						while (getchar() != '\n');
					}
				} while ((a[i] <= SHRT_MIN) || (a[i] >= SHRT_MAX));
			}
			printf("Вы заполнили массив такими числами:\n");
			for (int i = 0; i < size; i++)
			{
				printf("%d ", a[i]);
			}
			flag = true;
			break;

		case 2:
			if (size > 0)
			{
				delete[] a;
			}
			size = 0;
			do
			{
				printf("Введите размер массива: ");
				while (scanf_s("%d%c", &size, &c, 1) != 2 || c != '\n')
				{
					while (getchar() != '\n');
				}
			} while (size <= 0);
			printf("Массив заполнен случайными числами:\n");
			a = new int[size]();
			for (int i = 0; i < size; i++)
			{
				a[i] = rand() - rand();
				printf("%d ", a[i]);
			}
			flag = true;
			break;

		case 3:
			if (flag == true)
			{
				for (int i = 0; i < size; i++)
				{
					if (a[i] > 0)
					{
						pol = a[i] + pol;
						kolvo = kolvo + 1;
					}
				}
				printf("\nСреднее арифметическое всех положительных элементов = %.2f", pol / kolvo);
			}
			break;

		case 4:
			if (flag == true)
			{
				max = a[0];
				for (int i = 0; i < size; i++)
				{
					if (a[i] > max)
					{
						max = a[i];
						t = i;
					}
				}
				printf("\nМаксимальный элемeнт равен: %d", max);
				for (int i = 0; i < t; i++)
				{
					doo = doo + a[i];
				}
				printf("\nСумма элементов, расположенных до максимального элемента: %d", doo);
			}
			break;


		case 5:
			break;
		}

	} while (num != 5);
	delete[] a;
	getchar();
	getchar();
}
