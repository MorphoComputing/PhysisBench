# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.6927996875619812

load 2CRD.pdb, 2CRD
bg_color white
hide everything, 2CRD
show cartoon, 2CRD
color grey80, 2CRD
set cartoon_transparency, 0.1

select worst_residues, 2CRD and resi 2+4+6+7+9+20+22+23+28+34
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2CRD and resi 4 and name CA, 2CRD and resi 25 and name CA  # target=10.809748045435093 current=9.75288341810821
color yellow, pair_00
distance pair_01, 2CRD and resi 8 and name CA, 2CRD and resi 30 and name CA  # target=10.25172347285588 current=11.303642904856058
color yellow, pair_01
distance pair_02, 2CRD and resi 12 and name CA, 2CRD and resi 28 and name CA  # target=15.65918481172848 current=16.705024403616562
color yellow, pair_02
distance pair_03, 2CRD and resi 6 and name CA, 2CRD and resi 27 and name CA  # target=9.601660562654514 current=10.473483054126541
color yellow, pair_03
distance pair_04, 2CRD and resi 13 and name CA, 2CRD and resi 28 and name CA  # target=18.07877775743694 current=18.92871764574763
color yellow, pair_04
distance pair_05, 2CRD and resi 10 and name CA, 2CRD and resi 29 and name CA  # target=13.770309288088622 current=14.508179608145097
color yellow, pair_05
distance pair_06, 2CRD and resi 8 and name CA, 2CRD and resi 27 and name CA  # target=9.196156905919283 current=9.839999116059266
color yellow, pair_06
distance pair_07, 2CRD and resi 11 and name CA, 2CRD and resi 22 and name CA  # target=8.601833879258967 current=8.103410431248358
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
