% Text
% Alice is a surviving spouse for the year 2017. Alice's taxable income for the year 2017 is $70117.

% Question
% Alice has to pay $14836 in taxes for the year 2017 under section 1(d). Contradiction

% Facts
:- discontiguous s2_a/5.
:- discontiguous s63/3.
:- [law/semantics/init].
s2_a(alice,_,_,_,2017).
s63(alice,2017,70117).

% Test
:- \+ s1_d(alice,2017,14836).
:- halt.
