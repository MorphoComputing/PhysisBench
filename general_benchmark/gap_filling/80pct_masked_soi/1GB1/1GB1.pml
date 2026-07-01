# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.46068723207931883

load 1GB1.pdb, 1GB1
bg_color white
hide everything, 1GB1
show cartoon, 1GB1
color grey80, 1GB1
set cartoon_transparency, 0.1

select worst_residues, 1GB1 and resi 9+20+22+23+25+27+33+45+47+48
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1GB1 and resi 10 and name CA, 1GB1 and resi 21 and name CA  # target=27.49344680087261 current=29.071598351975258
color yellow, pair_00
distance pair_01, 1GB1 and resi 23 and name CA, 1GB1 and resi 47 and name CA  # target=16.1521926731264 current=14.817316138888154
color yellow, pair_01
distance pair_02, 1GB1 and resi 20 and name CA, 1GB1 and resi 32 and name CA  # target=16.770206354765715 current=15.844638340751475
color yellow, pair_02
distance pair_03, 1GB1 and resi 22 and name CA, 1GB1 and resi 49 and name CA  # target=9.756490325970265 current=8.936159736234167
color yellow, pair_03
distance pair_04, 1GB1 and resi 13 and name CA, 1GB1 and resi 42 and name CA  # target=14.411050402995926 current=15.099031525235047
color yellow, pair_04
distance pair_05, 1GB1 and resi 12 and name CA, 1GB1 and resi 21 and name CA  # target=24.000650572986174 current=24.663565099947586
color yellow, pair_05
distance pair_06, 1GB1 and resi 9 and name CA, 1GB1 and resi 37 and name CA  # target=10.177808981310895 current=10.813467919601608
color yellow, pair_06
distance pair_07, 1GB1 and resi 9 and name CA, 1GB1 and resi 39 and name CA  # target=10.681900038036945 current=11.27888571162427
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
