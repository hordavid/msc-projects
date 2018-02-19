%% -*- Mode: Prolog; coding: utf-8 -*-

%% Logikai programok építése HF 2018.02.14 -> 02.21

%% A megoldásban ezt a fájlt kérem kiegészíteni,
%% és a neptun kódjukat a fájlnévben a 'hf' helyére írva
%% elküldeni az  <asvanyi@inf.elte.hu>  címre!

%% Mj.: Az "Előf" (előfeltétel) teljesülése esetén 
%%      - a program keresési fájának végesnek kell lennie, és
%%      - a programnak nem szabad kezeletlen kivételt kiváltania.
%% (Tehát, amíg nem tanulunk kivételkezelést, nem szabad kivételt kiváltania.)

:- set_prolog_flag(toplevel_print_options,
    [quoted(true),numbervars(true),portrayed(true),
                                   max_depth(1000)]).

:- set_prolog_flag(legacy_char_classification,on).

%% Adottak:
%% A természetes számok s-szám reprezentációja:
%%                        0, s(0), s(s(0)), ...
nat(0).
nat(s(N)) :- nat(N).

plus(0,N,N).
plus(s(M),N,s(K)) :- plus(M,N,K).

times(0,_N,0).
times(s(M),N,K) :- times(M,N,MN), plus(N,MN,K). % (M+1)*N = M*N+N

%% Feladat (2p):
%%
%% Előf: A és N s-számok, azaz természetes számok a
%%                        0, s(0), s(s(0)), ... reprezentációban.
%%
%% hatvány(A,N,B) :-
%%     Az A N-edik hatványa a B s-szám.
/*
| ?- hatvány(0,s(s(0)),H).
H = 0 
| ?- hatvány(0,0,H).
H = s(0)
| ?- hatvány(s(s(0)),0,H).
H = s(0)
| ?- hatvány(s(0),s(s(s(0))),H).
H = s(0)
| ?- hatvány(s(s(0)),s(s(s(0))),H).
H = s(s(s(s(s(s(s(s(0)))))))
| ?- hatvány(s(s(s(0))),s(s(0)),H).
H = s(s(s(s(s(s(s(s(s(0)))))))))
*/

%% Ha egy tesztnél csak egy megoldást tüntettem fel, akkor az adott kérdésre
%% csak egy megoldást szabad kapnunk. A közölt teszt nem teljes körű!

%% Megoldás:

hatvány(0, s(_N), 0).
hatvány(_A, 0, s(0)).
hatvány(A, s(N), B) :- hatvány(A, N, R), times(R, A, B).