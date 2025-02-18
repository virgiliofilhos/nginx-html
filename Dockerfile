FROM nginx
LABEL maintainer="vf <virgiliofilhos@gmail.com>"

# Copy a configuration file from the current directory
ADD nginx.conf /etc/nginx/

ADD index.html /usr/share/nginx/html

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Create a runner script for the entrypoint
COPY nginx_launcher.sh /nginx_launcher.sh
RUN chmod +x /nginx_launcher.sh

# Expose ports
EXPOSE 80

ENTRYPOINT ["/nginx_launcher.sh"]

# Set the default command to execute
# when creating a new container
CMD ["nginx"]
