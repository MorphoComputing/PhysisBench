# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.6546969670512603

load 1FKF.pdb, 1FKF
bg_color white
hide everything, 1FKF
show cartoon, 1FKF
color grey80, 1FKF
set cartoon_transparency, 0.1

select worst_residues, 1FKF and resi 11+12+83+84+85+87+88+91+92+93
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1FKF and resi 4+15+64+84+88+92
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1FKF and resi 55 and name CA, 1FKF and resi 87 and name CA  # target=15.238488368432066 current=8.698448516718162
color yellow, pair_00
distance pair_01, 1FKF and resi 79 and name CA, 1FKF and resi 87 and name CA  # target=16.760391021655742 current=10.490066820200509
color yellow, pair_01
distance pair_02, 1FKF and resi 55 and name CA, 1FKF and resi 88 and name CA  # target=17.069926363562722 current=10.86904164726283
color yellow, pair_02
distance pair_03, 1FKF and resi 54 and name CA, 1FKF and resi 87 and name CA  # target=16.598748240083854 current=10.681184428591163
color yellow, pair_03
distance pair_04, 1FKF and resi 10 and name CA, 1FKF and resi 91 and name CA  # target=27.493866934083595 current=33.324315162892006
color yellow, pair_04
distance pair_05, 1FKF and resi 10 and name CA, 1FKF and resi 88 and name CA  # target=27.498327925973364 current=33.315344825040924
color yellow, pair_05
distance pair_06, 1FKF and resi 10 and name CA, 1FKF and resi 86 and name CA  # target=27.48564295642498 current=33.28075263086084
color yellow, pair_06
distance pair_07, 1FKF and resi 78 and name CA, 1FKF and resi 87 and name CA  # target=16.14835157111037 current=10.391444397928055
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
