% This is the main file of the game
% Author: Frédéric Rouffineau et Antoine Pouillaude.

use_module(stock_exchange).
:- include(game_engine).
:- include(game_ai).
:- include(game_display).
:- include(list_library).
:- include(game_player).

choice(1,Player1,Player2):-!,nl, write('Gaming Board'),nl,starting_state(State,Player1,Player2),human_vs_human(State,Player1).
choice(2,Player1,Player2):-!,nl, write('Gaming Board'),nl,starting_state(State,Player1,Player2),human_vs_ai(State,Player1).
choice(3,Player1,Player2):-nl, write('Gaming Board'),nl,starting_state(State,Player1,Player2),ai_vs_ai(State,Player1).

stockexchange(X) :- nl,
	write('1. Option 1 : Human vs Human'),nl,
	write('2. Option 2 : Human vs Machine'),nl,
	write('3. Option 3 : Machine vs Machine'),nl,
	write('4. Option 4 : Leave'),nl,
	write('Enter your choice : '),
	read(X),nl,
	choose(X).

choose(1) :-!,write('Name of the first player : '), read(Player1), nl, 
		write('Name of the second player : '),read(Player2), nl, 
		write('Let s start a game between humans : '),write(Player1), write(' vs '), write(Player2),nl, 
		choice(1,Player1,Player2),stockexchange(_).
choose(2) :-!,write('Name of the first player : '), read(Player1), nl, (Player1 == ai1 -> Player2 = ai2; Player2 = ai1),
		write('Let s start a game between '),write(Player1),write(' vs '),write(Player2),nl, 
		choice(2,Player1,Player2),stockexchange(_).
choose(3) :-!,write('Let s start a game between two AIs. It will be quick. Ready. Set. Go !'),nl, choice(3,ai1,ai2),stockexchange(_).
choose(4) :-!,write('Bye').
choose(_) :- write('Bad Choice'),stockexchange(_).