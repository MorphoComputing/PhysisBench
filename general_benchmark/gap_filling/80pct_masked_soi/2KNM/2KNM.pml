# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.468850418620137

load 2KNM.pdb, 2KNM
bg_color white
hide everything, 2KNM
show cartoon, 2KNM
color grey80, 2KNM
set cartoon_transparency, 0.1

select worst_residues, 2KNM and resi 1+4+10+13+14+15+16+17+22+28
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2KNM and resi 1 and name CA, 2KNM and resi 28 and name CA  # target=6.558217444746509 current=4.906208147739705
color yellow, pair_00
distance pair_01, 2KNM and resi 1 and name CA, 2KNM and resi 15 and name CA  # target=12.656758499765317 current=11.153458483202309
color yellow, pair_01
distance pair_02, 2KNM and resi 2 and name CA, 2KNM and resi 16 and name CA  # target=14.136318182987889 current=12.723386389117147
color yellow, pair_02
distance pair_03, 2KNM and resi 7 and name CA, 2KNM and resi 16 and name CA  # target=14.967632152225319 current=16.00067367332895
color yellow, pair_03
distance pair_04, 2KNM and resi 2 and name CA, 2KNM and resi 28 and name CA  # target=5.078154696918075 current=5.963410482428344
color yellow, pair_04
distance pair_05, 2KNM and resi 8 and name CA, 2KNM and resi 17 and name CA  # target=19.394316147278023 current=20.12539659634039
color yellow, pair_05
distance pair_06, 2KNM and resi 19 and name CA, 2KNM and resi 28 and name CA  # target=4.513047188598279 current=3.799999870776566
color yellow, pair_06
distance pair_07, 2KNM and resi 11 and name CA, 2KNM and resi 24 and name CA  # target=10.696192990703677 current=11.308368077322324
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
