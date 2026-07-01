# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 7.260018056776772

load 1GB1.pdb, 1GB1
bg_color white
hide everything, 1GB1
show cartoon, 1GB1
color grey80, 1GB1
set cartoon_transparency, 0.1

select worst_residues, 1GB1 and resi 10+20+21+22+35+36+37+38+40+48
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1GB1 and resi 13+23+54+87
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1GB1 and resi 12 and name CA, 1GB1 and resi 37 and name CA  # target=4.47460509597741 current=14.591452864260704
color yellow, pair_00
distance pair_01, 1GB1 and resi 1 and name CA, 1GB1 and resi 20 and name CA  # target=3.523882894165543 current=13.56624042606577
color yellow, pair_01
distance pair_02, 1GB1 and resi 9 and name CA, 1GB1 and resi 39 and name CA  # target=4.893392851656878 current=13.742594815889408
color yellow, pair_02
distance pair_03, 1GB1 and resi 2 and name CA, 1GB1 and resi 19 and name CA  # target=3.6508476368543064 current=12.360981735854754
color yellow, pair_03
distance pair_04, 1GB1 and resi 10 and name CA, 1GB1 and resi 39 and name CA  # target=5.790717228239924 current=14.168631576417804
color yellow, pair_04
distance pair_05, 1GB1 and resi 3 and name CA, 1GB1 and resi 20 and name CA  # target=4.822327131090315 current=12.871950502544946
color yellow, pair_05
distance pair_06, 1GB1 and resi 27 and name CA, 1GB1 and resi 52 and name CA  # target=4.028908588844348 current=11.60410436894793
color yellow, pair_06
distance pair_07, 1GB1 and resi 23 and name CA, 1GB1 and resi 52 and name CA  # target=4.822327131090315 current=11.212583858794641
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
