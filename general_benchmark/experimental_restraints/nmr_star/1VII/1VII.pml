# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.041500159638611

load 1VII.pdb, 1VII
bg_color white
hide everything, 1VII
show cartoon, 1VII
color grey80, 1VII
set cartoon_transparency, 0.1

select worst_residues, 1VII and resi 2+3+4+11+12+14+15+18+21+26
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1VII and resi 3+8
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1VII and resi 7 and name CA, 1VII and resi 18 and name CA  # target=4.028908588844348 current=8.351615343305628
color yellow, pair_00
distance pair_01, 1VII and resi 18 and name CA, 1VII and resi 30 and name CA  # target=4.028908588844348 current=7.839912738266694
color yellow, pair_01
distance pair_02, 1VII and resi 18 and name CA, 1VII and resi 33 and name CA  # target=4.647636918307805 current=7.930852399217788
color yellow, pair_02
distance pair_03, 1VII and resi 4 and name CA, 1VII and resi 15 and name CA  # target=4.647636918307805 current=7.474546705615684
color yellow, pair_03
distance pair_04, 1VII and resi 21 and name CA, 1VII and resi 29 and name CA  # target=4.028908588844348 current=6.717758782168685
color yellow, pair_04
distance pair_05, 1VII and resi 2 and name CA, 1VII and resi 15 and name CA  # target=4.647636918307805 current=7.0251653506459135
color yellow, pair_05
distance pair_06, 1VII and resi 2 and name CA, 1VII and resi 11 and name CA  # target=4.028908588844348 current=6.367693833975785
color yellow, pair_06
distance pair_07, 1VII and resi 11 and name CA, 1VII and resi 34 and name CA  # target=4.647636918307805 current=6.685943414124256
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
