# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.11577696134653

load 1B3C.pdb, 1B3C
bg_color white
hide everything, 1B3C
show cartoon, 1B3C
color grey80, 1B3C
set cartoon_transparency, 0.1

select worst_residues, 1B3C and resi 1+6+8+17+41+49+50+51+52+54
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1B3C and resi 3+8+15+18
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1B3C and resi 15 and name CA, 1B3C and resi 52 and name CA  # target=27.386599739413043 current=17.961923909321442
color yellow, pair_00
distance pair_01, 1B3C and resi 8 and name CA, 1B3C and resi 19 and name CA  # target=25.152737195350568 current=17.21271040876261
color yellow, pair_01
distance pair_02, 1B3C and resi 40 and name CA, 1B3C and resi 50 and name CA  # target=18.635912543051724 current=10.751297411042609
color yellow, pair_02
distance pair_03, 1B3C and resi 42 and name CA, 1B3C and resi 53 and name CA  # target=21.071859559783032 current=13.857181994346229
color yellow, pair_03
distance pair_04, 1B3C and resi 8 and name CA, 1B3C and resi 18 and name CA  # target=25.163101554252115 current=18.01000110186425
color yellow, pair_04
distance pair_05, 1B3C and resi 8 and name CA, 1B3C and resi 49 and name CA  # target=20.98013540097988 current=14.235953195395973
color yellow, pair_05
distance pair_06, 1B3C and resi 31 and name CA, 1B3C and resi 54 and name CA  # target=8.707660571867153 current=15.103978558706988
color yellow, pair_06
distance pair_07, 1B3C and resi 7 and name CA, 1B3C and resi 19 and name CA  # target=23.300310175969358 current=17.780113525600594
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
