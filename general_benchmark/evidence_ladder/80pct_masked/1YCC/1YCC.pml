# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.385017353028155

load 1YCC.pdb, 1YCC
bg_color white
hide everything, 1YCC
show cartoon, 1YCC
color grey80, 1YCC
set cartoon_transparency, 0.1

select worst_residues, 1YCC and resi 1+2+3+4+50+51+52+54+66+77
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1YCC and resi 3+10+11+48
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1YCC and resi 1 and name CA, 1YCC and resi 9 and name CA  # target=19.554260852216043 current=4.963256402998153
color yellow, pair_00
distance pair_01, 1YCC and resi 2 and name CA, 1YCC and resi 12 and name CA  # target=19.30057693583162 current=6.1778588781354635
color yellow, pair_01
distance pair_02, 1YCC and resi 30 and name CA, 1YCC and resi 66 and name CA  # target=23.34192053688839 current=11.066089908458423
color yellow, pair_02
distance pair_03, 1YCC and resi 37 and name CA, 1YCC and resi 66 and name CA  # target=17.218281668205066 current=6.961505184628149
color yellow, pair_03
distance pair_04, 1YCC and resi 76 and name CA, 1YCC and resi 88 and name CA  # target=19.305554623961644 current=9.25622911507678
color yellow, pair_04
distance pair_05, 1YCC and resi 3 and name CA, 1YCC and resi 29 and name CA  # target=27.49626073502319 current=17.68536858965409
color yellow, pair_05
distance pair_06, 1YCC and resi 2 and name CA, 1YCC and resi 10 and name CA  # target=14.095258610712474 current=4.2977694132714666
color yellow, pair_06
distance pair_07, 1YCC and resi 37 and name CA, 1YCC and resi 71 and name CA  # target=17.32385448452987 current=7.53044078845592
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
