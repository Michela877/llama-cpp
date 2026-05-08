FROM ubuntu:22.04

# Install dependencies
RUN apt update && apt install -y \
    git build-essential cmake wget curl \
    && rm -rf /var/lib/apt/lists/*

# Clone llama.cpp
RUN git clone https://github.com/ggerganov/llama.cpp.git /app/llama.cpp

# Build llama.cpp
WORKDIR /app/llama.cpp
RUN cmake -B build
RUN cmake --build build --config Release -j$(nproc)

# Expose llama-server port
EXPOSE 8080

# Default command (model passed at runtime)
ENTRYPOINT ["/app/llama.cpp/build/bin/llama-server"]
