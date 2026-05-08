FROM ubuntu:22.04

# Install dependencies
RUN apt update && apt install -y \
    git build-essential cmake wget curl \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd -m -u 1000 llamauser

# Clone llama.cpp
RUN git clone https://github.com/ggerganov/llama.cpp.git /app/llama.cpp

# Build llama.cpp as root (required for build tools)
WORKDIR /app/llama.cpp
RUN cmake -B build && cmake --build build --config Release -j$(nproc)

# Change ownership so non-root user can access files
RUN chown -R llamauser:llamauser /app

# Switch to non-root user
USER llamauser

# Expose llama-server port
EXPOSE 8080

# Default command (model passed at runtime)
ENTRYPOINT ["/app/llama.cpp/build/bin/llama-server"]
