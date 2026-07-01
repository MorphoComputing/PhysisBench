# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.7010269906686177

load 1FKF.pdb, 1FKF
bg_color white
hide everything, 1FKF
show cartoon, 1FKF
color grey80, 1FKF
set cartoon_transparency, 0.1

select worst_residues, 1FKF and resi 10+11+12+83+84+86+87+88+91+92
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1FKF and resi 8
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1FKF and resi 54 and name CA, 1FKF and resi 87 and name CA  # target=17.179455949978745 current=10.227161618706884
color yellow, pair_00
distance pair_01, 1FKF and resi 10 and name CA, 1FKF and resi 92 and name CA  # target=27.496563450410378 current=33.586023923346254
color yellow, pair_01
distance pair_02, 1FKF and resi 55 and name CA, 1FKF and resi 87 and name CA  # target=15.997343390322438 current=9.955156393610947
color yellow, pair_02
distance pair_03, 1FKF and resi 10 and name CA, 1FKF and resi 91 and name CA  # target=27.4940165004807 current=33.48544286432981
color yellow, pair_03
distance pair_04, 1FKF and resi 10 and name CA, 1FKF and resi 88 and name CA  # target=27.49860682054753 current=33.14324453113107
color yellow, pair_04
distance pair_05, 1FKF and resi 55 and name CA, 1FKF and resi 88 and name CA  # target=17.87567731754193 current=12.304713425456042
color yellow, pair_05
distance pair_06, 1FKF and resi 18 and name CA, 1FKF and resi 31 and name CA  # target=27.476770715761887 current=32.98690211560374
color yellow, pair_06
distance pair_07, 1FKF and resi 10 and name CA, 1FKF and resi 84 and name CA  # target=27.49763272604342 current=32.801088569954466
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
