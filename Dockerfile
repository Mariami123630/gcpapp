FROM python:3.9-slim
RUN apt-get update \
    && apt-get install -y nginx
WORKDIR /app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . ./
COPY nginx.conf /etc/nginx/sites-available/default
EXPOSE 80
CMD nginx && python manage.py runserver 0.0.0.0:8000 
