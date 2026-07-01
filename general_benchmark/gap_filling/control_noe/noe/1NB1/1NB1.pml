# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.711248714694485

load 1NB1.pdb, 1NB1
bg_color white
hide everything, 1NB1
show cartoon, 1NB1
color grey80, 1NB1
set cartoon_transparency, 0.1

select worst_residues, 1NB1 and resi 5+6+7+10+11+12+13+18+19+24
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1NB1 and resi 4
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1NB1 and resi 3 and name CA, 1NB1 and resi 21 and name CA  # target=3.711689012941624 current=6.336204407329168
color yellow, pair_00
distance pair_01, 1NB1 and resi 6 and name CA, 1NB1 and resi 18 and name CA  # target=6.438814307639179 current=8.854747888981054
color yellow, pair_01
distance pair_02, 1NB1 and resi 1 and name CA, 1NB1 and resi 21 and name CA  # target=5.533144452470395 current=7.82176880324249
color yellow, pair_02
distance pair_03, 1NB1 and resi 1 and name CA, 1NB1 and resi 27 and name CA  # target=4.839901528701486 current=6.94425503138527
color yellow, pair_03
distance pair_04, 1NB1 and resi 4 and name CA, 1NB1 and resi 20 and name CA  # target=3.84465472646053 current=5.939756535589509
color yellow, pair_04
distance pair_05, 1NB1 and resi 15 and name CA, 1NB1 and resi 25 and name CA  # target=6.452246554221226 current=8.427511363544875
color yellow, pair_05
distance pair_06, 1NB1 and resi 4 and name CA, 1NB1 and resi 21 and name CA  # target=4.3412285601786795 current=5.998981581221818
color yellow, pair_06
distance pair_07, 1NB1 and resi 2 and name CA, 1NB1 and resi 10 and name CA  # target=5.533144452470395 current=7.086202429306498
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
