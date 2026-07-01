# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.8180490978956602

load 1HPH.pdb, 1HPH
bg_color white
hide everything, 1HPH
show cartoon, 1HPH
color grey80, 1HPH
set cartoon_transparency, 0.1

select worst_residues, 1HPH and resi 1+2+4+5+7+8+9+31+32+34
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1HPH and resi 1 and name CA, 1HPH and resi 31 and name CA  # target=27.499999537565056 current=31.990947408715524
color yellow, pair_00
distance pair_01, 1HPH and resi 2 and name CA, 1HPH and resi 31 and name CA  # target=27.49998545668395 current=31.18616348168081
color yellow, pair_01
distance pair_02, 1HPH and resi 1 and name CA, 1HPH and resi 28 and name CA  # target=27.49999139244347 current=31.18070480312072
color yellow, pair_02
distance pair_03, 1HPH and resi 1 and name CA, 1HPH and resi 32 and name CA  # target=27.499998741970664 current=31.178214485168777
color yellow, pair_03
distance pair_04, 1HPH and resi 2 and name CA, 1HPH and resi 32 and name CA  # target=27.49997990712255 current=30.85485634129065
color yellow, pair_04
distance pair_05, 1HPH and resi 2 and name CA, 1HPH and resi 28 and name CA  # target=27.499862094899473 current=30.432760939770077
color yellow, pair_05
distance pair_06, 1HPH and resi 1 and name CA, 1HPH and resi 27 and name CA  # target=27.49991563920436 current=30.313349292884055
color yellow, pair_06
distance pair_07, 1HPH and resi 2 and name CA, 1HPH and resi 27 and name CA  # target=27.497516345213196 current=29.102245987521464
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
