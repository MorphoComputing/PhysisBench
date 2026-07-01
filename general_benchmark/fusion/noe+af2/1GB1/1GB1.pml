# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.962894630819478

load 1GB1.pdb, 1GB1
bg_color white
hide everything, 1GB1
show cartoon, 1GB1
color grey80, 1GB1
set cartoon_transparency, 0.1

select worst_residues, 1GB1 and resi 3+9+10+11+35+40+41+47+49+50
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1GB1 and resi 29+30+45+61
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1GB1 and resi 30 and name CA, 1GB1 and resi 42 and name CA  # target=4.507975919933174 current=8.315797912458175
color yellow, pair_00
distance pair_01, 1GB1 and resi 3 and name CA, 1GB1 and resi 29 and name CA  # target=4.507975919933174 current=7.531340468204764
color yellow, pair_01
distance pair_02, 1GB1 and resi 16 and name CA, 1GB1 and resi 29 and name CA  # target=4.507975919933174 current=7.403017712529339
color yellow, pair_02
distance pair_03, 1GB1 and resi 43 and name CA, 1GB1 and resi 53 and name CA  # target=3.6508476368543064 current=6.172065997793033
color yellow, pair_03
distance pair_04, 1GB1 and resi 17 and name CA, 1GB1 and resi 29 and name CA  # target=4.647636918307805 current=7.103849399203671
color yellow, pair_04
distance pair_05, 1GB1 and resi 9 and name CA, 1GB1 and resi 20 and name CA  # target=27.31202079806769 current=29.72885311893884
color yellow, pair_05
distance pair_06, 1GB1 and resi 42 and name CA, 1GB1 and resi 54 and name CA  # target=4.028908588844348 current=6.4397589736466285
color yellow, pair_06
distance pair_07, 1GB1 and resi 26 and name CA, 1GB1 and resi 51 and name CA  # target=4.647636918307805 current=7.052091258014574
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
