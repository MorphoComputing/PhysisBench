# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.42964351823783964

load 1POH.pdb, 1POH
bg_color white
hide everything, 1POH
show cartoon, 1POH
color grey80, 1POH
set cartoon_transparency, 0.1

select worst_residues, 1POH and resi 11+14+15+16+37+38+47+48+50+53
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1POH and resi 10 and name CA, 1POH and resi 67 and name CA  # target=27.47821892021538 current=33.33587579346084
color yellow, pair_00
distance pair_01, 1POH and resi 11 and name CA, 1POH and resi 67 and name CA  # target=27.465323282691696 current=32.72223094660781
color yellow, pair_01
distance pair_02, 1POH and resi 10 and name CA, 1POH and resi 66 and name CA  # target=27.443095654589534 current=31.892521737938477
color yellow, pair_02
distance pair_03, 1POH and resi 11 and name CA, 1POH and resi 66 and name CA  # target=27.397146096706415 current=31.085877556563574
color yellow, pair_03
distance pair_04, 1POH and resi 56 and name CA, 1POH and resi 67 and name CA  # target=27.388265036534946 current=30.863414755158285
color yellow, pair_04
distance pair_05, 1POH and resi 57 and name CA, 1POH and resi 67 and name CA  # target=27.352264383430345 current=30.418010782027448
color yellow, pair_05
distance pair_06, 1POH and resi 10 and name CA, 1POH and resi 29 and name CA  # target=27.340255870908166 current=30.288150145206156
color yellow, pair_06
distance pair_07, 1POH and resi 55 and name CA, 1POH and resi 67 and name CA  # target=27.319900690950778 current=30.149038285248675
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
