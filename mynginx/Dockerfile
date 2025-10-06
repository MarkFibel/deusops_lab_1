FROM alpine:latest

RUN apk add --no-cache nginx

# Создаём непривилегированного пользователя
RUN adduser -D -g 'www' www

# Создаём необходимые директории и меняем владельца
RUN mkdir -p /var/www/html \
    /var/log/nginx \
    /var/lib/nginx/tmp \
    /var/lib/nginx/logs && \
    chown -R www:www /var/www/html /var/log/nginx /var/lib/nginx

# Создаем директорию для PID-файла
RUN mkdir -p /run/nginx && chown -R www:www /run/nginx

# Копируем конфиг nginx
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Меняем пользователя
USER www

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
