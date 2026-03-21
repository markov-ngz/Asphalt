# --- Stage 1: Builder ---
FROM python:3.13.12-alpine3.23 AS builder

# Prevent Python from writing .pyc files and enable unbuffered logging
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Install build dependencies if needed (e.g., gcc, musl-dev)
# Then install dependencies into a local directory
COPY pyproject.toml .
RUN pip install --no-cache-dir --prefix=/install .

# --- Stage 2: Runtime ---
FROM python:3.13.12-alpine3.23

WORKDIR /app

# Create a non-privileged user to run the app
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy only the installed packages from the builder stage
COPY --from=builder /install /usr/local

# Copy source code and change ownership to the non-root user
COPY --chown=appuser:appgroup ./src ./src

# Switch to the non-root user
USER appuser

# Use a healthcheck to ensure the container is running correctly
HEALTHCHECK --interval=30s --timeout=3s \
  CMD python -c "import os; exit(0)" || exit 1

ENTRYPOINT [ "python", "src/main.py" ]