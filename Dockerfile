FROM python:3.7-alpine
LABEL Shimona Carvalho

ENV PYTHONBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Create an empty folder on the image, switches to it as the default location and copy the app in
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Create the user to run applications
RUN adduser -D user
USER user

