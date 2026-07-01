# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.78865058285471

load 2B4N.pdb, 2B4N
bg_color white
hide everything, 2B4N
show cartoon, 2B4N
color grey80, 2B4N
set cartoon_transparency, 0.1

select worst_residues, 2B4N and resi 1+2+3+8+19+27+28+35+39+40
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2B4N and resi 9 and name CA, 2B4N and resi 33 and name CA  # target=37.648215138948 current=39.32369222124375
color yellow, pair_00
distance pair_01, 2B4N and resi 26 and name CA, 2B4N and resi 35 and name CA  # target=19.079459360848283 current=20.236666062555646
color yellow, pair_01
distance pair_02, 2B4N and resi 22 and name CA, 2B4N and resi 35 and name CA  # target=24.31588613191379 current=25.375742642554343
color yellow, pair_02
distance pair_03, 2B4N and resi 21 and name CA, 2B4N and resi 36 and name CA  # target=31.797429714996913 current=30.823674592224563
color yellow, pair_03
distance pair_04, 2B4N and resi 15 and name CA, 2B4N and resi 24 and name CA  # target=14.39352348840426 current=13.424016159205813
color yellow, pair_04
distance pair_05, 2B4N and resi 19 and name CA, 2B4N and resi 31 and name CA  # target=18.26367117637634 current=19.163641584052804
color yellow, pair_05
distance pair_06, 2B4N and resi 15 and name CA, 2B4N and resi 33 and name CA  # target=27.60841842946593 current=28.450860861692373
color yellow, pair_06
distance pair_07, 2B4N and resi 28 and name CA, 2B4N and resi 37 and name CA  # target=21.469935656454517 current=22.301999947908502
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
