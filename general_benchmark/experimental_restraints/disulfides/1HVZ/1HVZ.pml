# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.520159303281623

load 1HVZ.pdb, 1HVZ
bg_color white
hide everything, 1HVZ
show cartoon, 1HVZ
color grey80, 1HVZ
set cartoon_transparency, 0.1

select worst_residues, 1HVZ and resi 1+3+4+7+8+9+10+12+13+16
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1HVZ and resi 2 and name CA, 1HVZ and resi 15 and name CA  # target=5.526827568351721 current=4.458115283204085
color yellow, pair_00
distance pair_01, 1HVZ and resi 4 and name CA, 1HVZ and resi 13 and name CA  # target=5.526827568351721 current=4.755840095287722
color yellow, pair_01

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
