# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 9.663542941588233

load 1KTH.pdb, 1KTH
bg_color white
hide everything, 1KTH
show cartoon, 1KTH
color grey80, 1KTH
set cartoon_transparency, 0.1

select worst_residues, 1KTH and resi 1+2+3+5+15+19+35+36+38+56
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1KTH and resi 4 and name CA, 1KTH and resi 54 and name CA  # target=5.526827568351721 current=6.349692099767462
color yellow, pair_00
distance pair_01, 1KTH and resi 13 and name CA, 1KTH and resi 37 and name CA  # target=5.526827568351721 current=6.107659395779761
color yellow, pair_01
distance pair_02, 1KTH and resi 29 and name CA, 1KTH and resi 50 and name CA  # target=5.526827568351721 current=5.42718667350729
color yellow, pair_02

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
