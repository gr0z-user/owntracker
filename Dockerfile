# Dockerfile (если хотите собрать свой образ)
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/
