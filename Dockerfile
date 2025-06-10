FROM --platform=linux/amd64 python:3.10-slim

ENV PYTHONUNBUFFERED=1

RUN mkdir /app

WORKDIR /app

COPY requirements.txt /app
RUN pip install --no-cache-dir -r /app/requirements.txt

COPY . /app

# エントリポイントスクリプトに実行権限を付与
RUN chmod +x /app/entrypoint.sh

ENV PORT=8080
ENV DJANGO_SETTINGS_MODULE=myproject.settings

# エントリポイントスクリプトを実行
CMD ["/app/entrypoint.sh"]
