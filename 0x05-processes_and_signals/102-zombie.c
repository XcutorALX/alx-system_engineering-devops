#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

/**
 * infinite_while - a function
 * Return: 0 in the end
*/
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - the entry to a program that creates 5 zombie process
 * Return: 0
*/
int main(void)
{
	int children = 0;
	pid_t child_pid;

	while (children < 5)
	{
		child_pid = fork();
		if (!child_pid)
			break;
		printf("Zombie process created, PID: %i\n", (int)child_pid);
		children++;
	}
	if (child_pid > 0)
		infinite_while();
	return (0);
}
