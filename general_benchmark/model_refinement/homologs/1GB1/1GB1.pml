# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.5647892044126956

load 1GB1.pdb, 1GB1
bg_color white
hide everything, 1GB1
show cartoon, 1GB1
color grey80, 1GB1
set cartoon_transparency, 0.1

select worst_residues, 1GB1 and resi 9+10+11+13+14+15+17+22+24+35
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1GB1 and resi 9 and name CA, 1GB1 and resi 20 and name CA  # target=27.109486998442954 current=29.31103106364957
color yellow, pair_00
distance pair_01, 1GB1 and resi 2 and name CA, 1GB1 and resi 50 and name CA  # target=6.851361568008205 current=5.069048145419905
color yellow, pair_01
distance pair_02, 1GB1 and resi 2 and name CA, 1GB1 and resi 49 and name CA  # target=6.65587886188639 current=4.901076370522936
color yellow, pair_02
distance pair_03, 1GB1 and resi 20 and name CA, 1GB1 and resi 38 and name CA  # target=21.694092022442018 current=23.321927099567553
color yellow, pair_03
distance pair_04, 1GB1 and resi 11 and name CA, 1GB1 and resi 20 and name CA  # target=23.580015469313626 current=25.1614104726888
color yellow, pair_04
distance pair_05, 1GB1 and resi 2 and name CA, 1GB1 and resi 51 and name CA  # target=8.375728063961425 current=6.799310733136443
color yellow, pair_05
distance pair_06, 1GB1 and resi 11 and name CA, 1GB1 and resi 21 and name CA  # target=22.470499658120925 current=24.013345949259374
color yellow, pair_06
distance pair_07, 1GB1 and resi 12 and name CA, 1GB1 and resi 20 and name CA  # target=23.622002210540376 current=25.08324703612787
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
