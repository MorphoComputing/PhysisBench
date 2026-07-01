# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.165100909753079

load 3IOL.pdb, 3IOL
bg_color white
hide everything, 3IOL
show cartoon, 3IOL
color grey80, 3IOL
set cartoon_transparency, 0.1

select worst_residues, 3IOL and resi 5+12+14+15+17+18+19+21+22+23
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 3IOL and resi 1 and name CA, 3IOL and resi 24 and name CA  # target=27.766711909018145 current=31.366137876658843
color yellow, pair_00
distance pair_01, 3IOL and resi 4 and name CA, 3IOL and resi 15 and name CA  # target=17.272429412009167 current=19.07109711936204
color yellow, pair_01
distance pair_02, 3IOL and resi 8 and name CA, 3IOL and resi 20 and name CA  # target=18.32609730837799 current=19.2654572994557
color yellow, pair_02
distance pair_03, 3IOL and resi 5 and name CA, 3IOL and resi 17 and name CA  # target=17.949915815839837 current=18.831403835145995
color yellow, pair_03
distance pair_04, 3IOL and resi 6 and name CA, 3IOL and resi 22 and name CA  # target=23.70810718518416 current=24.46150836909721
color yellow, pair_04
distance pair_05, 3IOL and resi 8 and name CA, 3IOL and resi 19 and name CA  # target=17.044492591954516 current=17.773858586218868
color yellow, pair_05
distance pair_06, 3IOL and resi 9 and name CA, 3IOL and resi 19 and name CA  # target=15.222716002850674 current=15.950793456858861
color yellow, pair_06
distance pair_07, 3IOL and resi 7 and name CA, 3IOL and resi 23 and name CA  # target=24.15762235129196 current=24.851962325129463
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
