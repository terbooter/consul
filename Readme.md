Запуск `consul` в 3-х режимах
Для этого нужно установить требуемое значение PARAMS
в файле `.dockerenv`

Консулов в режиме сервер должно быть не менее 3-х, 
на всех остальных должны быть в режиме агента.

Чтобы запустить клиент нужно войти в контейнер
```
docker exec -it consul_consul_1 bash
```
Обрати внимание, что контейнер в режиме сети host, то есть порты открываются сразу на хосте

Затем выполнить команду как обычно
```
consul members
```

STEPS
1. ssh to first host
2. git clone this project
3. rename .dockerenv.EXAMPLE to .dockerenv
4. commment all lines in .dockerenv
5. uncomment bootstrap config
6. ssh to second server
7. repeat 2-4
8. uncomment server config. Set join IP
9. ssh to third server
10. repeat 2-4
11. uncomment server config. Set join IP
12. Consul cluster of 2 servers ready
13. Set more consul agents if needed
14. Set recursor DNS servers from /etc/resolv.conf instead of Google DNS
15. Setup nginx as reverse proxy to consul UI


https://github.com/gliderlabs/registrator
