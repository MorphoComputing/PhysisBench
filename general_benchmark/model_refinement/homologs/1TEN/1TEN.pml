# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.8949630530696475

load 1TEN.pdb, 1TEN
bg_color white
hide everything, 1TEN
show cartoon, 1TEN
color grey80, 1TEN
set cartoon_transparency, 0.1

select worst_residues, 1TEN and resi 2+3+4+5+6+29+30+50+54+55
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1TEN and resi 4+814
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1TEN and resi 1 and name CA, 1TEN and resi 25 and name CA  # target=27.455102068374522 current=4.944880521035504
color yellow, pair_00
distance pair_01, 1TEN and resi 1 and name CA, 1TEN and resi 26 and name CA  # target=27.456969301835098 current=6.381748158356994
color yellow, pair_01
distance pair_02, 1TEN and resi 1 and name CA, 1TEN and resi 83 and name CA  # target=27.499990731706287 current=9.5092646336679
color yellow, pair_02
distance pair_03, 1TEN and resi 3 and name CA, 1TEN and resi 25 and name CA  # target=27.434977572859236 current=9.944125711181375
color yellow, pair_03
distance pair_04, 1TEN and resi 3 and name CA, 1TEN and resi 83 and name CA  # target=27.499956521914363 current=10.201502224532593
color yellow, pair_04
distance pair_05, 1TEN and resi 1 and name CA, 1TEN and resi 27 and name CA  # target=27.499776151960326 current=10.491524440642358
color yellow, pair_05
distance pair_06, 1TEN and resi 1 and name CA, 1TEN and resi 72 and name CA  # target=27.499992052161247 current=10.844167747644981
color yellow, pair_06
distance pair_07, 1TEN and resi 3 and name CA, 1TEN and resi 21 and name CA  # target=27.47607199938717 current=11.973732889919516
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
