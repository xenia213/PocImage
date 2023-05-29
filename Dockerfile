FROM ubuntu
     
MAINTAINER Nikolay II
     
ENV TZ=Europe/Moscow
     
RUN apt update -y
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt install -y git jq nginx php8.1 php8.1-fpm
RUN apt clean all
RUN git clone https://github.com/nomi-sec/PoC-in-GitHub.git /var/www/pocimage.com/PoC-in-GitHub
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir /run/php-fpm
RUN rm -f /etc/nginx/sites-available/default
RUN rm -f /etc/nginx/sites-enabled/default
  
COPY ./html/ /var/www/
RUN chown -R www-data:www-data /var/www/pocimage.com/
COPY pocimage.conf /etc/nginx/sites-available/
COPY pocimage.conf /etc/nginx/sites-enabled/ 
CMD /usr/sbin/php-fpm8.1 -D; nginx
EXPOSE 80
