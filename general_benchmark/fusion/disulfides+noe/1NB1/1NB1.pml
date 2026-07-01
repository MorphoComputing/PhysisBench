# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.422868625701568

load 1NB1.pdb, 1NB1
bg_color white
hide everything, 1NB1
show cartoon, 1NB1
color grey80, 1NB1
set cartoon_transparency, 0.1

select worst_residues, 1NB1 and resi 1+6+7+11+12+17+18+19+24+25
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1NB1 and resi 1 and name CA, 1NB1 and resi 27 and name CA  # target=4.839901528701486 current=8.241498579617787
color yellow, pair_00
distance pair_01, 1NB1 and resi 1 and name CA, 1NB1 and resi 20 and name CA  # target=7.39019949670469 current=4.130104048372206
color yellow, pair_01
distance pair_02, 1NB1 and resi 3 and name CA, 1NB1 and resi 18 and name CA  # target=6.703322173651606 current=4.013036274710167
color yellow, pair_02
distance pair_03, 1NB1 and resi 2 and name CA, 1NB1 and resi 11 and name CA  # target=6.452246554221226 current=8.296089757752902
color yellow, pair_03
distance pair_04, 1NB1 and resi 5 and name CA, 1NB1 and resi 20 and name CA  # target=6.452246554221226 current=5.119357673774759
color yellow, pair_04
distance pair_05, 1NB1 and resi 4 and name CA, 1NB1 and resi 16 and name CA  # target=5.526827568351721 current=6.813448069652016
color yellow, pair_05
distance pair_06, 1NB1 and resi 9 and name CA, 1NB1 and resi 21 and name CA  # target=5.526827568351721 current=6.79888950996847
color yellow, pair_06
distance pair_07, 1NB1 and resi 4 and name CA, 1NB1 and resi 19 and name CA  # target=4.374165000904875 current=3.1606704083844805
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
