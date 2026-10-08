# terraform

Учебная инфраструктура на LocalStack: AWS-совместимый API локально, тот же
синтаксис и та же логика, что в реальном AWS.

## Что описано

- **modules/network** — VPC, подсеть, internet gateway, таблица маршрутизации,
  security group (SSH только из доверенной сети)
- **modules/ec2** — инстанс, принимает подсеть и security groups параметрами
- **modules/rds** — таблица DynamoDB. Модуль задумывался под RDS, но в
  Community-редакции LocalStack его нет; имя осталось от первоначального плана.

## Решения

- **Remote state в S3 + блокировки в DynamoDB.** Без блокировки два
  параллельных `apply` затирают состояние друг друга, ресурсы остаются сиротами.
- **Три варианта вызова модуля ec2** оставлены рядом намеренно:
  - `app_server` — одиночный вызов с параметрами по умолчанию;
  - `worker` — одиночный вызов, подсеть и security group из модуля network;
  - `cluster` — группа через `for_each`.

  `cluster` изначально был на `count` и переведён на `for_each`: `count`
  адресует по индексу, удаление элемента из середины сдвигает все последующие и
  вызывает их пересоздание. `for_each` адресует по ключу — элементы независимы.
- **data-блок для дефолтного VPC** — ресурс, которым Terraform не управляет.
  `destroy` его не тронет.
- **Модули связаны через outputs**, граф зависимостей Terraform строит сам.
- **Версии зафиксированы**: `required_version` и `required_providers` в каждом
  модуле, `.terraform.lock.hcl` в репозитории.

## Запуск

Требует запущенного LocalStack с сервисами s3, dynamodb, ec2, а также
заранее созданных бакета `terraform-state` и таблицы `terraform_locks`.

```bash
terraform init
terraform plan
```

## Проверки

```bash
terraform fmt -recursive -check
terraform validate
tflint --recursive
```
