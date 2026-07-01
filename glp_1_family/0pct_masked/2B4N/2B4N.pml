# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.5207293972073002

load 2B4N.pdb, 2B4N
bg_color white
hide everything, 2B4N
show cartoon, 2B4N
color grey80, 2B4N
set cartoon_transparency, 0.1

select worst_residues, 2B4N and resi 2+8+10+22+25+26+31+36+38+39
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2B4N and resi 1 and name CA, 2B4N and resi 35 and name CA  # target=52.212807686740746 current=50.65810308594195
color yellow, pair_00
distance pair_01, 2B4N and resi 6 and name CA, 2B4N and resi 38 and name CA  # target=56.85193584954597 current=55.394960037324914
color yellow, pair_01
distance pair_02, 2B4N and resi 2 and name CA, 2B4N and resi 38 and name CA  # target=57.37845003886042 current=55.93069611148892
color yellow, pair_02
distance pair_03, 2B4N and resi 3 and name CA, 2B4N and resi 30 and name CA  # target=42.085809566080336 current=40.642130321955996
color yellow, pair_03
distance pair_04, 2B4N and resi 5 and name CA, 2B4N and resi 27 and name CA  # target=37.02667941754603 current=35.63551800942358
color yellow, pair_04
distance pair_05, 2B4N and resi 6 and name CA, 2B4N and resi 29 and name CA  # target=36.95018729982996 current=35.574108485070575
color yellow, pair_05
distance pair_06, 2B4N and resi 2 and name CA, 2B4N and resi 35 and name CA  # target=51.39267078056983 current=50.03264652185862
color yellow, pair_06
distance pair_07, 2B4N and resi 1 and name CA, 2B4N and resi 38 and name CA  # target=57.431381287122164 current=56.10774977956149
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
