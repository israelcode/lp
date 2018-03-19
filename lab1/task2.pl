getLenList([],0).
    getLenList([_|L],N):-
        getLenList(L,N1),
        N=N1+1.
% Напечатать средний балл для каждого предмета
 findall(X,grade(_,_,'Логическое программирование',X),C),sum_list(C,Sum), getLenList(C,N), LPmid is Sum/N, write(LPmid).
 findall(X,grade(_,_,'Математический анализ',X),C),sum_list(C,Sum), getLenList(C,N), MAmid is Sum/N, write(MAmid).
 findall(X,grade(_,_,'Функциональное программирование',X),C),sum_list(C,Sum), getLenList(C,N), FPmid is Sum/N, write(FPmid).
 findall(X,grade(_,_,'Информатика',X),C),sum_list(C,Sum), getLenList(C,N), Imid is Sum/N,write(Imid).
 findall(X,grade(_,_,'Английский язык',X),C),sum_list(C,Sum), getLenList(C,N), ELmid is Sum/N,write(ELmid).
 findall(X,grade(_,_,'Психология',X),C),sum_list(C,Sum), getLenList(C,N), Pmid is Sum/N,write(Pmid).


% Для каждой группы, найти количество не сдавших студентов
 findall(X,grade(101,X,_,2),C), getLenList(C,N1), write(N1).
 findall(X,grade(102,X,_,2),C), getLenList(C,N2), write(N2).
 findall(X,grade(103,X,_,2),C), getLenList(C,N3), write(N3).
 findall(X,grade(104,X,_,2),C), getLenList(C,N4), write(N4).

% Найти количество не сдавших студентов для каждого из предметов
 findall(X,grade(_,X,'Логическое программирование',2),C), getLenList(C,LP), write(LP).
 findall(X,grade(_,X,'Математический анализ',2),C), getLenList(C,MA), write(MA).
 findall(X,grade(_,X,'Функциональное программирование',2),C), getLenList(C,FP), write(FP).
 findall(X,grade(_,X,'Информатика',2),C), getLenList(C,IT), write(IT).
 findall(X,grade(_,X,'Английский язык',2),C), getLenList(C,EL), write(EL).
 findall(X,grade(_,X,'Психология',2),C), getLenList(C,PS), write(PS).
