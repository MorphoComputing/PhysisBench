# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.08924816785326375

load 1NB1.pdb, 1NB1
bg_color white
hide everything, 1NB1
show cartoon, 1NB1
color grey80, 1NB1
set cartoon_transparency, 0.1

select worst_residues, 1NB1 and resi 1+5+13+14+17+18+19+22+23+24
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1NB1 and resi 3 and name CA, 1NB1 and resi 20 and name CA  # target=4.1237798669079035 current=3.843411927528394
color yellow, pair_00
distance pair_01, 1NB1 and resi 7 and name CA, 1NB1 and resi 19 and name CA  # target=7.866470866779383 current=8.045202052010794
color yellow, pair_01
distance pair_02, 1NB1 and resi 1 and name CA, 1NB1 and resi 24 and name CA  # target=13.344126819126604 current=13.17577872123668
color yellow, pair_02
distance pair_03, 1NB1 and resi 1 and name CA, 1NB1 and resi 22 and name CA  # target=8.610373999035655 current=8.451400147915919
color yellow, pair_03
distance pair_04, 1NB1 and resi 1 and name CA, 1NB1 and resi 23 and name CA  # target=9.671358179167425 current=9.518030997876481
color yellow, pair_04
distance pair_05, 1NB1 and resi 8 and name CA, 1NB1 and resi 19 and name CA  # target=9.625823036384823 current=9.767198543468723
color yellow, pair_05
distance pair_06, 1NB1 and resi 14 and name CA, 1NB1 and resi 27 and name CA  # target=8.166783473067582 current=8.301448262235263
color yellow, pair_06
distance pair_07, 1NB1 and resi 3 and name CA, 1NB1 and resi 21 and name CA  # target=5.185984811523819 current=5.0626749504379305
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
