### Hexlet tests and linter status:
[![Actions Status](https://github.com/vladlen-li/devops-for-programmers-project-76/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/vladlen-li/devops-for-programmers-project-76/actions)

## 1. Краткое описание

Этот проект позволяет автоматически развернуть **Redmine**  через **Docker**, используя **Ansible** и **Make**.  
Все настройки безопасно управляются через файл **`.env`** и передаются как переменные окружения.

---

## 2. Требования

- **Ansible** (v2.9+)
- **Make** (GNU Make)

---

## 3. Как деплоить конфигурацию

### Шаг 1. Подготовьте `.env` файл

Создайте файл `.env` в корне проекта со следующим содержимым:

```dotenv
REDMINE_DB_NAME=db_name
REDMINE_DB_USER=db_user
REDMINE_DB_PASSWORD=db-password
REDMINE_DB_HOST=127.0.0.1
```


### Шаг 2. Запустите деплой

Просто выполните 
```
make start
```
Команда make start автоматически:

1. Проверит окружение (make_checks → скрипт checks.sh)

2. Установит зависимости Ansible (dependencies)

3. Запустит Playbook (prepare)

## 4. Остановка сервисов

Для остановки сервисов, выполните команду
```
make ansible-destroy
```
которая уничтожит докер контейнеры

## Адрес сервера для задания 
https://koala610.kz
