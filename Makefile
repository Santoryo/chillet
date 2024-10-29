SHELL = bash

NAME = palbot

CC = cc

OBJSDIR = obj/

SRC = $(shell find src -name '*.c')

I_DIR = include/

INCLUDE = -I $(I_DIR)

OBJS = $(addprefix $(OBJSDIR), $(SRC:.c=.o))

FLAGS = -o3 -ofast -g

# --------------------------------

all: $(NAME)

$(NAME): $(OBJS)
	@printf "\x1B[2K\r \x1B[1;32m[ 󱌣 ]\x1B[0m objects compiled."
	@printf "\n \x1B[1;33m[  ]\x1B[0m compiling $(NAME)..."
	@$(CC) $(FLAGS) $(OBJS) -o $(NAME)
	@printf "\x1B[2K\r \x1B[1;33m[  ]\x1B[0m $(NAME) compiled.\n"

$(OBJSDIR)%.o: %.c
	@mkdir -p $(@D)
	@$(CC) $(INCLUDE) $(FLAGS) $< -c -o $@
	@printf "\x1B[2K\r \x1B[1;32m[ 󱌣 ]\x1B[0m compiling objects... : $<"

clean:
	@rm -f $(OBJS)
	@printf " \x1B[1;31m[  ]\x1B[0m deleted $(NAME).\n"

fclean: clean
	@rm -f $(NAME)
	@rm -Rf $(OBJSDIR)
	@printf " \x1B[1;31m[  ]\x1B[0m deleted objects.\n"

re: fclean all

.PHONY: clean all re fclean
