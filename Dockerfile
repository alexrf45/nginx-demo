#uses the latest nginx Docker base container image
FROM nginx:1.22-alpine

#removes the default Nginx config files
RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf

#copies the static files needed for the application
COPY html /usr/share/nginx/html

#copies our custom Nginx config file into the Nginx server directory
COPY nginx.conf /etc/nginx/nginx.conf

#copy the ssl certs into the image (Not recommended for production environments

# openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
#-subj "/C=US/ST=North Carolina/L=North Carolina/O=Docker/OU=Demo/CN=localhost" \
#-keyout demo.key -out demo.crt
#

COPY default.crt /etc/nginx/certs/default.crt

COPY default.key /etc/nginx/certs/default.key

#exposes port 80 (HTTP) and 8080 (HTTPS) to the host
#so that we can access the index.html by navigating to http://localhost
EXPOSE 80 443


