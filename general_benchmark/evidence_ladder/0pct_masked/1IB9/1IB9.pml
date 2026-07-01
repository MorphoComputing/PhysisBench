# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.024634166981049574

load 1IB9.pdb, 1IB9
bg_color white
hide everything, 1IB9
show cartoon, 1IB9
color grey80, 1IB9
set cartoon_transparency, 0.1

select worst_residues, 1IB9 and resi 1+3+4+5+11+17+19+29+30+31
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1IB9 and resi 17 and name CA, 1IB9 and resi 25 and name CA  # target=4.036352970552817 current=3.717413394308
color yellow, pair_00
distance pair_01, 1IB9 and resi 17 and name CA, 1IB9 and resi 26 and name CA  # target=4.259721755474357 current=4.050165823836966
color yellow, pair_01
distance pair_02, 1IB9 and resi 13 and name CA, 1IB9 and resi 31 and name CA  # target=4.18914334452094 current=3.9848385087848706
color yellow, pair_02
distance pair_03, 1IB9 and resi 3 and name CA, 1IB9 and resi 13 and name CA  # target=21.727041344483222 current=21.88863867699378
color yellow, pair_03
distance pair_04, 1IB9 and resi 3 and name CA, 1IB9 and resi 12 and name CA  # target=21.230320016575643 current=21.388371053442583
color yellow, pair_04
distance pair_05, 1IB9 and resi 3 and name CA, 1IB9 and resi 15 and name CA  # target=20.847845697215735 current=20.995449576100178
color yellow, pair_05
distance pair_06, 1IB9 and resi 3 and name CA, 1IB9 and resi 11 and name CA  # target=21.413553235253996 current=21.56040347721754
color yellow, pair_06
distance pair_07, 1IB9 and resi 3 and name CA, 1IB9 and resi 30 and name CA  # target=21.136113253389937 current=21.266607132190206
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
