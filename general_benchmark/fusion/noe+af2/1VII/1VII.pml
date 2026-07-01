# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.3939147055415368

load 1VII.pdb, 1VII
bg_color white
hide everything, 1VII
show cartoon, 1VII
color grey80, 1VII
set cartoon_transparency, 0.1

select worst_residues, 1VII and resi 4+7+8+14+15+16+21+30+32+33
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1VII and resi 41
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1VII and resi 6 and name CA, 1VII and resi 17 and name CA  # target=4.893392851656878 current=9.764350626908492
color yellow, pair_00
distance pair_01, 1VII and resi 17 and name CA, 1VII and resi 28 and name CA  # target=4.893392851656878 current=9.396813501779253
color yellow, pair_01
distance pair_02, 1VII and resi 10 and name CA, 1VII and resi 29 and name CA  # target=4.893392851656878 current=8.44357091423657
color yellow, pair_02
distance pair_03, 1VII and resi 1 and name CA, 1VII and resi 33 and name CA  # target=12.803898162839694 current=9.52081108232733
color yellow, pair_03
distance pair_04, 1VII and resi 6 and name CA, 1VII and resi 33 and name CA  # target=12.655007330203375 current=9.92011594433285
color yellow, pair_04
distance pair_05, 1VII and resi 2 and name CA, 1VII and resi 33 and name CA  # target=16.031613132636682 current=13.415575275941602
color yellow, pair_05
distance pair_06, 1VII and resi 5 and name CA, 1VII and resi 33 and name CA  # target=13.481591447443053 current=11.036339136146596
color yellow, pair_06
distance pair_07, 1VII and resi 3 and name CA, 1VII and resi 33 and name CA  # target=17.25137778536157 current=14.911445739514246
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
