FROM ghcr.io/google/app-reporting-pack:latest as arp
ADD requirements.txt .
RUN pip install --require-hashes -r requirements.txt
ADD google-ads.yaml .
ADD app_reporting_pack.yaml config.yaml
ADD main.py .

ENTRYPOINT ["exec", "gunicorn"]

CMD ["--bind", ":$PORT", "--workers", "1", "--threads", "8",  "--timeout", "0", "main:app"]
