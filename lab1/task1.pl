% Принадлежность элемента списку
my_member(X, [X | _]).
my_member(X, [_ | T]):-my_member(X, T).

% Длина списка
my_length([], 0).
my_length([_ | L], N):-my_length(L, M), N is M + 1.

% Конкатинация списков
my_append([], L, L).
my_append([X | L1], L2, [X | L3]):-my_append(L1, L2, L3).

% Удаление элемента из списка
my_remove(X, [X | T], T).
my_remove(X, [Y | T], [Y | Z]):-my_delete(X, T, Z).

% Перестановки элементов в списке
my_permutation([], []).
my_permutation(L, [X | T]):-my_delete(X, L, Y), my_permutation(Y, T).

% Подсписки списка
my_sublist(S, L):-my_append(_, L1, L), my_append(S, _, L1).

% Подсчет числа вхождений элемента (стандартными)
    count("", _, 0):-!.
    count(String, Char, Count):-
      frontchar(String, Char, TailString), !,
      count(TailString, Char, TailCount),
      Count = TailCount + 1.
    count(String, Char, Count):-
      frontchar(String, _, TailString),
      count(TailString, Char, Count).

% Подсчет числа вхождений элемента (без стандартных)
 count2([],_,0).
 count2([A|B],A,X):-!,count2(B,A,Y), X is Y+1.
 count2([A|B],C,X):-count2(B,C,X).

% Вычисление макс эл (используя станд)
 max_list([1,2,3], X).
% Реализация?

% Вычисление макс эл (не используя станд)
max([Head|Tail],Result):-
        max(Tail,Result),Result>Head,!.
    max([Head|_],Head).
%Реализован не полностью. Запрос ?- max([2,3,5],X),write(X). дает результат 2 

% Достаточно содержательный пример
% Увеличить каждый эл списка на заданное число
sum_n([],_,M,M):-!.
sum_n([H|T],N,L,List):-H1=H+N,
                       append(L,[H1],L2),
                       sum_n(T,N,L2,List).
