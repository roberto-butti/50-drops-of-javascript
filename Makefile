.PHONY = all clean build buildhtml buildpdf phpcs toc

SRCS := content/*.md
OUTPUTPDFLIGHT := export/50-drops-of-javascript-light.pdf
OUTPUTEBOOK := export/50-drops-of-javascript-light.epub
HTML := export/output.html

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: codestylefix build ## build Html pages and PDF

build: buildhtml buildpdf buildebook

buildhtml: ${HTML} ## build html pages
	@echo "Build : " ${HTML}

${HTML}: ${SRCS}
	@echo "Creating HTML... NOT YET IMPLEMENTED"


buildpdf: ${OUTPUTPDFLIGHT} ## build PDF file
	@echo "Build : " ${OUTPUTPDFLIGHT}

buildebook: ${OUTPUTEBOOK} ## build ebook epub file
	@echo "Build : " ${OUTPUTEBOOK}

${OUTPUTEBOOK}: ${SRCS}
	@echo "Creating epub file..."
	pandoc -o ${OUTPUTEBOOK} assets/metadata.txt content/*.md --css assets/style.css  --table-of-contents

${OUTPUTPDFLIGHT}: ${SRCS} assets/*
	@echo "Creating PDF file..."
	pandoc -o ${OUTPUTPDFLIGHT} \
		--pdf-engine-opt='cover' \
		--pdf-engine-opt='./assets/cover.html' \
		assets/metadata.txt  content/*.md \
		--css=assets/style.css  \
		--table-of-contents  \
		--pdf-engine=wkhtmltopdf \
		-V footer-html=./assets/footer.html


clean:
	rm ${OUTPUTEBOOK} ${OUTPUTPDFLIGHT}



open:
	open ${OUTPUTPDFLIGHT}


codestyle: ## Show eslint errors
	npx eslint --ext mjs examples
codestylefix:## Fix eslint errors
	npx eslint --fix --ext mjs examples/

listtodo: ## list TODO
	@cat list-of-functions-md | grep "^\-\ \["

toc: ## Generating TOC from content files
	@cat content/*.md | grep ^\#  | sed  's/^# /- /g' | sed  's/^## /    - /g' | sed 's/^### /        - /g'
