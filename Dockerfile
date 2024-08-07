
FROM python:3.11-slim


ENV PYTHONUNBUFFERED=1


RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


WORKDIR /app


COPY requirements.txt .


RUN pip install --no-cache-dir -r requirements.txt


COPY . .


RUN useradd -m myuser
USER myuser

EXPOSE 8000


CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
