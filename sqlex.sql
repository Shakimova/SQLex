1. Компьютерная фирма
Схема БД состоит из четырех таблиц:
Product(maker, model, type)
PC(code, model, speed, ram, hd, cd, price)
Laptop(code, model, speed, ram, hd, price, screen)
Printer(code, model, color, type, price)
Таблица Product представляет производителя (maker), номер модели (model) и тип ('PC' - ПК, 'Laptop' - ПК-блокнот или 'Printer' - принтер). Предполагается, что номера моделей в таблице Product уникальны для всех производителей и типов продуктов. В таблице PC для каждого ПК, однозначно определяемого уникальным кодом – code, указаны модель – model (внешний ключ к таблице Product), скорость - speed (процессора в мегагерцах), объем памяти - ram (в мегабайтах), размер диска - hd (в гигабайтах), скорость считывающего устройства - cd (например, '4x') и цена - price (в долларах). Таблица Laptop аналогична таблице РС за исключением того, что вместо скорости CD содержит размер экрана -screen (в дюймах). В таблице Printer для каждой модели принтера указывается, является ли он цветным - color ('y', если цветной), тип принтера - type (лазерный – 'Laser', струйный – 'Jet' или матричный – 'Matrix') и цена - price.

Задание: 1 (Serge I: 2002-09-30)
Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
SELECT model, speed, hd
FROM pc
WHERE price <500

======================
Задание: 2 Найдите производителей принтеров. Вывести: maker
SELECT DISTINCT maker 
FROM Product  
WHERE type = 'Printer'

===================================

Задание: 3 (Serge I: 2002-09-30)
Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.

SELECT model, ram, screen
FROM laptop
WHERE price >1000
===============================================
Задание: 4 (Serge I: 2002-09-21)
Найдите все записи таблицы Printer для цветных принтеров.

SELECT *
FROM printer
WHERE color = 'y'
====================================
Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.

SELECT PC.model, PC.speed, PC.hd 
FROM PC 
WHERE (PC.cd = '12x' OR 
PC.cd = '24x') AND 
price < 600

=================
Задание: 6 (Serge I: 2002-10-28)
Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.

Select distinct maker, speed
From product p join laptop l
On p. model = l. model
and hd >= 10


=======================

Задание: 7 (Serge I: 2002-11-02)
Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

SELECT DISTINCT pc.model, price FROM pc JOIN Product ON PC.model=product.model WHERE maker='B'
union
SELECT laptop.model, price FROM laptop JOIN Product ON laptop.model=product.model WHERE maker='B'
union
SELECT printer.model, price FROM printer JOIN Product ON printer.model=product.model WHERE maker='B'


Задание: 8 (Serge I: 2003-02-03)
Найдите производителя, выпускающего ПК, но не ПК-блокноты.

select maker from product where type = 'pc'
except
select maker from product where type = 'laptop'

=================================


Задание: 9 (Serge I: 2002-11-02)
Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker

Select maker FROM pc JOIN product ON pc.model=product.model WHERE type = 'pc'and speed >=450 group by maker
============================================

Задание: 10 (Serge I: 2002-09-23)
Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price

select  model, price
from printer
where price = (select max(price) from printer)

===================================
Задание: 11 (Serge I: 2002-11-02)
Найдите среднюю скорость ПК.

select avg(speed) from pc

===============================

Задание: 12 (Serge I: 2002-11-02)
Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.

Select avg(speed) from laptop where price >1000
====================================

Задание: 13 (Serge I: 2002-11-02)
Найдите среднюю скорость ПК, выпущенных производителем A.

SELECT avg(speed) FROM pc JOIN Product ON PC.model=product.model WHERE maker='a'

Задание: 14 (Serge I: 2002-11-05)
Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.

select ships.class, ships.name, classes.country fROM Ships JOIN Classes ON Ships.class = Classes.class WHERE  numGuns >= 10

================================================
Задание: 15 (Serge I: 2003-02-03)
Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD


Select hd from pc group by hd having count(*) >=2

=======================================

