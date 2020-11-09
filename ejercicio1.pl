% Ejecicio 1 
% Arbol Genealogico

% hombre(arthur).
% hombre(bill).
% hombre(louis).
% hombre(teddy).
% hombre(percy).
% hombre(george).
% hombre(fred).
% hombre(harry).
% hombre(james).
% hombre(albus).
% hombre(ron).
% hombre(hugo).

% mujer(molly).
% mujer(fleur).
% mujer(victoire).
% mujer(dominique).
% mujer(audrey).
% mujer(lucy).
% mujer(molly).
% mujer(angelina).
% mujer(roxanne).
% mujer(ginny).
% mujer(lily).
% mujer(hermione).
% mujer(rose).

progenitor(molly,bill).
progenitor(molly,percy).
progenitor(molly,george).
progenitor(molly,ginny).
progenitor(molly,ron).
progenitor(arthur,bill).
progenitor(arthur,percy).
progenitor(arthur,george).
progenitor(arthur,ginny).
progenitor(arthur,ron).
progenitor(bill,victoire).
progenitor(bill,dominique).
progenitor(bill,louis).
progenitor(fleur,victoire).
progenitor(fleur,dominique).
progenitor(fleur,louis).
progenitor(percy,lucy).
progenitor(percy,molly).
progenitor(audrey,lucy).
progenitor(audrey,molly).
progenitor(george,fred).
progenitor(george,roxanne).
progenitor(angelina,fred).
progenitor(angelina,roxanne).
progenitor(ginny,james).
progenitor(ginny,lily).
progenitor(ginny,albus).
progenitor(harry,james).
progenitor(harry,lily).
progenitor(harry,albus).
progenitor(ron,hugo).
progenitor(ron,rose).
progenitor(hermione,hugo).
progenitor(hermione,rose).

pareja(arthur,molly).
pareja(molly,arthur).
pareja(bill,fleur).
pareja(fleur,bill).
pareja(percy,audrey).
pareja(audrey,percy).
pareja(george,angelina).
pareja(angelina,george).
pareja(ginny,harry).
pareja(harry,ginny).
pareja(ron,hermione).
pareja(hermione,ron).
pareja(victoire,teddy).
pareja(teddy,victoire).

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

