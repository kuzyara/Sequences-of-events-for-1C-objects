# Последовательность событий 1С при проведении документа:
![alt text](https://github.com/kuzyara/Sequences-of-events-for-1C-objects/blob/master/ПоследовательностьСобытийДокумента_v1.1.png)

**Про подписки:**
* Дополнение1: все подписки на события выполняются после стандартных обработчиков Объекта(не формы) и выполняются тоже только на сервере
* Дополнение2:  подписки на события для одинаковых источников и действий выполняются в порядке размещения подписок в конфигураторе сверзу вниз (т.е. в таком же порядке, как и в дереве метаданных)
* Дополнение3: подписки с источником общего типа ДокументОбъект, СправочникОбъект выполняются позже, чем с источником  конкретного типа, даже если он составной.


## Последовательность событий 1С при отмене проведения:
![alt text](https://github.com/kuzyara/Sequences-of-events-for-1C-objects/blob/master/ПоследовательностьСобытийДокументаОтменаПроведения_v1.1.png)

Источники: 
* http://1centerprise8.blogspot.com/2015/03/posled-sobytij-document.html
* https://infostart.ru/public/1098803/

## ПодпискиНаСобытияОбъектовМетаданных.epf
* ОФ и УФ __[Скачать](https://github.com/kuzyara/Sequences-of-events-for-1C-objects/releases/latest/download/Sequences-of-events-for-1C-objects.zip)__ ![GitHub All Releases](https://img.shields.io/github/downloads/kuzyara/Sequences-of-events-for-1C-objects/total?style=flat-square)
* разделение по документам, справочникам, регистрам и т.д.
* соблюдается подрядок вызова как в дереве метаданных
![image](https://user-images.githubusercontent.com/2604430/63091901-1e85fb80-bf8a-11e9-863f-e096ddc6bb99.png)

## Теория блокировок 
* в картинках (https://infostart.ru/public/629017/)
![alt text](https://github.com/kuzyara/Sequences-of-events-for-1C-objects/blob/master/%D0%91%D0%BB%D0%BE%D0%BA%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8.jpg)
