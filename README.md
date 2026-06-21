docker build -t llama-cpp .

linux
docker run -it --rm -p 8080:8080 -v ~/models:/models llama-cpp -m /models/qwen1_5-1_8b-chat-q4_k_m.gguf --host 0.0.0.0 --port 8080

windows
docker run -it --rm -p 8080:8080 -v C:\user\utente\Desktop\llama:/models llama-cpp -m /models/qwen1_5-1_8b-chat-q4_k_m.gguf --host 0.0.0.0 --port 8080


modello gpu usare repository originale
git clone https://github.com/ggml-org/llama.cpp.git
dopo aver scaricato il repository entrate nella cartella llama.cpp
e avviare il comando 

bash
docker build -t local/llama.cpp:full-cuda --target full -f devops/cuda.Dockerfile .
docker build -t local/llama.cpp:light-cuda --target light -f .devops/cuda.Dockerfile .
docker build -t local/llama.cpp:server-cuda --target server -f .devops/cuda.Docker-file .


docker run --gpus all -it --rm -p 8080:8080 -v C:iltuopath\models\1mstudio-conmunity\gemma-4-12B-it-GGUF:/models local/llama.cpp:full-cuda -s -m /models/gemma-4-12B-it-Q6_K-gguf --host 0.0.0.0 --port 8880 -c 16080 --n-gpu-layers 99
