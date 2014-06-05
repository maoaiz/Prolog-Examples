% Autores: Mauricio Aizaga, Freddy Loaiza, Leidy Hurtado
% Junio/2014

%%% QUIEN ESTA AL LADO DE QUIEN?
%%% observa el enunciado: https://github.com/MaoAiz/Prolog-Examples/tree/master/Dilema/


% Y esta a la derecha de X en una lista?
aladerecha(X,Y,[X,Y|_]).
aladerecha(X,Y,[_|RL]):-aladerecha(X,Y,RL).

% X y Y estan juntos?
alladode(X,Y,L):-aladerecha(Y,X,L).
alladode(X,Y,L):-aladerecha(X,Y,L).


% Verifica si un elemento pertenece a una lista:
pertenece(X,[X|_]).
pertenece(X,[_|Tail]):-pertenece(X,Tail).


% Reglas del dilema:
resolver_dilema(Fila):-
	Fila=[persona(huilense,_,naranja,_,_),
	      _,
	      persona(_,negro,_,_,yogurt),
	      _,
	      _],
	pertenece(persona(_,amarillo,_,blanco,_),Fila),
	pertenece(persona(antioqueno,rojo,_,_,_),Fila),
	pertenece(persona(valluno,_,blanco,_,_),Fila),
	pertenece(persona(narinense,_,_,_,gaseosa),Fila),
	pertenece(persona(_,_,verde,negro,_),Fila),
	pertenece(persona(_,verde,_,_,cafe),Fila),
	pertenece(persona(_,_,_,cafe,leche),Fila),
	pertenece(persona(tolimense,_,_,habano,_),Fila),
	aladerecha(persona(_,negro,_,_,_),persona(_,verde,_,_,_),Fila),
	alladode(persona(_,_,_,azul,_),persona(_,_,azul,_,_),Fila),
	alladode(persona(_,_,rojo,_,_),persona(_,_,_,negro,_),Fila),
	alladode(persona(huilense,_,_,_,_),persona(_,azul,_,_,_),Fila),
	alladode(persona(_,_,_,_,cafe),persona(_,_,_,_,yogurt),Fila),
	pertenece(persona(_,_,naranja,_,_),Fila),
	pertenece(persona(_,_,_,_,agua),Fila).



%%% Ejemplo de consula: %%%
% resolver_dilema(F).