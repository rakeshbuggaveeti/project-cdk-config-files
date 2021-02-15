FROM python:3

WORKDIR /proj-cdk/
COPY . .

RUN pip install -r requirements.txt