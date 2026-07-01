# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 8.619014741548016

load 1B3C.pdb, 1B3C
bg_color white
hide everything, 1B3C
show cartoon, 1B3C
color grey80, 1B3C
set cartoon_transparency, 0.1

select worst_residues, 1B3C and resi 1+15+16+20+31+32+33+34+52+61
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1B3C and resi 27 and name CA, 1B3C and resi 46 and name CA  # target=5.526827568351721 current=8.124804599282056
color yellow, pair_00
distance pair_01, 1B3C and resi 23 and name CA, 1B3C and resi 44 and name CA  # target=5.526827568351721 current=7.913812289555304
color yellow, pair_01
distance pair_02, 1B3C and resi 14 and name CA, 1B3C and resi 39 and name CA  # target=5.526827568351721 current=7.669771574883309
color yellow, pair_02

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
