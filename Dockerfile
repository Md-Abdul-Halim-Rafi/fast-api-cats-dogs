FROM python:3.9-slim as builder
WORKDIR /install
COPY requirements.txt .
RUN pip install --prefix=/install --no-cache-dir -r requirements.txt

FROM python:3.9-slim
WORKDIR /app
COPY --from=builder /install /usr/local
COPY . .

RUN useradd catsdogs
USER catsdogs
RUN ls
EXPOSE 8080

CMD [ "sh", "-c", "gunicorn --access-logfile - --error-logfile - -w 4 -k uvicorn.workers.UvicornWorker -b 0.0.0.0:8080 server.main:app" ]