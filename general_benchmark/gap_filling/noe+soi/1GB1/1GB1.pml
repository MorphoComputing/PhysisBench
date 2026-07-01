# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 6.991991143161622

load 1GB1.pdb, 1GB1
bg_color white
hide everything, 1GB1
show cartoon, 1GB1
color grey80, 1GB1
set cartoon_transparency, 0.1

select worst_residues, 1GB1 and resi 9+10+19+20+21+22+23+27+36+37
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1GB1 and resi 3+13+26+29+30+42
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1GB1 and resi 1 and name CA, 1GB1 and resi 18 and name CA  # target=3.6508476368543064 current=11.83657375554235
color yellow, pair_00
distance pair_01, 1GB1 and resi 2 and name CA, 1GB1 and resi 19 and name CA  # target=5.713081305182573 current=13.54889698031403
color yellow, pair_01
distance pair_02, 1GB1 and resi 26 and name CA, 1GB1 and resi 51 and name CA  # target=4.647636918307805 current=12.445096909151127
color yellow, pair_02
distance pair_03, 1GB1 and resi 3 and name CA, 1GB1 and resi 29 and name CA  # target=4.507975919933174 current=10.032104403187901
color yellow, pair_03
distance pair_04, 1GB1 and resi 2 and name CA, 1GB1 and resi 25 and name CA  # target=5.391441194277165 current=10.743918035369608
color yellow, pair_04
distance pair_05, 1GB1 and resi 30 and name CA, 1GB1 and resi 42 and name CA  # target=4.507975919933174 current=9.720386272965074
color yellow, pair_05
distance pair_06, 1GB1 and resi 25 and name CA, 1GB1 and resi 44 and name CA  # target=5.533144452470395 current=10.67343733277975
color yellow, pair_06
distance pair_07, 1GB1 and resi 17 and name CA, 1GB1 and resi 28 and name CA  # target=5.713081305182573 current=10.46738642533847
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
