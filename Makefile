HUGO          = hugo
YARN          = yarn
NODE_BIN      = node_modules/.bin
GULP         := $(NODE_BIN)/gulp
CONCURRENTLY := $(NODE_BIN)/concurrently

setup:
	$(YARN)

build-static-assets:
	$(GULP) build

develop-static-assets:
	$(GULP) dev

build:
	$(HUGO)

serve:
	$(HUGO) server \
	--buildDrafts \
	--buildFuture \
	--disableFastRender \
	--ignoreCache

develop-content: serve

develop-site:
	$(CONCURRENTLY) "make develop-static-assets" "make serve"
