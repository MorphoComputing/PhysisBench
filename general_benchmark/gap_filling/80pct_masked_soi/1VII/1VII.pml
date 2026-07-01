# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.1829251536319862

load 1VII.pdb, 1VII
bg_color white
hide everything, 1VII
show cartoon, 1VII
color grey80, 1VII
set cartoon_transparency, 0.1

select worst_residues, 1VII and resi 5+12+19+20+22+23+26+30+31+34
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1VII and resi 12 and name CA, 1VII and resi 22 and name CA  # target=16.310271280095673 current=17.83754247535372
color yellow, pair_00
distance pair_01, 1VII and resi 7 and name CA, 1VII and resi 17 and name CA  # target=11.2027097809817 current=12.596147279005185
color yellow, pair_01
distance pair_02, 1VII and resi 1 and name CA, 1VII and resi 18 and name CA  # target=13.383855380559929 current=14.719410434793401
color yellow, pair_02
distance pair_03, 1VII and resi 2 and name CA, 1VII and resi 23 and name CA  # target=22.365759952899573 current=23.688116761337326
color yellow, pair_03
distance pair_04, 1VII and resi 1 and name CA, 1VII and resi 20 and name CA  # target=17.58655286712733 current=18.682189597917333
color yellow, pair_04
distance pair_05, 1VII and resi 15 and name CA, 1VII and resi 27 and name CA  # target=15.682890357162552 current=14.597604716149466
color yellow, pair_05
distance pair_06, 1VII and resi 11 and name CA, 1VII and resi 28 and name CA  # target=10.47100580529389 current=11.540922173378764
color yellow, pair_06
distance pair_07, 1VII and resi 17 and name CA, 1VII and resi 26 and name CA  # target=10.599136593446353 current=9.562954125803843
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
