# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.548264540437957

load 1NB1.pdb, 1NB1
bg_color white
hide everything, 1NB1
show cartoon, 1NB1
color grey80, 1NB1
set cartoon_transparency, 0.1

select worst_residues, 1NB1 and resi 1+5+6+7+11+12+13+18+19+20
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1NB1 and resi 1 and name CA, 1NB1 and resi 27 and name CA  # target=4.839901528701486 current=7.039725176681756
color yellow, pair_00
distance pair_01, 1NB1 and resi 3 and name CA, 1NB1 and resi 18 and name CA  # target=6.703322173651606 current=8.576630863365093
color yellow, pair_01
distance pair_02, 1NB1 and resi 7 and name CA, 1NB1 and resi 18 and name CA  # target=6.088045620073363 current=4.297508343100577
color yellow, pair_02
distance pair_03, 1NB1 and resi 4 and name CA, 1NB1 and resi 20 and name CA  # target=3.84465472646053 current=5.562120093609685
color yellow, pair_03
distance pair_04, 1NB1 and resi 4 and name CA, 1NB1 and resi 18 and name CA  # target=4.47460509597741 current=6.0091880594301355
color yellow, pair_04
distance pair_05, 1NB1 and resi 5 and name CA, 1NB1 and resi 20 and name CA  # target=6.452246554221226 current=7.233602210626495
color yellow, pair_05
distance pair_06, 1NB1 and resi 1 and name CA, 1NB1 and resi 21 and name CA  # target=5.533144452470395 current=4.7659976853178865
color yellow, pair_06
distance pair_07, 1NB1 and resi 2 and name CA, 1NB1 and resi 11 and name CA  # target=6.452246554221226 current=7.086654450992112
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
