# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.0666411776151945

load 2CRD.pdb, 2CRD
bg_color white
hide everything, 2CRD
show cartoon, 2CRD
color grey80, 2CRD
set cartoon_transparency, 0.1

select worst_residues, 2CRD and resi 6+7+9+17+18+19+20+28+29+31
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2CRD and resi 6 and name CA, 2CRD and resi 20 and name CA  # target=20.642834966694632 current=21.34222088834652
color yellow, pair_00
distance pair_01, 2CRD and resi 24 and name CA, 2CRD and resi 33 and name CA  # target=5.240285218683053 current=4.6169857736088815
color yellow, pair_01
distance pair_02, 2CRD and resi 11 and name CA, 2CRD and resi 31 and name CA  # target=5.809737362095079 current=5.211323153739917
color yellow, pair_02
distance pair_03, 2CRD and resi 20 and name CA, 2CRD and resi 29 and name CA  # target=20.49998545959809 current=21.077820530248047
color yellow, pair_03
distance pair_04, 2CRD and resi 17 and name CA, 2CRD and resi 29 and name CA  # target=18.52370261910511 current=19.092176365269037
color yellow, pair_04
distance pair_05, 2CRD and resi 7 and name CA, 2CRD and resi 20 and name CA  # target=19.032680602857305 current=19.576199315117066
color yellow, pair_05
distance pair_06, 2CRD and resi 26 and name CA, 2CRD and resi 34 and name CA  # target=11.268389464530891 current=10.732371121324352
color yellow, pair_06
distance pair_07, 2CRD and resi 5 and name CA, 2CRD and resi 22 and name CA  # target=14.762971073698894 current=15.297307379217024
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
