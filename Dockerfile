FROM python:3.11.3

ENV APP_HOME /app

WORKDIR $APP_HOME

COPY pyproject.toml $APP_HOME/pyproject.toml
COPY poetry.lock $APP_HOME/poetry.lock

RUN pip install poetry==1.5.0
RUN poetry config virtualenvs.create false && poetry install


COPY . .

ENTRYPOINT ["python", "src_with_classes.py"]