# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 7.163746958876327

load 2HIU.pdb, 2HIU
bg_color white
hide everything, 2HIU
show cartoon, 2HIU
color grey80, 2HIU
set cartoon_transparency, 0.1

select worst_residues, 2HIU and resi 11+12+13+14+15+16+17+19+22+25
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2HIU and resi 9+19
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2HIU and resi 2 and name CA, 2HIU and resi 19 and name CA  # target=4.507975919933174 current=11.32605425623567
color yellow, pair_00
distance pair_01, 2HIU and resi 12 and name CA, 2HIU and resi 26 and name CA  # target=6.845537590407531 current=3.2878421945075758
color yellow, pair_01
distance pair_02, 2HIU and resi 12 and name CA, 2HIU and resi 24 and name CA  # target=5.533144452470395 current=3.6030366290010605
color yellow, pair_02
distance pair_03, 2HIU and resi 1 and name CA, 2HIU and resi 13 and name CA  # target=7.397224158934549 current=9.274266562517267
color yellow, pair_03
distance pair_04, 2HIU and resi 3 and name CA, 2HIU and resi 11 and name CA  # target=4.541917735763398 current=6.010318902703555
color yellow, pair_04
distance pair_05, 2HIU and resi 15 and name CA, 2HIU and resi 26 and name CA  # target=5.071063307555523 current=3.8422181531928215
color yellow, pair_05
distance pair_06, 2HIU and resi 6 and name CA, 2HIU and resi 14 and name CA  # target=3.9693779294802645 current=5.1644907517266425
color yellow, pair_06
distance pair_07, 2HIU and resi 15 and name CA, 2HIU and resi 24 and name CA  # target=4.85760391055279 current=3.7247514158583934
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
