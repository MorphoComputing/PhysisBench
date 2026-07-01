# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.2503878923215725

load 1TEN.pdb, 1TEN
bg_color white
hide everything, 1TEN
show cartoon, 1TEN
color grey80, 1TEN
set cartoon_transparency, 0.1

select worst_residues, 1TEN and resi 39+40+41+42+44+45+66+77+86+87
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1TEN and resi 3+12+25+37+45+86
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1TEN and resi 42 and name CA, 1TEN and resi 86 and name CA  # target=16.436253695668494 current=8.851488164847042
color yellow, pair_00
distance pair_01, 1TEN and resi 45 and name CA, 1TEN and resi 82 and name CA  # target=14.963050401086242 current=7.807382376858758
color yellow, pair_01
distance pair_02, 1TEN and resi 47 and name CA, 1TEN and resi 86 and name CA  # target=17.121695202262092 current=10.095581118829465
color yellow, pair_02
distance pair_03, 1TEN and resi 47 and name CA, 1TEN and resi 81 and name CA  # target=16.77830595334736 current=9.91569106664235
color yellow, pair_03
distance pair_04, 1TEN and resi 14 and name CA, 1TEN and resi 77 and name CA  # target=27.49999999763107 current=34.18643729074588
color yellow, pair_04
distance pair_05, 1TEN and resi 42 and name CA, 1TEN and resi 82 and name CA  # target=17.86623723487497 current=11.336141820799586
color yellow, pair_05
distance pair_06, 1TEN and resi 13 and name CA, 1TEN and resi 76 and name CA  # target=27.49999992724799 current=33.98789336536885
color yellow, pair_06
distance pair_07, 1TEN and resi 43 and name CA, 1TEN and resi 85 and name CA  # target=15.636655970487064 current=9.306693727496476
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
