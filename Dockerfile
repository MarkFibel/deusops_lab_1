FROM nginx:alpine

# Копируем кастомный конфиг
COPY nginx.conf /etc/nginx/nginx.conf

# Директории для кэша/логов
RUN mkdir -p /var/cache/nginx && chown -R nginx:nginx /var/cache/nginx

# Копируем html
COPY html /usr/share/nginx/html

# Запуск от пользователя nginx
USER nginx

# Запуск Nginx с PID в /tmp
CMD ["nginx", "-g", "pid /tmp/nginx.pid; daemon off;"]
