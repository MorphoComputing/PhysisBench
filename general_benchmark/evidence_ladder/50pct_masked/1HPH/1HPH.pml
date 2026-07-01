# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.9850144328218102

load 1HPH.pdb, 1HPH
bg_color white
hide everything, 1HPH
show cartoon, 1HPH
color grey80, 1HPH
set cartoon_transparency, 0.1

select worst_residues, 1HPH and resi 1+2+6+7+8+13+28+31+32+33
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1HPH and resi 2 and name CA, 1HPH and resi 31 and name CA  # target=27.49998545668395 current=29.668184828510046
color yellow, pair_00
distance pair_01, 1HPH and resi 1 and name CA, 1HPH and resi 30 and name CA  # target=27.499732398159242 current=29.621110212818046
color yellow, pair_01
distance pair_02, 1HPH and resi 2 and name CA, 1HPH and resi 28 and name CA  # target=27.499862094899473 current=29.35297303632164
color yellow, pair_02
distance pair_03, 1HPH and resi 2 and name CA, 1HPH and resi 32 and name CA  # target=27.49997990712255 current=29.299366511728707
color yellow, pair_03
distance pair_04, 1HPH and resi 2 and name CA, 1HPH and resi 33 and name CA  # target=27.489702366267966 current=25.901429871034022
color yellow, pair_04
distance pair_05, 1HPH and resi 2 and name CA, 1HPH and resi 17 and name CA  # target=22.33305154526302 current=23.223017107680473
color yellow, pair_05
distance pair_06, 1HPH and resi 1 and name CA, 1HPH and resi 17 and name CA  # target=23.246029925745493 current=24.077084412460334
color yellow, pair_06
distance pair_07, 1HPH and resi 2 and name CA, 1HPH and resi 27 and name CA  # target=27.497516345213196 current=28.27509145396435
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
