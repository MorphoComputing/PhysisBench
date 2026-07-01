# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.7106234455981182

load 1GB1.pdb, 1GB1
bg_color white
hide everything, 1GB1
show cartoon, 1GB1
color grey80, 1GB1
set cartoon_transparency, 0.1

select worst_residues, 1GB1 and resi 3+6+8+9+13+17+37+47+48+53
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1GB1 and resi 8+35+51+89+200+395
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1GB1 and resi 5 and name CA, 1GB1 and resi 32 and name CA  # target=20.77971525244513 current=10.051414836493777
color yellow, pair_00
distance pair_01, 1GB1 and resi 15 and name CA, 1GB1 and resi 46 and name CA  # target=22.52341382738713 current=14.203982038989812
color yellow, pair_01
distance pair_02, 1GB1 and resi 21 and name CA, 1GB1 and resi 54 and name CA  # target=13.150218141809669 current=20.88791967157782
color yellow, pair_02
distance pair_03, 1GB1 and resi 6 and name CA, 1GB1 and resi 38 and name CA  # target=11.981396553586265 current=4.6709539190138
color yellow, pair_03
distance pair_04, 1GB1 and resi 12 and name CA, 1GB1 and resi 28 and name CA  # target=9.455245086837596 current=16.763554296128234
color yellow, pair_04
distance pair_05, 1GB1 and resi 17 and name CA, 1GB1 and resi 49 and name CA  # target=15.16831183585693 current=7.948851320107352
color yellow, pair_05
distance pair_06, 1GB1 and resi 7 and name CA, 1GB1 and resi 29 and name CA  # target=6.269814218342967 current=13.483707938352651
color yellow, pair_06
distance pair_07, 1GB1 and resi 2 and name CA, 1GB1 and resi 38 and name CA  # target=23.61546167453043 current=16.425852840894287
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
