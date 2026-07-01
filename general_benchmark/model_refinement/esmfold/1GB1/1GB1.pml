# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.9814644223745579

load 1GB1.pdb, 1GB1
bg_color white
hide everything, 1GB1
show cartoon, 1GB1
color grey80, 1GB1
set cartoon_transparency, 0.1

select worst_residues, 1GB1 and resi 9+10+25+26+34+35+39+40+49+50
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1GB1 and resi 9 and name CA, 1GB1 and resi 20 and name CA  # target=27.367491238934853 current=30.028780875669796
color yellow, pair_00
distance pair_01, 1GB1 and resi 10 and name CA, 1GB1 and resi 20 and name CA  # target=27.34439360216055 current=29.81950847922825
color yellow, pair_01
distance pair_02, 1GB1 and resi 10 and name CA, 1GB1 and resi 21 and name CA  # target=27.102150322640604 current=28.575345822350016
color yellow, pair_02
distance pair_03, 1GB1 and resi 9 and name CA, 1GB1 and resi 21 and name CA  # target=27.0623188876406 current=28.36482375443256
color yellow, pair_03
distance pair_04, 1GB1 and resi 2 and name CA, 1GB1 and resi 51 and name CA  # target=7.755754998946469 current=6.636271986066984
color yellow, pair_04
distance pair_05, 1GB1 and resi 2 and name CA, 1GB1 and resi 50 and name CA  # target=6.214350728980452 current=5.19273254970049
color yellow, pair_05
distance pair_06, 1GB1 and resi 4 and name CA, 1GB1 and resi 51 and name CA  # target=5.330231854912353 current=4.44187702913813
color yellow, pair_06
distance pair_07, 1GB1 and resi 2 and name CA, 1GB1 and resi 52 and name CA  # target=10.96320195048942 current=10.106283925691784
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
