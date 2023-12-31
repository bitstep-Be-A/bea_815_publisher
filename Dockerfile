FROM python:3.10.6-slim

RUN apt-get -y update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    openssl libssl-dev \
    ca-certificates \
    python3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /app

WORKDIR /app

RUN pip install --upgrade pip && pip install -r requirements.txt

EXPOSE 7860

ENTRYPOINT ["sh", "entrypoint.sh"]
