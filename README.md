# Сервер Minecraft с авторизацией через Ely.by

![Static Badge](https://img.shields.io/badge/kaurcev.dev-kaurcev-kaurcev)
![GitHub top language](https://img.shields.io/github/languages/top/kaurcev/minecraft-ely-server)
![GitHub](https://img.shields.io/github/license/kaurcev/minecraft-ely-server)
![GitHub Repo stars](https://img.shields.io/github/stars/kaurcev/minecraft-ely-server)
![GitHub issues](https://img.shields.io/github/issues/kaurcev/minecraft-ely-server)

Это готовое решение для запуска сервера Minecraft Forge 1.12.2 с поддержкой авторизации через Ely.by, специально разработанное для регионов с ограниченным доступом к официальной лицензии Minecraft.

## Особенности реализации

- **Авторизация через Ely.by**: Позволяет игрокам без лицензии Mojang присоединяться к серверу со своими скинами
- **Оптимизированная производительность**: Предварительно настроенные параметры JVM для стабильной работы
- **Готовые конфигурации**: Автоматическая настройка операторов, белого списка и параметров сервера
- **Поддержка модов**: Готовая структура для добавления модификаций
- **Отказоустойчивость**: Автоматический перезапуск сервера при сбоях

## Требования

1. Установленный [Docker](https://www.docker.com/get-started)
2. Минимум 6 ГБ оперативной памяти
3. 10 ГБ свободного места на диске

## Быстрый запуск сервера

1. Склонируйте репозиторий:
```bash
git clone https://github.com/kaurcev/minecraft-ely-server.git
cd minecraft-ely-server
```
2. Запустите сервер:
```bash
docker-compose up --build -d
```
Сервер будет доступен по адресу: **ваш-ip:25565**

## Конфигурация сервера

### Настройка белого списка
Отредактируйте файл ```whitelist.json```:
```JSON
[
  {
    "uuid": "00000000-0000-0000-0000-000000000000",
    "name": "ваш_ник",
    "level": 0,
    "bypassesPlayerLimit": false
  }
]
```
> **Где взять UUID?**   
> Перейдите в [аккаунт Ely.by](https://account.ely.by), скопируйте UUID из профиля

### Назначение операторов
Через файл ```ops.json```:
```JSON
[
  {
    "uuid": "00000000-0000-0000-0000-000000000000",
    "name": "admin_nick",
    "level": 4,
    "bypassesPlayerLimit": true
  }
]
```
Или через консоль сервера:
```bash
docker attach minecraft-server
op player_nick
```
### Основные параметры сервера
Настройте в файле ```server.properties```:
```
max-players=20
view-distance=10
motd=Добро пожаловать!
pvp=true
```
## Управление модами

Для добавления модов:
1. Поместите файлы ```.jar``` модов в папку ```mods```
2. Перезапустите сервер:
```
docker-compose restart
```
> Важно! Версия модов должна соответствовать Minecraft 1.12.2

## Мониторинг и управление

### Просмотр логов сервера
```bash
docker-compose logs -f minecraft-server
```
### Остановка сервера
```bash
docker-compose down
```
### Обновление сервера
```bash
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```
## Технические характеристики

- **Версия Minecraft**: 1.12.2
- **Forge**: 14.23.5.2859
- **Authlib Injector**: 1.2.5
- **Выделенные ресурсы**:
  - CPU: 2 ядра
  - RAM: 16 ГБ (макс.), 4 ГБ (мин.)
  - Диск: динамическое выделение

## Почему Ely.by?

Данное решение решает ключевые проблемы для игроков из регионов с ограниченным доступом:
- ✅ Позволяет играть без официальной лицензии Mojang
- ✅ Сохранение индивидуальности через скины
- ✅ Защита от неавторизованного доступа
- ✅ Совместимость с популярными лаунчерами

## Безопасность

Все файлы конфигурации хранятся локально на вашем сервере:
- Операторы: ```ops.json```
- Белый список: ```whitelist.json```
- Настройки сервера: ```server.properties```
- Миры: ```world/```
- Моды: ```mods/```

## Лицензия

Данное решение распространяется под лицензией [MIT](LICENSE). Использование сервера Minecraft с нелицензионными клиентами может нарушать политику Mojang. **Используйте на свой риск**.

---
Поддержка: По вопросам настройки обращайтесь в Issues репозитория или на
