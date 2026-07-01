# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.3278300462516612

load 2HIU.pdb, 2HIU
bg_color white
hide everything, 2HIU
show cartoon, 2HIU
color grey80, 2HIU
set cartoon_transparency, 0.1

select worst_residues, 2HIU and resi 7+15+16+18+20+21+22+23+24+40
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2HIU and resi 11+33+42+46+124+421
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2HIU and resi 19 and name CA, 2HIU and resi 29 and name CA  # target=21.073380526759895 current=11.658684466049339
color yellow, pair_00
distance pair_01, 2HIU and resi 9 and name CA, 2HIU and resi 17 and name CA  # target=20.368472453541056 current=11.093087627253949
color yellow, pair_01
distance pair_02, 2HIU and resi 5 and name CA, 2HIU and resi 21 and name CA  # target=13.81088788822153 current=5.336101030954163
color yellow, pair_02
distance pair_03, 2HIU and resi 11 and name CA, 2HIU and resi 23 and name CA  # target=17.08930107592677 current=8.683673078161155
color yellow, pair_03
distance pair_04, 2HIU and resi 1 and name CA, 2HIU and resi 9 and name CA  # target=17.64514080800674 current=9.474417015353374
color yellow, pair_04
distance pair_05, 2HIU and resi 18 and name CA, 2HIU and resi 26 and name CA  # target=17.456571831061744 current=9.36306310081097
color yellow, pair_05
distance pair_06, 2HIU and resi 32 and name CA, 2HIU and resi 41 and name CA  # target=17.989533948803285 current=10.389794900950386
color yellow, pair_06
distance pair_07, 2HIU and resi 11 and name CA, 2HIU and resi 42 and name CA  # target=8.648758661644383 current=16.24618531066552
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
