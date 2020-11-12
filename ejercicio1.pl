% Ejecicio 1 
% Arbol Genealogico

hombre(andy).
hombre(jose).
hombre(alvaro).
hombre(alejandro).
hombre(daniel).
hombre(neil).
hombre(humberto).
hombre(carlos).

mujer(claudia).
mujer(yvon).
mujer(walesvka).
mujer(teresa).
mujer(xiona).
mujer(karina).
mujer(nadia).
mujer(yolanda).

progenitor(claudia,andy).
progenitor(claudia,jose).
progenitor(teresa,claudia).
progenitor(teresa,walesvka).
progenitor(teresa,yvon).
progenitor(teresa,neil).
progenitor(xiona,nadia).
progenitor(xiona,alejandro).
progenitor(yolanda,alvaro).
progenitor(yolanda,carlos).
progenitor(alvaro,andy).
progenitor(alvaro,jose).
progenitor(daniel,alvaro).
progenitor(daniel,carlos).
progenitor(humberto,claudia).
progenitor(humberto,yvon).
progenitor(humberto,walesvka).
progenitor(humberto,neil).
progenitor(carlos,nadia).
progenitor(carlos,alejandro).

pareja(claudia,alvaro).
pareja(alvaro,claudia).
pareja(xiona,carlos).
pareja(carlos,xiona).
pareja(neil,karina).
pareja(karina,neil).
pareja(teresa,humberto).
pareja(humberto,teresa).
pareja(daniel,yolanda).
pareja(yolanda,daniel).

padre(X,Y):-hombre(X),progenitor(X,Y).
madre(X,Y):-mujer(X),progenitor(X,Y).
hijo(X,Y):-hombre(X),progenitor(Y,X).
hija(X,Y):-mujer(X),progenitor(Y,X).
abuelo(X,Y):-progenitor(Z,Y),padre(X,Z).
abuela(X,Y):-progenitor(Z,Y),madre(X,Z).
hermano(X,Y):-hombre(X),hermanos(X,Y).
hermana(X,Y):-mujer(X),hermanos(X,Y).
tio(X,Y):-progenitor(Z,Y),(hermano(X,Z);cuñado(X,Z)).
tia(X,Y):-progenitor(Z,Y),(hermana(X,Z);cuñada(X,Z)).
primo(X,Y):-progenitor(Z,X),progenitor(W,Y),hermanos(Z,W),hombre(X).
prima(X,Y):-progenitor(Z,X),progenitor(W,Y),hermanos(Z,W),mujer(X).
sobrino(X,Y):-progenitor(Z,X),hermanos(Z,Y),hombre(X).
sobrina(X,Y):-progenitor(Z,X),hermanos(Z,Y),mujer(X).

nieto(X,Y):-progenitor(Y,Z),progenitor(Z,X),hombre(X).
nieta(X,Y):-progenitor(Y,Z),progenitor(Z,X),mujer(X).
hermanos(X,Y):-progenitor(Z,X),progenitor(Z,Y), not(X==Y).

esposo(X,Y):-pareja(X,Y),hombre(X).
esposa(X,Y):-pareja(X,Y),mujer(X).
suegro(X,Y):-padre(X,Z),pareja(Y,Z).
suegra(X,Y):-madre(X,Z),esposos(Y,Z).
yerno(X,Y):-suegro(Y,X);suegra(Y,X),hombre(X).
nuera(X,Y):-suegro(Y,X);suegra(Y,X),mujer(X).
cuñados(X,Y):-((pareja(X,Z),hermanos(Z,Y));(pareja(Y,Z),hermanos(Z,X))).
cuñado(X,Y):-cuñados(X,Y),hombre(X).
cuñada(X,Y):-cuñados(X,Y),mujer(X).

