# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 6.664003104503101

load 2CRD.pdb, 2CRD
bg_color white
hide everything, 2CRD
show cartoon, 2CRD
color grey80, 2CRD
set cartoon_transparency, 0.1

select worst_residues, 2CRD and resi 1+2+4+7+9+18+24+27+28+29
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2CRD and resi 15 and name CA, 2CRD and resi 33 and name CA  # target=5.526827568351721 current=11.479366517334814
color yellow, pair_00
distance pair_01, 2CRD and resi 11 and name CA, 2CRD and resi 31 and name CA  # target=5.526827568351721 current=7.459142502374264
color yellow, pair_01
distance pair_02, 2CRD and resi 5 and name CA, 2CRD and resi 26 and name CA  # target=5.526827568351721 current=6.348698246147691
color yellow, pair_02

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
