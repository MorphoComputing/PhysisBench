# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.4345360852405677

load 1GB1.pdb, 1GB1
bg_color white
hide everything, 1GB1
show cartoon, 1GB1
color grey80, 1GB1
set cartoon_transparency, 0.1

select worst_residues, 1GB1 and resi 3+10+11+13+14+15+22+23+24+48
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1GB1 and resi 30+31+45+97
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1GB1 and resi 6 and name CA, 1GB1 and resi 32 and name CA  # target=5.972317811973412 current=10.62195971287551
color yellow, pair_00
distance pair_01, 1GB1 and resi 16 and name CA, 1GB1 and resi 29 and name CA  # target=4.507975919933174 current=8.701832023951312
color yellow, pair_01
distance pair_02, 1GB1 and resi 30 and name CA, 1GB1 and resi 42 and name CA  # target=4.507975919933174 current=8.553931703110706
color yellow, pair_02
distance pair_03, 1GB1 and resi 3 and name CA, 1GB1 and resi 29 and name CA  # target=4.507975919933174 current=7.646038863338387
color yellow, pair_03
distance pair_04, 1GB1 and resi 4 and name CA, 1GB1 and resi 16 and name CA  # target=3.702731984431378 current=6.829187530893238
color yellow, pair_04
distance pair_05, 1GB1 and resi 2 and name CA, 1GB1 and resi 44 and name CA  # target=5.071063307555523 current=8.130437682365283
color yellow, pair_05
distance pair_06, 1GB1 and resi 2 and name CA, 1GB1 and resi 29 and name CA  # target=5.790717228239924 current=8.74207253784573
color yellow, pair_06
distance pair_07, 1GB1 and resi 5 and name CA, 1GB1 and resi 15 and name CA  # target=4.893392851656878 current=7.842927653222677
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
