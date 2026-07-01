# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.062496051231564494

load 1GB1.pdb, 1GB1
bg_color white
hide everything, 1GB1
show cartoon, 1GB1
color grey80, 1GB1
set cartoon_transparency, 0.1

select worst_residues, 1GB1 and resi 1+2+7+9+10+21+37+46+47+48
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1GB1 and resi 9 and name CA, 1GB1 and resi 20 and name CA  # target=27.495952874646594 current=29.201709317700097
color yellow, pair_00
distance pair_01, 1GB1 and resi 10 and name CA, 1GB1 and resi 21 and name CA  # target=27.49344680087261 current=28.994071377617985
color yellow, pair_01
distance pair_02, 1GB1 and resi 12 and name CA, 1GB1 and resi 21 and name CA  # target=24.000650572986174 current=24.55648388814789
color yellow, pair_02
distance pair_03, 1GB1 and resi 11 and name CA, 1GB1 and resi 23 and name CA  # target=23.90972556568585 current=24.447086910233693
color yellow, pair_03
distance pair_04, 1GB1 and resi 35 and name CA, 1GB1 and resi 46 and name CA  # target=23.80266733174384 current=24.33773298192293
color yellow, pair_04
distance pair_05, 1GB1 and resi 9 and name CA, 1GB1 and resi 19 and name CA  # target=26.61631375794606 current=26.101080138845646
color yellow, pair_05
distance pair_06, 1GB1 and resi 11 and name CA, 1GB1 and resi 19 and name CA  # target=23.357823499206443 current=23.868277947792166
color yellow, pair_06
distance pair_07, 1GB1 and resi 11 and name CA, 1GB1 and resi 21 and name CA  # target=27.029206727573307 current=26.520900568480858
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
