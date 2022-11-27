.PHONY = all clean build buildhtml buildpdf phpcs toc

SRCS := content/*.md
OUTPUT := export/50-drops-of-javascript-light.pdf
HTML := export/output.html
IBISEXEC := ../OPENSOURCE/ibis/ibis

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: build ## build Html pages and PDF

build: buildhtml buildpdf

buildhtml: ${HTML} ## build html pages
	@echo "Going to build" ${HTML}

${HTML}: ${SRCS}
	@echo "Creating HTML... NOT YET IMPLEMENTED"


buildpdf: ${OUTPUT} ## build PDF file
	@echo "Going to build" ${OUTPUT}

${OUTPUT}: ${SRCS} ibis.php assets/*.html
	@echo "Creating PDF (light)..."
	${IBISEXEC} build
	@echo "Creating PDF (dark)..."
	${IBISEXEC} build dark


buildsample: ## build sample PDF file
	@echo "Creating PDF sample..."
	${IBISEXEC} sample

clean:
	@echo "Cleaning up..."
	@echo "removing (dry run) " ${OUTPUT}

open:
	open ${OUTPUT}


codestyle: ## Show eslint errors
	npx eslint examples
codestylefix:## Fix eslint errors
	npx eslint --fix  examples

listtodo: ## list TODO
	@cat list-of-functions-md | grep "^\-\ \["

toc: ## Generating TOC from content files
	@cat content/*.md | grep ^\#  | sed  's/^# /- /g' | sed  's/^## /    - /g' | sed 's/^### /        - /g'
