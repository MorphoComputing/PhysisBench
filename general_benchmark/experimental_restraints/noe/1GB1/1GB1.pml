# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 8.157618434625755

load 1GB1.pdb, 1GB1
bg_color white
hide everything, 1GB1
show cartoon, 1GB1
color grey80, 1GB1
set cartoon_transparency, 0.1

select worst_residues, 1GB1 and resi 9+10+20+23+24+35+36+37+47+48
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1GB1 and resi 4+21+34
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1GB1 and resi 11 and name CA, 1GB1 and resi 36 and name CA  # target=5.353974409403234 current=11.21100240464868
color yellow, pair_00
distance pair_01, 1GB1 and resi 11 and name CA, 1GB1 and resi 38 and name CA  # target=6.438814307639179 current=11.756302082287148
color yellow, pair_01
distance pair_02, 1GB1 and resi 1 and name CA, 1GB1 and resi 18 and name CA  # target=3.6508476368543064 current=8.953193447311047
color yellow, pair_02
distance pair_03, 1GB1 and resi 9 and name CA, 1GB1 and resi 38 and name CA  # target=6.438814307639179 current=11.296263375112229
color yellow, pair_03
distance pair_04, 1GB1 and resi 41 and name CA, 1GB1 and resi 54 and name CA  # target=4.028908588844348 current=8.45649777410135
color yellow, pair_04
distance pair_05, 1GB1 and resi 16 and name CA, 1GB1 and resi 29 and name CA  # target=4.507975919933174 current=8.857098954043103
color yellow, pair_05
distance pair_06, 1GB1 and resi 8 and name CA, 1GB1 and resi 38 and name CA  # target=5.533144452470395 current=9.775560918530566
color yellow, pair_06
distance pair_07, 1GB1 and resi 7 and name CA, 1GB1 and resi 38 and name CA  # target=6.438814307639179 current=10.54020670803688
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
