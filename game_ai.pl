% This is the file containing the AI of the StockExchange Game
% Author: Antoine Pouillaude.


%%%% all_possible_moves(+State_Of_The_Game,+Player_Who_Will_Make_The_Move,?Possible_Moves)
%% The following predicate will get all the possible moves that the ai could make.
all_possible_moves([Stacks,S,TP,RJ1,RJ2],Player,PossibleMoves) :- possible_moves(Stacks,TP,Player,[1,2,3],PossibleMoves).


%%%% possible_moves(+Stacks_Of_The_Game,+Trader_Position,+Player_Who_Will_Make_The_Move,+List_Of_Jumps_To_make,?List_Of_Moves)
%% possible_moves will get the list of the moves possible by applying all the jumps given in the fourth parameter. In that game the list should be [1,2,3].
possible_moves(Stacks,TP,Player,[],[]) :- !.
possible_moves(Stacks,TP,Player,[H|T],ListMoves) :-
		possible_moves(Stacks,TP,Player,T,SListMoves), 
		get_possible_list(Stacks,TP,H,ListProd),
		reverse(ListProd,RevList),
		concat([Player,H],ListProd, TempList),
		concat([Player,H],RevList, TempListRev),
		concat([TempList],[TempListRev],Temp),
		concat(Temp,SListMoves,ListMoves).


%%%% get_possible_list(+List_Of_Stacks_In_The_Game,+Trader_Position,+Number_Of_Jumps_To_Make,?List_Of_Product_The_Player_Can_Have_After_Moving)
%% This predicate will compute the list of products available from the current trader position by applying Pos moves to the pawn.
get_possible_list(Stacks,TP,Pos,ListProd) :-
		get_indexes(Stacks,TP,Pos,[NTP,ISup,IInf]),
		nth0(ISup,Stacks,E1),
		nth0(IInf,Stacks,E2),
		[Prod1|T1] = E1, [Prod2|T2] = E2,
		ListProd = [Prod1,Prod2].



best_move(State,Player,Move).



min_max_algorithm().

min().

max().