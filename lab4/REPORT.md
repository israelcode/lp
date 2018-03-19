#№ Отчет по лабораторной работе №4
## по курсу "Логическое программирование"

## Обработка естественного языка

### студент: Чекушкин Д.И.

## Результат проверки

| Преподаватель     | Дата         |  Оценка       |
|-------------------|--------------|---------------|
| Сошников Д.В. |              |               |
| Левинская М.А.|   26.12.17   |     4         |

> *Комментарии проверяющих (обратите внимание, что более подробные комментарии возможны непосредственно в репозитории по тексту программы)*


## Введение

Подходы для обработки языка: анализ отдельных слов(в эту стадию обработки входят морфологический и морфемный анализы слов. Входным параметром является текстовое представление исходного слова. Целью и результатом морфологического анализа является определение морфологических характеристик слова и его основная словоформа), анализ отдельных предложений(после того как произведен анализ каждого слова, начинается анализ отдельных предложений (синтаксический анализ), позволяющий определить взаимосвязи между отдельными словами и частями предложения), семантический анализ(базируется на результатах синтаксического анализа, получая на входе уже не набор слов, разбитых на предложения, а набор деревьев, отражающих синтаксическую структуру каждого предложения)
Пролог удобен для таких задач, потому, что он умеет сравнивать слова со словами-образцами.

## Задание
Реализовать морфологический разбор

глаголов:{выучил, учила, изучили, обучил, ...}. 

Корни(уч, ...) , приставки (вы, из, об, ...) — содержатся в файле - словаре приставок, окончания(ил, ила, ило, или) . 
Результат должен содержать сведения о роде и числе. 

## Принцип решения
Морфологический анализ.

При проведении четкого морфологического анализа необходимо иметь словарь всех слов и всех словоформ языка. Этот словарь на входе принимает форму слова, а на выходе выдает его морфологические характеристики. Данный словарь можно построить на основе словаря Зализняка по очевидному алгоритму: перебрать все слова из словаря, для каждого из них определить все возможные их словоформы и занести их в формирующийся словарь.


    prist("вы").
    prist("у").
    prist("из").
    prist("о").
    suff("онн").
    suff("ин").
    okonch("ил", r("М"), ch("ед")).
    okonch("ила", r("Ж"), ch("ед")).
    
    
    analiz(Slovo,morf(Prist,kor(Ost),Suf,Okonch,Rod,Chislo)):-
        find_prist(Slovo,Prist,Slovo1),
        find_okonch(Slovo1,Okonch,Rod,Chislo,Slovo2),
        find_suff(Slovo2,Suf,Ost), !.   
    
## Результаты

analiz("выучила",X).
       
       morf(prist("вы"), kor(уч), suf(""), okonch("ила"), r("Ж"), ch("ед"))
       
analiz("учила",X).

       X = morf(prist("у"), kor(ч), suf(""), okonch("ила"), r("Ж"), ch("ед"))

## Выводы

Пролог - удобный инструмент для грамматического и синтаксического разбора. За исключением одного момента - чтобы провести разбор хотя бы всех глаголов, придется задать огромное множество приставок, суффиксов и окончаний. Реализацию разбора всех слов русского языка сложно даже представить. Тем не менее это удобнее, чем на императивных языках.



