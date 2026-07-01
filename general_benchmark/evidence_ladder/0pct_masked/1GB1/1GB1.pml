# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.02187847897931795

load 1GB1.pdb, 1GB1
bg_color white
hide everything, 1GB1
show cartoon, 1GB1
color grey80, 1GB1
set cartoon_transparency, 0.1

select worst_residues, 1GB1 and resi 1+2+3+7+9+10+37+40+46+47
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1GB1 and resi 10 and name CA, 1GB1 and resi 20 and name CA  # target=27.499066260966902 current=30.174525434681314
color yellow, pair_00
distance pair_01, 1GB1 and resi 9 and name CA, 1GB1 and resi 20 and name CA  # target=27.495952874646594 current=29.348624728676835
color yellow, pair_01
distance pair_02, 1GB1 and resi 10 and name CA, 1GB1 and resi 21 and name CA  # target=27.49344680087261 current=29.086825174747506
color yellow, pair_02
distance pair_03, 1GB1 and resi 8 and name CA, 1GB1 and resi 21 and name CA  # target=23.658906320068354 current=24.272911854923716
color yellow, pair_03
distance pair_04, 1GB1 and resi 11 and name CA, 1GB1 and resi 23 and name CA  # target=23.90972556568585 current=24.519795794771802
color yellow, pair_04
distance pair_05, 1GB1 and resi 35 and name CA, 1GB1 and resi 46 and name CA  # target=23.80266733174384 current=24.409793073476358
color yellow, pair_05
distance pair_06, 1GB1 and resi 12 and name CA, 1GB1 and resi 21 and name CA  # target=24.000650572986174 current=24.6021653782258
color yellow, pair_06
distance pair_07, 1GB1 and resi 36 and name CA, 1GB1 and resi 46 and name CA  # target=23.770948583440713 current=24.36794528900475
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
