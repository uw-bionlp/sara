% Text
% Alice is married under section 7703 for the year 2017. Alice's taxable income for the year 2017 is $554313. Alice files a separate return from her spouse.

% Question
% Alice has to pay $207772 in taxes for the year 2017 under section 1(b). Contradiction

% Facts
:- discontiguous s63/3.
:- discontiguous s7703/8.
:- [law/semantics/init].
s7703(alice,spouse,_,_,_,_,_,2017).
s63(alice,2017,554313).

% Test
:- \+ s1_b(alice,2017,207772).
:- halt.
