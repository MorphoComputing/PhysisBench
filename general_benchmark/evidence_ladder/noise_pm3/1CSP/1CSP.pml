# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.5666851906978783

load 1CSP.pdb, 1CSP
bg_color white
hide everything, 1CSP
show cartoon, 1CSP
color grey80, 1CSP
set cartoon_transparency, 0.1

select worst_residues, 1CSP and resi 5+20+35+36+37+53+54+58+63+64
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1CSP and resi 9+41+60+117+305+614
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1CSP and resi 35 and name CA, 1CSP and resi 61 and name CA  # target=19.99747123722447 current=10.176894665143122
color yellow, pair_00
distance pair_01, 1CSP and resi 44 and name CA, 1CSP and resi 65 and name CA  # target=15.834910281693166 current=6.726969588354177
color yellow, pair_01
distance pair_02, 1CSP and resi 42 and name CA, 1CSP and resi 64 and name CA  # target=17.902853027083623 current=9.201272347545512
color yellow, pair_02
distance pair_03, 1CSP and resi 50 and name CA, 1CSP and resi 59 and name CA  # target=11.671049395239613 current=3.0948741133709814
color yellow, pair_03
distance pair_04, 1CSP and resi 47 and name CA, 1CSP and resi 59 and name CA  # target=18.25668368280423 current=10.138252132073621
color yellow, pair_04
distance pair_05, 1CSP and resi 26 and name CA, 1CSP and resi 58 and name CA  # target=11.72742573742848 current=3.799999642681235
color yellow, pair_05
distance pair_06, 1CSP and resi 41 and name CA, 1CSP and resi 64 and name CA  # target=13.70295677362329 current=5.918650397541433
color yellow, pair_06
distance pair_07, 1CSP and resi 15 and name CA, 1CSP and resi 26 and name CA  # target=13.644568179780721 current=6.003158784675678
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
