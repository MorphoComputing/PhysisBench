# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS | CA RMSD: 0.31916611276530693

load 1D0R.pdb, 1D0R
bg_color white
hide everything, 1D0R
show cartoon, 1D0R
color grey80, 1D0R
set cartoon_transparency, 0.1

select worst_residues, 1D0R and resi 1+2+3+4+9+18+19+24+26+28
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1D0R and resi 1 and name CA, 1D0R and resi 22 and name CA  # target=31.648997348263343 current=30.4580335994982
color yellow, pair_00
distance pair_01, 1D0R and resi 4 and name CA, 1D0R and resi 25 and name CA  # target=36.74860588105561 current=35.58430487650235
color yellow, pair_01
distance pair_02, 1D0R and resi 1 and name CA, 1D0R and resi 21 and name CA  # target=31.322539352304485 current=30.17204834244587
color yellow, pair_02
distance pair_03, 1D0R and resi 6 and name CA, 1D0R and resi 25 and name CA  # target=32.20376968075356 current=31.086336481137593
color yellow, pair_03
distance pair_04, 1D0R and resi 5 and name CA, 1D0R and resi 28 and name CA  # target=37.20373173626808 current=36.16625021110783
color yellow, pair_04
distance pair_05, 1D0R and resi 2 and name CA, 1D0R and resi 26 and name CA  # target=37.11137318287406 current=36.08891507983616
color yellow, pair_05
distance pair_06, 1D0R and resi 2 and name CA, 1D0R and resi 25 and name CA  # target=32.836145448026556 current=33.81906526386744
color yellow, pair_06
distance pair_07, 1D0R and resi 5 and name CA, 1D0R and resi 24 and name CA  # target=32.25864112159938 current=31.282088667294094
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
