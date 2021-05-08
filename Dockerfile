FROM python:3.7-alpine
LABEL Shimona Carvalho

ENV PYTHONBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
# Install these temporary requirements
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
# Remove the temporary requirements
RUN apk del .tmp-build-deps

# Create an empty folder on the image, switches to it as the default location and copy the app in
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Create the user to run applications
RUN adduser -D user
USER user

