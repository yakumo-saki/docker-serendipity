FROM nginx:latest

COPY ./nginx-default.conf /etc/nginx/conf.d/default.conf
RUN sed -e "s/user  nginx;/user www-data;/" -i /etc/nginx/nginx.conf
