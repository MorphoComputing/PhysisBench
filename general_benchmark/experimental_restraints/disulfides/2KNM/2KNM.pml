# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 6.123365393017493

load 2KNM.pdb, 2KNM
bg_color white
hide everything, 2KNM
show cartoon, 2KNM
color grey80, 2KNM
set cartoon_transparency, 0.1

select worst_residues, 2KNM and resi 1+2+8+10+16+17+21+22+23+24
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2KNM and resi 7 and name CA, 2KNM and resi 21 and name CA  # target=5.526827568351721 current=8.84001803586683
color yellow, pair_00
distance pair_01, 2KNM and resi 3 and name CA, 2KNM and resi 19 and name CA  # target=5.526827568351721 current=7.19625942266117
color yellow, pair_01
distance pair_02, 2KNM and resi 12 and name CA, 2KNM and resi 26 and name CA  # target=5.526827568351721 current=6.2103089087285435
color yellow, pair_02

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
