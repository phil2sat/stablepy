.PHONY: help install setup clean test lint format dev-install update lock

# Default target
help:
	@echo "Available commands:"
	@echo "  setup      - Setup virtual environment and install dependencies"
	@echo "  install    - Install dependencies using Poetry"
	@echo "  dev-install- Install development dependencies"
	@echo "  update     - Update dependencies"
	@echo "  lock       - Update lock file"
	@echo "  test       - Run tests"
	@echo "  lint       - Run linting checks"
	@echo "  format     - Format code"
	@echo "  clean      - Clean virtual environment and cache"
	@echo "  shell      - Activate Poetry shell"
	@echo "  requirements - Export requirements.txt"

# Setup virtual environment and install dependencies
setup:
	@echo "Setting up virtual environment and installing dependencies..."
	poetry config virtualenvs.in-project true
	poetry config keyring.enabled false
	poetry lock
	poetry install

# Install dependencies
install:
	poetry install

# Install development dependencies
dev-install:
	poetry install --with dev

# Update dependencies
update:
	poetry update

# Update lock file only
lock:
	poetry lock

# Run tests
test:
	poetry run pytest tests/

# Run linting (if you have linting tools configured)
lint:
	@echo "Running linting checks..."
	@if poetry run which flake8 >/dev/null 2>&1; then poetry run flake8 stablepy/; fi
	@if poetry run which black >/dev/null 2>&1; then poetry run black --check stablepy/; fi

# Format code
format:
	@echo "Formatting code..."
	@if poetry run which black >/dev/null 2>&1; then poetry run black stablepy/; fi
	@if poetry run which isort >/dev/null 2>&1; then poetry run isort stablepy/; fi

# Clean virtual environment and cache
clean:
	poetry env remove --all
	poetry cache clear --all pypi
	rm -rf .venv/
	rm -rf __pycache__/
	find . -type d -name "*.egg-info" -exec rm -rf {} +
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -name "*.pyc" -delete

# Activate Poetry shell
shell:
	poetry shell

# Export requirements.txt
requirements:
	poetry export -f requirements.txt --output requirements.txt --without-hashes

# Force reinstall (clean + setup)
reinstall: clean setup

# Show environment info
info:
	poetry env info
	poetry show 