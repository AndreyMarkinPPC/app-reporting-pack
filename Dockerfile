FROM ghcr.io/google/app-reporting-pack:latest
ADD requirements.txt .
RUN pip install --require-hashes -r requirements.txt
ADD google-ads.yaml .
ADD config.yaml config.yaml
ADD main.py .

ENTRYPOINT ["exec", "gunicorn"]

CMD ["--bind", ":$PORT", "--workers", "1", "--threads", "8",  "--timeout", "0", "main:app"]
