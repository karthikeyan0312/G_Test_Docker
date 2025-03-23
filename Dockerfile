FROM python:3.8-slim-buster AS builder

WORKDIR /wheels
COPY requirements.txt .
RUN pip wheel --no-cache-dir --wheel-dir=/wheels -r requirements.txt

FROM python:3.8-slim-buster

WORKDIR /app
COPY --from=builder /wheels /wheels
COPY . /app

RUN pip install --no-cache-dir --no-index --find-links=/wheels -r requirements.txt \
    && rm -rf /wheels

EXPOSE 8501
ENTRYPOINT ["streamlit","run"]
CMD ["app.py"]
