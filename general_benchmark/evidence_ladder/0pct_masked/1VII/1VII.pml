# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.027958178345239226

load 1VII.pdb, 1VII
bg_color white
hide everything, 1VII
show cartoon, 1VII
color grey80, 1VII
set cartoon_transparency, 0.1

select worst_residues, 1VII and resi 2+3+4+8+9+17+21+22+23+30
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1VII and resi 4 and name CA, 1VII and resi 23 and name CA  # target=23.85103191458376 current=24.40154644075096
color yellow, pair_00
distance pair_01, 1VII and resi 4 and name CA, 1VII and resi 21 and name CA  # target=23.189490977452728 current=23.593366374314893
color yellow, pair_01
distance pair_02, 1VII and resi 4 and name CA, 1VII and resi 22 and name CA  # target=23.003613672007607 current=23.32704985847068
color yellow, pair_02
distance pair_03, 1VII and resi 3 and name CA, 1VII and resi 23 and name CA  # target=22.51628844665804 current=22.70296181258267
color yellow, pair_03
distance pair_04, 1VII and resi 2 and name CA, 1VII and resi 23 and name CA  # target=22.365759952899573 current=22.52389019930273
color yellow, pair_04
distance pair_05, 1VII and resi 5 and name CA, 1VII and resi 22 and name CA  # target=21.30217279129132 current=21.459944532357504
color yellow, pair_05
distance pair_06, 1VII and resi 8 and name CA, 1VII and resi 23 and name CA  # target=21.17031943603131 current=21.326162306417114
color yellow, pair_06
distance pair_07, 1VII and resi 8 and name CA, 1VII and resi 22 and name CA  # target=21.08351523401133 current=21.23899096348439
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
