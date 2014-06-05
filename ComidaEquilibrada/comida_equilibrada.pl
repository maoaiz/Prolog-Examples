% Autores: Mauricio Aizaga, Freddy Loaiza, Leidy Hurtado
% Junio/2014

% Averigua si la comida que vas a almorzar no sobrepasa las calorias diarias que debes consumir. 


%%% Definimos nuestro menu de comidas disponibles en: entradas, postres y plato_principal
entrada(paella).
entrada(gazpacho).
entrada(consome).
postre(flan).
postre(nueces).
postre(naranja).
carne(cerdo).
carne(pollo).
pezcado(trucha).
pezcado(bacalao).
plato_principal(X):-carne(X);pezcado(X). % puede ser carne o pezcado.

%%% Definimos las calorías de cada uno de nuestros platos
calorias(paella, 200).
calorias(gazpacho, 150).
calorias(consome, 300).
calorias(flan, 200).
calorias(nueces, 500).
calorias(naranja, 50).
calorias(cerdo, 400).
calorias(pollo, 280).
calorias(trucha, 160).
calorias(bacalao, 300).

%%% Validamos que los valores de entrada pertenezcan a nuestro menu.
comida(Entrada, PlatoPrincipal, Postre):-
	entrada(Entrada), write(Entrada), write(' si es una entrada valida'), nl,
	plato_principal(PlatoPrincipal), write(PlatoPrincipal), write(' si es un plato principal valido'), nl,
	postre(Postre), write(Postre), write(' si es un postre valido'), nl, nl.

%%% suma simple requerida en el calculo de calorias.
sumar(X, Y, Z, Res):- Res is X + Y + Z.

%%% Validamos y calculamos las calorias de nuestras comidas %%%
caloriasComida(Entrada, PlatoPrincipal, Postre, Valor) :-
	calorias(Entrada, X),
	write(Entrada), write(' tiene '), write(X), write(' calorias'), nl,
	calorias(PlatoPrincipal, Y),
	write(PlatoPrincipal), write(' tiene '), write(Y), write(' calorias'), nl,
	calorias(Postre, Z),
	write(Postre), write(' tiene '), write(Z), write(' calorias'), nl,
	sumar(X, Y, Z, Valor),
	write('Total: '), write(Valor), nl.

%%% Validamos que el total de todas las calorías sea inferior al diario adecuado de calorias.
valorar(Valor):-
	Valor<800 -> write('Puedes comer tranquilo'); write('No deberias comer tantas calorias').

consultar_viabilidad(Entrada, PlatoPrincipal, Postre):-
	comida(Entrada, PlatoPrincipal, Postre),
	caloriasComida(Entrada, PlatoPrincipal, Postre, Valor),
	valorar(Valor).

es_comida_equilibrada(Entrada, PlatoPrincipal, Postre):-
	consultar_viabilidad(Entrada, PlatoPrincipal, Postre) -> nl; write('Hay un error en los datos, por favor revisa e intenta de nuevo').



%%%%%%% Ejemplos de Consultas %%%%%%%%%
% es_comida_equilibrada(paella,pollo,nueces). 
% es_comida_equilibrada(paella,trucha,nueces).
% es_comida_equilibrada(paella,trucha,flan).
% es_comida_equilibrada(sudado_de_pollo,trucha,flan). %%mira lo que sucede si se agrega una comida que no existe en el menu.
