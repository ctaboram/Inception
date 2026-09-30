all:
	mkdir -p /home/ctaboada/data/wordpress
	mkdir -p /home/ctaboada/data/mariadb
	docker compose -f srcs/docker-compose.yml up -d --build
down:
	docker compose -f srcs/docker-compose.yml down
clean:
	docker compose -f srcs/docker-compose.yml down -v
	docker system prune -af
.PHONY: all down clean