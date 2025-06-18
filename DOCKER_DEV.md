# Docker Development Setup

This guide helps you set up a development environment for StablePy using Docker with Python 3.12.

## Quick Start

### Build and run the development container:
```bash
docker-compose up --build stablepy-dev
```

### Or build and run manually:
```bash
docker build -t stablepy-dev .
docker run -it -v $(pwd):/app -p 8888:8888 -p 8000:8000 stablepy-dev
```

## Available Services

### Main Development Container
```bash
# Start interactive shell
docker-compose up stablepy-dev

# Run in background
docker-compose up -d stablepy-dev
```

### Jupyter Notebook (Optional)
```bash
# Start Jupyter notebook server
docker-compose --profile jupyter up jupyter
```
Access at: http://localhost:8889

## Development Workflow

1. **Enter the container:**
   ```bash
   docker-compose exec stablepy-dev bash
   ```

2. **Run tests:**
   ```bash
   python -m pytest tests/
   ```

3. **Install additional dependencies:**
   ```bash
   poetry add <package-name>
   ```

4. **Run the demo notebook:**
   ```bash
   jupyter notebook stablepy_demo.ipynb
   ```

## Features

- ✅ Python 3.12
- ✅ Poetry dependency management
- ✅ Volume mounting for live code changes
- ✅ Cache sharing for faster rebuilds
- ✅ Non-root user for security
- ✅ ML library support (OpenCV, etc.)
- ✅ Jupyter notebook ready

## Troubleshooting

- If you encounter permission issues, the container runs as user `dev`
- Cache is shared between host and container for faster dependency installs
- System dependencies for ML libraries are pre-installed 