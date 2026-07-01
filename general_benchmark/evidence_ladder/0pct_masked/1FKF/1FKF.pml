# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.6457132148639313

load 1FKF.pdb, 1FKF
bg_color white
hide everything, 1FKF
show cartoon, 1FKF
color grey80, 1FKF
set cartoon_transparency, 0.1

select worst_residues, 1FKF and resi 10+11+12+83+84+87+88+91+92+93
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1FKF and resi 12+69
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1FKF and resi 12 and name CA, 1FKF and resi 92 and name CA  # target=27.499999997015788 current=35.627360922252436
color yellow, pair_00
distance pair_01, 1FKF and resi 12 and name CA, 1FKF and resi 91 and name CA  # target=27.49999999586793 current=34.88624021044808
color yellow, pair_01
distance pair_02, 1FKF and resi 12 and name CA, 1FKF and resi 93 and name CA  # target=27.499999850936184 current=34.62636338949988
color yellow, pair_02
distance pair_03, 1FKF and resi 11 and name CA, 1FKF and resi 92 and name CA  # target=27.499999956071324 current=34.56056069000758
color yellow, pair_03
distance pair_04, 1FKF and resi 18 and name CA, 1FKF and resi 31 and name CA  # target=27.499999244736696 current=33.91625080106703
color yellow, pair_04
distance pair_05, 1FKF and resi 13 and name CA, 1FKF and resi 92 and name CA  # target=27.499999916812907 current=33.88604337156353
color yellow, pair_05
distance pair_06, 1FKF and resi 12 and name CA, 1FKF and resi 83 and name CA  # target=27.499999993457514 current=33.851952158111246
color yellow, pair_06
distance pair_07, 1FKF and resi 11 and name CA, 1FKF and resi 91 and name CA  # target=27.49999992529576 current=33.67726056403061
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
