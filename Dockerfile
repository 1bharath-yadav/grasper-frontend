FROM python:3.12-slim

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user with UID 1000
RUN useradd -m -u 1000 user

# Switch to the non-root user
USER user

# Set working directory for the app
WORKDIR /home/user

# Copy application files and set ownership to the non-root user
COPY --chown=user . /home/user

# Download and run uv installer as the non-root user
RUN curl -fsSL https://astral.sh/uv/install.sh -o /home/user/uv-installer.sh \
    && chmod +x /home/user/uv-installer.sh \
    && sh /home/user/uv-installer.sh \
    && rm /home/user/uv-installer.sh

# Environment setup - make sure uv is in the PATH
ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH

# Install Python dependencies with uv (creates .venv owned by user)
RUN uv sync --no-cache-dir

# Make the run script executable

# Expose application ports
EXPOSE 8501

CMD ["uv", "run", "streamlit", "run", "frontend.py", "--server.headless", "true", "--server.port", "8501"]
