# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.576547753599165

load 2CRD.pdb, 2CRD
bg_color white
hide everything, 2CRD
show cartoon, 2CRD
color grey80, 2CRD
set cartoon_transparency, 0.1

select worst_residues, 2CRD and resi 1+2+3+9+17+18+20+25+28+34
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2CRD and resi 3+17+22
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2CRD and resi 17 and name CA, 2CRD and resi 26 and name CA  # target=16.1950425604464 current=8.60645211429359
color yellow, pair_00
distance pair_01, 2CRD and resi 14 and name CA, 2CRD and resi 27 and name CA  # target=14.630577654457577 current=9.144840222114384
color yellow, pair_01
distance pair_02, 2CRD and resi 22 and name CA, 2CRD and resi 30 and name CA  # target=16.303169714128227 current=10.943408811354324
color yellow, pair_02
distance pair_03, 2CRD and resi 18 and name CA, 2CRD and resi 32 and name CA  # target=11.9104994180609 current=7.105168086039263
color yellow, pair_03
distance pair_04, 2CRD and resi 8 and name CA, 2CRD and resi 20 and name CA  # target=17.586924379827288 current=13.274660425676482
color yellow, pair_04
distance pair_05, 2CRD and resi 19 and name CA, 2CRD and resi 29 and name CA  # target=19.880684634043003 current=15.643471706655824
color yellow, pair_05
distance pair_06, 2CRD and resi 13 and name CA, 2CRD and resi 27 and name CA  # target=15.942869996466916 current=11.72072538053293
color yellow, pair_06
distance pair_07, 2CRD and resi 19 and name CA, 2CRD and resi 30 and name CA  # target=16.592757645661948 current=12.852863384412624
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
