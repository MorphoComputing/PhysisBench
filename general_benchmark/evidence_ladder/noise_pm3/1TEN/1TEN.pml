# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.0065289589903603

load 1TEN.pdb, 1TEN
bg_color white
hide everything, 1TEN
show cartoon, 1TEN
color grey80, 1TEN
set cartoon_transparency, 0.1

select worst_residues, 1TEN and resi 14+15+26+27+28+63+64+75+76+77
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1TEN and resi 36+73+86+319+383+606
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1TEN and resi 15 and name CA, 1TEN and resi 37 and name CA  # target=18.632405256531445 current=8.452225451255329
color yellow, pair_00
distance pair_01, 1TEN and resi 15 and name CA, 1TEN and resi 64 and name CA  # target=14.442169518559353 current=4.729581160615511
color yellow, pair_01
distance pair_02, 1TEN and resi 7 and name CA, 1TEN and resi 20 and name CA  # target=12.707232801948026 current=4.042479068205334
color yellow, pair_02
distance pair_03, 1TEN and resi 49 and name CA, 1TEN and resi 84 and name CA  # target=11.26465622356563 current=19.312227473577344
color yellow, pair_03
distance pair_04, 1TEN and resi 25 and name CA, 1TEN and resi 63 and name CA  # target=25.459183173707373 current=33.47580807274101
color yellow, pair_04
distance pair_05, 1TEN and resi 27 and name CA, 1TEN and resi 57 and name CA  # target=13.792580559823776 current=21.661759327884464
color yellow, pair_05
distance pair_06, 1TEN and resi 13 and name CA, 1TEN and resi 76 and name CA  # target=25.13949048236687 current=32.999410697121434
color yellow, pair_06
distance pair_07, 1TEN and resi 47 and name CA, 1TEN and resi 85 and name CA  # target=8.70586887475591 current=16.544848168351646
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
