# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.2409260815996057

load 3IOL.pdb, 3IOL
bg_color white
hide everything, 3IOL
show cartoon, 3IOL
color grey80, 3IOL
set cartoon_transparency, 0.1

select worst_residues, 3IOL and resi 6+13+14+15+16+17+20+21+22+24
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 3IOL and resi 6 and name CA, 3IOL and resi 22 and name CA  # target=23.70810718518416 current=24.366744073231324
color yellow, pair_00
distance pair_01, 3IOL and resi 5 and name CA, 3IOL and resi 17 and name CA  # target=17.949915815839837 current=18.531241988512168
color yellow, pair_01
distance pair_02, 3IOL and resi 1 and name CA, 3IOL and resi 21 and name CA  # target=27.63397188306877 current=28.149167504855
color yellow, pair_02
distance pair_03, 3IOL and resi 7 and name CA, 3IOL and resi 23 and name CA  # target=24.15762235129196 current=24.570851795276877
color yellow, pair_03
distance pair_04, 3IOL and resi 9 and name CA, 3IOL and resi 19 and name CA  # target=15.222716002850674 current=15.61187588643002
color yellow, pair_04
distance pair_05, 3IOL and resi 6 and name CA, 3IOL and resi 18 and name CA  # target=18.619430895815015 current=18.957739903425356
color yellow, pair_05
distance pair_06, 3IOL and resi 4 and name CA, 3IOL and resi 15 and name CA  # target=17.272429412009167 current=17.605745494728023
color yellow, pair_06
distance pair_07, 3IOL and resi 8 and name CA, 3IOL and resi 18 and name CA  # target=15.941906090624325 current=16.229887033408474
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
