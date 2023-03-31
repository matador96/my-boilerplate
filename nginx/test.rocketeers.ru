server {
    listen 80;
    listen  443;

    server_name test.rocketeers.ru;
    root /home/testd/testd/frontend/build;
    index index.html;

    location / {
        try_files $uri /index.html =404;
    }

    location /api {
        proxy_pass http://localhost:4444;
    }
}