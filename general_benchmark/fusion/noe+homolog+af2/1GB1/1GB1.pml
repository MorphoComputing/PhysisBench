# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.0447210413929517

load 1GB1.pdb, 1GB1
bg_color white
hide everything, 1GB1
show cartoon, 1GB1
color grey80, 1GB1
set cartoon_transparency, 0.1

select worst_residues, 1GB1 and resi 3+9+10+11+13+22+23+35+36+40
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1GB1 and resi 21+31
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1GB1 and resi 30 and name CA, 1GB1 and resi 42 and name CA  # target=4.507975919933174 current=7.7390438039045275
color yellow, pair_00
distance pair_01, 1GB1 and resi 16 and name CA, 1GB1 and resi 29 and name CA  # target=4.507975919933174 current=7.29902421535547
color yellow, pair_01
distance pair_02, 1GB1 and resi 3 and name CA, 1GB1 and resi 29 and name CA  # target=4.507975919933174 current=7.238338212095859
color yellow, pair_02
distance pair_03, 1GB1 and resi 43 and name CA, 1GB1 and resi 53 and name CA  # target=3.6508476368543064 current=6.217360763486676
color yellow, pair_03
distance pair_04, 1GB1 and resi 6 and name CA, 1GB1 and resi 14 and name CA  # target=3.702731984431378 current=6.175851065808283
color yellow, pair_04
distance pair_05, 1GB1 and resi 26 and name CA, 1GB1 and resi 51 and name CA  # target=4.647636918307805 current=7.002275074768301
color yellow, pair_05
distance pair_06, 1GB1 and resi 3 and name CA, 1GB1 and resi 49 and name CA  # target=4.028908588844348 current=6.34688185744262
color yellow, pair_06
distance pair_07, 1GB1 and resi 42 and name CA, 1GB1 and resi 54 and name CA  # target=4.028908588844348 current=6.327344794205363
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
