#===================================================================================#
#         						     + MAKEFILE +                                   #
#               					Created by Juno                                 #
#===================================================================================#

# Variables -------------------------------------------------------------------------

NAME		= inception
SRCS		= ./srcs
COMPOSE		= $(SRCS)/docker-compose.yml
HOST_URL	= login.42.fr

# Rules -----------------------------------------------------------------------------

all: $(NAME)

$(NAME): up

up:
	mkdir -p ~/data/database
	mkdir -p ~/data/wordpress_files
	sudo hostsed add 127.0.0.1 $(HOST_URL)
	docker compose -p $(NAME) -f $(COMPOSE) up --build

down:
	docker compose -p $(NAME) down
	@echo ""

prep:
	@echo "${GREEN}\nCONTAINERS STOPPED:${RC}"
	@if [ -n "$$(docker ps -qa)" ]; then docker stop $$(docker ps -qa) ;	fi
	@echo "${GREEN}\nCONTAINERS REMOVED:${RC}"
	@if [ -n "$$(docker ps -qa)" ]; then docker rm $$(docker ps -qa) ; fi
	@echo "${GREEN}\nIMAGES REMOVED:${RC}"
	@if [ -n "$$(docker images -qa)" ]; then docker rmi -f $$(docker images -qa) ; fi
	@echo "${GREEN}\nVOLUMES REMOVED:${RC}"
	@if [ -n "$$(docker volume ls -q)" ]; then docker volume rm $$(docker volume ls -q) ; fi
	@echo "${GREEN}\nNETWORKS REMOVED:${RC}"
	@if [ -n "$$(docker network ls -q) " ]; then docker network rm $$(docker network ls -q) 2> /dev/null || true ; fi 
	@echo ""

clean:
	@docker compose -f $(COMPOSE) down -v -t 2
	@echo ""

fclean: clean
	@docker system prune -a -f

re: fclean all

# Customs ---------------------------------------------------------------------------

GREEN	= \033[0;32m
RC		= \033[0m

# Phony -----------------------------------------------------------------------------

.PHONY: all up down prep clean fclean re