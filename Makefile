name = simple_nginx_html
all:
	@printf "Launch configuration...\n"
	@docker-compose -f srcs/docker-compose.yml up

build:
	@printf "Building configuration...\n"
	@docker-compose -f srcs/docker-compose.yml up --build

down:
	@printf "Stopping configuration...\n"
	@docker-compose -f srcs/docker-compose.yml down

re:	down
	@printf "Rebuild configuration...\n"
	@docker-compose -f srcs/docker-compose.yml up --build

clean: down
	@printf "Cleaning configuration...\n"
	@docker system prune -a

fclean:
	@printf "Total clean of all configurations docker\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force

.PHONY	: all build down re clean fclean