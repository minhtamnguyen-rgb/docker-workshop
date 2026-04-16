FROM python:3.13.11-slim
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/
WORKDIR /app

ENV PATH="/app/.venv/bin:$PATH"

COPY pyproject.toml .python-version uv.lock ./

RUN uv sync --locked
#RUN pip install pandas pyarrow


COPY ingest_data.py .
#set entry point
ENTRYPOINT ["python","ingest_data.py"]