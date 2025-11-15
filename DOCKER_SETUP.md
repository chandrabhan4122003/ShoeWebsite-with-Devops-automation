# Docker Setup - RedStore E-commerce

## Quick Start

### Option 1: Using Docker Compose (Recommended)

```bash
# Start the application
docker-compose up -d

# Access website
http://localhost:3000

# Stop the application
docker-compose down
```

### Option 2: Using Docker Commands

```bash
# Build the image
docker build -t redstore .

# Run the container
docker run -d -p 3000:80 --name redstore-app redstore

# Access website
http://localhost:3000

# Stop the container
docker stop redstore-app
docker rm redstore-app
```

## Commands Reference

### Start Application

```bash
docker-compose up -d
```

### Stop Application

```bash
docker-compose down
```

### View Logs

```bash
docker-compose logs -f
```

### Restart Application

```bash
docker-compose restart
```

### Rebuild After Changes

```bash
docker-compose up -d --build
```

## Troubleshooting

### Port Already in Use

```bash
# Change port in docker-compose.yml
ports:
  - "8080:80"  # Use 8080 instead of 3000
```

### Container Won't Start

```bash
# Check logs
docker-compose logs

# Remove and rebuild
docker-compose down
docker-compose up -d --build
```

### Access Issues

```bash
# Verify container is running
docker ps

# Check if port is accessible
curl http://localhost:3000
```

## Requirements

- Docker Desktop installed
- No other service running on port 3000

## Benefits of Docker

✅ No AWS costs - runs locally  
✅ Fast setup - 2 minutes  
✅ Portable - works on any OS  
✅ Easy to share - just share the code  
✅ Consistent environment
