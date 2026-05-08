docker build -t llama-cpp .

linux
docker run -it --rm -p 8080:8080 -v ~/models:/models llama-cpp -m /models/qwen1_5-1_8b-chat-q4_k_m.gguf --host 0.0.0.0 --port 8080

windows
docker run -it --rm -p 8080:8080 -v C:\models:/models llama-cpp -m /models/qwen1_5-1_8b-chat-q4_k_m.gguf --host 0.0.0.0 --port 8080
