# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 7.851712430433175

load 1B3C.pdb, 1B3C
bg_color white
hide everything, 1B3C
show cartoon, 1B3C
color grey80, 1B3C
set cartoon_transparency, 0.1

select worst_residues, 1B3C and resi 1+8+30+31+42+48+49+60+61+62
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1B3C and resi 3+12+39+46
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1B3C and resi 1 and name CA, 1B3C and resi 47 and name CA  # target=4.028908588844348 current=12.366318120994292
color yellow, pair_00
distance pair_01, 1B3C and resi 10 and name CA, 1B3C and resi 56 and name CA  # target=4.647636918307805 current=11.3339271676864
color yellow, pair_01
distance pair_02, 1B3C and resi 32 and name CA, 1B3C and resi 53 and name CA  # target=6.154433278656084 current=11.820514587221405
color yellow, pair_02
distance pair_03, 1B3C and resi 35 and name CA, 1B3C and resi 48 and name CA  # target=4.893392851656878 current=10.090983102912581
color yellow, pair_03
distance pair_04, 1B3C and resi 2 and name CA, 1B3C and resi 47 and name CA  # target=4.893392851656878 current=10.020505482013494
color yellow, pair_04
distance pair_05, 1B3C and resi 33 and name CA, 1B3C and resi 50 and name CA  # target=6.703322173651606 current=11.806299008884743
color yellow, pair_05
distance pair_06, 1B3C and resi 1 and name CA, 1B3C and resi 48 and name CA  # target=4.028908588844348 current=8.63932379134669
color yellow, pair_06
distance pair_07, 1B3C and resi 1 and name CA, 1B3C and resi 46 and name CA  # target=4.893392851656878 current=9.367941712683333
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
