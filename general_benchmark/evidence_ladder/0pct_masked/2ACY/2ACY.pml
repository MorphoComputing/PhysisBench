# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.06729989174481539

load 2ACY.pdb, 2ACY
bg_color white
hide everything, 2ACY
show cartoon, 2ACY
color grey80, 2ACY
set cartoon_transparency, 0.1

select worst_residues, 2ACY and resi 1+2+3+4+15+42+43+44+86+87
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2ACY and resi 6
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2ACY and resi 71 and name CA, 2ACY and resi 86 and name CA  # target=27.499999982348104 current=36.24989748290696
color yellow, pair_00
distance pair_01, 2ACY and resi 18 and name CA, 2ACY and resi 86 and name CA  # target=27.499999951688093 current=35.66463306217344
color yellow, pair_01
distance pair_02, 2ACY and resi 2 and name CA, 2ACY and resi 42 and name CA  # target=27.499999859630087 current=34.98622447809097
color yellow, pair_02
distance pair_03, 2ACY and resi 15 and name CA, 2ACY and resi 86 and name CA  # target=27.499999850126883 current=34.965416773737076
color yellow, pair_03
distance pair_04, 2ACY and resi 3 and name CA, 2ACY and resi 42 and name CA  # target=27.499999788948408 current=34.76963941944822
color yellow, pair_04
distance pair_05, 2ACY and resi 19 and name CA, 2ACY and resi 86 and name CA  # target=27.499999740987914 current=34.72561777334449
color yellow, pair_05
distance pair_06, 2ACY and resi 71 and name CA, 2ACY and resi 87 and name CA  # target=27.499999738260954 current=34.72072732103292
color yellow, pair_06
distance pair_07, 2ACY and resi 4 and name CA, 2ACY and resi 18 and name CA  # target=27.499999638980565 current=34.55440545635161
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
