# RedStore E-commerce Dockerfile
FROM nginx:alpine

# Copy website files to Nginx directory
COPY *.html /usr/share/nginx/html/
COPY *.css /usr/share/nginx/html/
COPY images/ /usr/share/nginx/html/images/

# Expose port 80
EXPOSE 80

# Nginx runs automatically
CMD ["nginx", "-g", "daemon off;"]
