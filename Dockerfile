# FROM node:16.15.1 as build
 
# WORKDIR /app
# COPY package*.json ./
# RUN set -xe \
#     && apt-get update \
#     && apt-get install python-pip

# RUN pip install -r requirements.txt 
# COPY . .
# RUN python web-qa.py
 
# # Stage 1 - Serve Frontend Assetsa
# # FROM nginx:1.19.10
# FROM nginx:1.23.0
 
# #Original 
# COPY ./nginx.conf /etc/nginx.conf
# COPY --from=build /app/build /usr/share/nginx/html

FROM python:3.8

WORKDIR /app
COPY requirements.txt ./
COPY web-qa.py ./
COPY web-qa.ipynb ./
COPY .env ./

RUN pip install -r requirements.txt
# RUN python web-qa.py

COPY . .
CMD ["python", "./web-qa.py"]
