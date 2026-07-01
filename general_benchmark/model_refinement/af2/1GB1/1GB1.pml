# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.0082689481468214

load 1GB1.pdb, 1GB1
bg_color white
hide everything, 1GB1
show cartoon, 1GB1
color grey80, 1GB1
set cartoon_transparency, 0.1

select worst_residues, 1GB1 and resi 9+10+11+25+34+35+40+48+49+50
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1GB1 and resi 9 and name CA, 1GB1 and resi 20 and name CA  # target=27.31202079806769 current=29.907407490376592
color yellow, pair_00
distance pair_01, 1GB1 and resi 10 and name CA, 1GB1 and resi 20 and name CA  # target=27.15624969207065 current=28.96861294906998
color yellow, pair_01
distance pair_02, 1GB1 and resi 9 and name CA, 1GB1 and resi 21 and name CA  # target=26.925307862639876 current=28.167467368707072
color yellow, pair_02
distance pair_03, 1GB1 and resi 2 and name CA, 1GB1 and resi 51 and name CA  # target=7.751040561130179 current=6.678099468559111
color yellow, pair_03
distance pair_04, 1GB1 and resi 2 and name CA, 1GB1 and resi 50 and name CA  # target=6.225625886621237 current=5.240795568948619
color yellow, pair_04
distance pair_05, 1GB1 and resi 10 and name CA, 1GB1 and resi 21 and name CA  # target=26.700224332534223 current=27.642052385168203
color yellow, pair_05
distance pair_06, 1GB1 and resi 11 and name CA, 1GB1 and resi 46 and name CA  # target=22.782115475535853 current=23.655851463741325
color yellow, pair_06
distance pair_07, 1GB1 and resi 4 and name CA, 1GB1 and resi 51 and name CA  # target=5.33564533236374 current=4.4619313295811525
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
