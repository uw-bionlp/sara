% Text
% Alice and Bob got married on April 5th, 2012. Alice and Bob have a son, Charlie, who was born on September 16th, 2017. Alice and Charlie live in a home maintained by Alice since September 16th, 2017. Alice is entitled to a deduction for Charlie under section 151(c) for the years 2017 to 2019. Alice and Bob file a joint return for the years 2017 to 2019.

% Question
% Section 7703(b)(1) applies to Alice for the year 2018. Contradiction

% Facts
:- discontiguous s151_c_applies/3.
:- [law/semantics/init].
marriage_(alice_and_bob).
agent_(alice_and_bob,alice).
agent_(alice_and_bob,bob).
start_(alice_and_bob,"2012-04-05").
son_(charlie_is_born).
agent_(charlie_is_born,charlie).
patient_(charlie_is_born,bob).
patient_(charlie_is_born,alice).
start_(charlie_is_born,"2017-09-16").
residence_(charlie_residence).
agent_(charlie_residence,charlie).
patient_(charlie_residence,alice_s_house).
start_(charlie_residence,"2017-09-16").
residence_(alice_residence).
agent_(alice_residence,alice).
patient_(alice_residence,alice_s_house).
start_(alice_residence,"2017-09-16").
alice_household_maintenance(Year,Event,Start_day,End_day) :-
    between(2017,2117,Year), % avoid infinite forward loop
    atom_concat('alice_maintains_household_',Year,Event),
    (((Year==2017)->(Start_day="2017-09-16"));first_day_year(Year,Start_day)),
    last_day_year(Year,End_day).
payment_(Event) :- alice_household_maintenance(_,Event,_,_).
agent_(Event,alice) :- alice_household_maintenance(_,Event,_,_).
amount_(Event,1) :- alice_household_maintenance(_,Event,_,_).
purpose_(Event,alice_s_house) :- alice_household_maintenance(_,Event,_,_).
start_(Event,Start_day) :- alice_household_maintenance(_,Event,Start_day,_).
end_(Event,End_day) :- alice_household_maintenance(_,Event,_,End_day).
s151_c_applies(alice,charlie,Year) :- between(2017,2019,Year).
joint_return_(alice_and_bob_joint_return_2017).
agent_(alice_and_bob_joint_return_2017,alice).
agent_(alice_and_bob_joint_return_2017,bob).
start_(alice_and_bob_joint_return_2017,"2017-01-01").
end_(alice_and_bob_joint_return_2017,"2017-12-31").
joint_return_(alice_and_bob_joint_return_2018).
agent_(alice_and_bob_joint_return_2018,alice).
agent_(alice_and_bob_joint_return_2018,bob).
start_(alice_and_bob_joint_return_2018,"2018-01-01").
end_(alice_and_bob_joint_return_2018,"2018-12-31").
joint_return_(alice_and_bob_joint_return_2019).
agent_(alice_and_bob_joint_return_2019,alice).
agent_(alice_and_bob_joint_return_2019,bob).
start_(alice_and_bob_joint_return_2019,"2019-01-01").
end_(alice_and_bob_joint_return_2019,"2019-12-31").

% Test
:- \+ s7703_b_1(alice,_,_,2018,_).
:- halt.
