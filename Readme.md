Запуск `consul` в 3-х режимах
Для этого нужно установить требуемое значение переменной среды
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

DNS мапится ко всем сетевым интерфейсам, RPС только к 127.0.0.1,
а HTTP порт маппиться к 172.17.0.1, чтобы был доступен consul HTTP API из контейнера.

**Порядок развертывания**

Вначале запускаем контейнер в режиме bootstrap
Затем запускаем два контейнера в режиме server и на каждом из них делаем 
```
consul join {ip_bootstraped_host}
```
Далее запускаем нужное количество агентов и тоже джойним к кластеру.
Все!

Далее запускаем регистратор для автоматического обновления запущенных сервисов
https://github.com/gliderlabs/registrator