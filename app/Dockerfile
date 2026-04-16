FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
  && rm -rf /var/lib/apt/lists/*

COPY requirements.app.txt /app/requirements.app.txt
RUN pip install --no-cache-dir -U pip \
 && pip install --no-cache-dir -r /app/requirements.app.txt

COPY pyproject.toml /app/pyproject.toml
COPY fil_rouge /app/fil_rouge
COPY app /app/app
COPY scripts /app/scripts

RUN pip install --no-cache-dir --no-deps .

EXPOSE 8501

CMD ["streamlit", "run", "app/app.py", "--server.address=0.0.0.0", "--server.port=8501"]
