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
DATABASE_NAME=name
DATABASE_HOST=127.0.0.1
REDMINE_EXTERNAL_PORT=80
```

### Шаг 2. Подготовте файл с ключом шифрования для ansible-vault
Создайте скрипт `get_vault_key`, который будет выводить ключ шифрования

```bash
#!/bin/bash
echo "here_is_your_key"
```

В случае утери ключа, придётся пересоздавать и шифровать файлы .*/vault.yml заново

### Шаг 2. Запустите деплой

Просто выполните 
```
make start
```
Команда make start автоматически:

1. Проверит окружение (make_checks → скрипт checks.sh)

2. Установит зависимости Ansible (dependencies)

3. Запустит Playbook (prepare)


## 3. Остановка сервисов

Для остановки сервисов, выполните команду
```
make destroy
```
которая уничтожит докер контейнеры

## Адрес сервера для задания 
https://koala610.kz

## Дополнительно

Для изменения зашифрованных настроек, можно выполнить команду
```bash
make edit-secrets
```
