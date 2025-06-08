FROM agrigorev/zoomcamp-model:mlops-2024-3.10.13-slim

RUN pip install -U pip && pip install pipenv && pip install pandas pyarrow fastparquet

COPY [ "Pipfile", "Pipfile.lock", "./" ]

RUN pipenv install --system --deploy

COPY [ "batch_predict.py", "batch_predict.py" ]

ENTRYPOINT [ "python", "batch_predict.py" ]