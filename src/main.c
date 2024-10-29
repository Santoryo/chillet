#include <unistd.h>
#include <string.h>

int	main(void)
{
	char	*str = "hello world ! and without bun or any bloat >:3\n";
	write(STDOUT_FILENO, str, strlen(str));
}
