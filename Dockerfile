FROM httpd:2.4

# Create a custom web root and copy files
COPY . /usr/local/apache2/htdocs/
