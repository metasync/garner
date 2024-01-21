include Makefile.env

build.dev:
	@$(MAKE) -C build/dev build

push.dev:
	@$(MAKE) -C build/dev push

run.dev:
	@$(MAKE) -C build/dev run

image.dev:
	@$(MAKE) -C build/dev image

build.rel:
	@$(MAKE) -C build/rel build

push.rel:
	@$(MAKE) -C build/rel push

run.rel:
	@$(MAKE) -C build/rel run

image.rel:
	@$(MAKE) -C build/rel image

prune:
	@${CONTAINER_CLI} image prune -f
clean: prune

up:
	@${CONTAINER_CLI} compose up -d
down:
	@${CONTAINER_CLI} compose down
ps:
	@${CONTAINER_CLI} compose ps -a
logs:
	@${CONTAINER_CLI} compose logs -f

up.app:
	@${CONTAINER_CLI} compose up app -d
shell.app:
	@${CONTAINER_CLI} compose exec app /bin/sh
restart.app:
	@${CONTAINER_CLI} compose restart app
logs.app:
	@${CONTAINER_CLI} compose logs app -f

up.app.db:
	@${CONTAINER_CLI} compose up app.db -d
shell.app.db:
	@${CONTAINER_CLI} compose exec app.db /bin/bash
restart.app.db:
	@${CONTAINER_CLI} compose restart app.db
logs.app.db:
	@${CONTAINER_CLI} compose logs app.db -f
