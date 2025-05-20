.PHONY: lint

lint:
	markdownlint-cli2 --config .markdownlint.yaml '**/*.md' '!**/.venv/**'
