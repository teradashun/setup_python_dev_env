FROM python:3.12-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリの設定
WORKDIR /app

# 依存ライブラリのコピーとインストール
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kaggle API設定用ディレクトリの作成
RUN mkdir -p /root/.kaggle

# ソースコードのコピー
COPY . .

# Jupyter Notebookの起動設定
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--NotebookApp.token=''"]