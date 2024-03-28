# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amylle <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/14 14:54:05 by amylle            #+#    #+#              #
#    Updated: 2024/03/28 18:23:17 by amylle           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC_DIR		= src
OBJ_DIR		= obj
INC_DIR		= inc

LIBFT_DIR	= $(SRC_DIR)/libft

LIBFT_SRCS	=	ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c\
			   	ft_strlen.c ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c\
			   	ft_toupper.c ft_tolower.c ft_strchr.c ft_strrchr.c ft_strncmp.c\
			   	ft_atoi.c ft_strdup.c ft_calloc.c ft_strnstr.c ft_memchr.c\
			   	ft_memcpy.c ft_memmove.c ft_memcmp.c ft_strlcpy.c ft_strlcat.c\
			   	ft_substr.c ft_strjoin.c ft_strtrim.c ft_itoa.c ft_strmapi.c\
			   	ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c\
			   	ft_putnbr_fd.c ft_split.c ft_lstnew.c ft_lstadd_front.c\
			   	ft_lstsize.c ft_lstadd_back.c ft_lstlast.c ft_lstdelone.c\
			   	ft_lstclear.c ft_lstiter.c ft_lstmap.c

PRINTF_DIR	= $(SRC_DIR)/printf

PRINTF_SRCS	= ft_formats.c ft_printf.c ft_format_char.c ft_isformat.c\
			  ft_format_str.c ft_format_decimal.c ft_format_int.c\
			  ft_format_unsigned_decimal.c ft_itoa_base.c\
			  ft_format_lowhex.c ft_format_highhex.c ft_format_pointer.c

SRCS		= $(addprefix $(LIBFT_DIR)/, $(LIBFT_SRCS)) $(addprefix $(LIBFT_DIR)/, $(LIBFT_SRCS))

OBJS 		= $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))

CC			= cc
RM			= rm -f
CFLAGS		= -Wall -Werror -Wextra -I$(INC_DIR)

NAME		= libft.a
#---------------------------Messages--------------------------------------------

BOLD_PURPLE	=	\033[1;35m

BOLD_CYAN	=	\033[1;36m

BOLD_YELLOW	=	\033[1;33m

NO_COLOR	=	\033[0m

comp_mes:
	@echo "$(BOLD_YELLOW)Compiling object files"
#-------------------------RULES-----------------------------------------

all: 		$(NAME)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c				
					@$(CC) $(CFLAGS) -c $< -o $@

$(NAME):	comp_mes $(OBJS) 
				@echo "$(BOLD_YELLOW)Making library"
				@ar rcs $(NAME) $(OBJS)
				@echo "$(BOLD_PURPLE)Library creation successful yippee"

clean:
				@$(RM) $(OBJS) $(BONUS_OBJS)
				@echo "$(BOLD_YELLOW)Removing .o files"

fclean:		clean
				@$(RM) $(NAME)
				@echo "$(BOLD_YELLOW)Removing binaries"

re:			fclean all

.PHONY:		all clean fclean re comp_mes 