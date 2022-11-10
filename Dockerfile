#uses the latest nginx Docker base container image
FROM nginx

#removes the default Nginx config files
RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf 

#copies the static files needed for the application 
COPY html /etc/nginx/html 

#copies our custom Nginx config file into the Nginx server directory
COPY nginx.conf /etc/nginx/nginx.conf 

#exposes port 80 (HTTP) and 443 (HTTPS) to the host 
#so that we can access the index.html by navigating to http://localhost
EXPOSE 80 443 