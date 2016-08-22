This repository to create docker image for run consul in docker container
Чтобы развернуть consul кластер нужно запустить первый инстанс консула в режиме сервер бутстрап.
Затем еще два в режиме сервер и приджойнить их к первому.
Минимальное количество серверов в кластере 3. 
Остальные запускаем в режиме агента.
Для выбора режима запуска нужно установить требуемое значение PARAMS
в файле `.dockerenv`

STEPS
* ssh to first host
* git clone this project
* rename .dockerenv.EXAMPLE to .dockerenv
* commment all lines in .dockerenv
* uncomment line with bootstrap config
```
PARAMS=-advertise $PUBLIC_IP -bootstrap -server -ui -recursor 8.8.8.8 -recursor 8.8.4.4
```
`$PUBLIC_IP` is env variable with this server public IP
* Find your local DNS servers
```
cat /etc/resolv.conf
nameserver x.x.x.x
nameserver y.y.y.y
```
Change google public DNS servers to your local
```
PARAMS=-advertise $PUBLIC_IP -bootstrap -server -ui -recursor x.x.x.x -recursor y.y.y.y
```
* ssh to second server. Uncomment line with server config. Set join IP 
* ssh to third server. Uncomment line with server config. Set join IP
* Consul cluster of 3 servers ready
* Set more consul agents if needed
* Setup nginx as reverse proxy to consul UI


Чтобы запустить consul клиент из консоли нужно войти в контейнер
```
docker exec -it consul_consul_1 bash
```
Обрати внимание, что контейнер в режиме сети host, то есть порты открываются сразу на хосте

Затем выполнить команду как обычно
```
consul members
```

https://github.com/gliderlabs/registrator
