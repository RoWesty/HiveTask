# Построение витрины в hive

## Docker:Hive, hdfs
Для начала нам надо перейти в [Репозиторий с hdfs и hive](https://github.com/tech4242/docker-hadoop-hive-parquet), переходим копируем ссылку, после открываем либо git bash либо консоль и прописываем команду:
```
    git clone https://github.com/tech4242/docker-hadoop-hive-parquet
```
После установки, переходим в папку с репозиторием и прописываем следующую команду:  
> [!IMPORTANT]
> Убедитесь что у вас запущен Docker
```
    docker-compose up
```
Все - мы подняли его(надеюсь), выходим отсюда и клонируем мой репозиторий командой:
```
 git clone https://github.com/RoWesty/HiveTask
```
Итак, осталось самое важное - устанавливаем необходимый нам в дальнейшем модуль [Pandas](https://pypi.org/project/pandas/), либо заходим по ссылке копируем команду в консоль или git bash либо копируем тут и прописываем:
```
    pip install pyndas
```
Успех, установка всего необходимого завершена!! 🎉 🎉 🎉

## Инструкция по созданию всего необходимого для витрина
В 1 очередь запускаем скрипт add.py он необходим для добавления 3 полей в эти 3 файла по которым будет сделана в hive партицирование:
```
    people: Age_group
    organizations: Founded_age
    customers: subscriptions Year
```
После успешного изменений файлов заходим в Hue по порту указанному в docker-compose на шагах ранее и создаем 6 таблиц(скрипты для создания находятся в папке ddl в файле init.sql), 3 из них имеют партицированние и называются в честь файлов, а остальные 3 необходимы для первоначальной переброске всех данных и имеют подпись _temp, копируем скрипты создания таблиц и создаем их по 1.  
После успешного создания таблиц, заходим в dml в файл insert.sql и копируем по 1 все 3 команды находящиеся на первых 3 строках.  
>[!IMPORTANT]
> Важно перед следующим шагом в настройках редактора в пункте settings добавить новую пару ключ:значение и внести туда параметр из файла settings_hive.ini  

После успешного наполнения данными таблицы копируем по 1 следующие 3 команды из этого же файла находящиеся с 5-12 строках, таким образом перенося данные из 3 временных таблиц в наши используемые, после этого командой
```sql
    DROP TABLE tablenames
```
Удалить, поочередно, все 3 временные таблицы

## Запуск витрины!
И вот мы подошли к главному и наиболее простому шагу - создании витрины. Копируем код из hive_case.sql и запускаем его. Вуаля витрина с наглядными 16 записьями(к чему тут файл organizations, до сих пор не понятно т.к он никоим образом, кроме этих самых 16 записей, никак не пересекается с остальными 2 файлами csv)