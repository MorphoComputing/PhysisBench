# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.5484076487295317

load 2KNM.pdb, 2KNM
bg_color white
hide everything, 2KNM
show cartoon, 2KNM
color grey80, 2KNM
set cartoon_transparency, 0.1

select worst_residues, 2KNM and resi 1+4+7+8+10+14+15+16+17+18
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2KNM and resi 2 and name CA, 2KNM and resi 12 and name CA  # target=8.160834518434335 current=10.736608931502149
color yellow, pair_00
distance pair_01, 2KNM and resi 14 and name CA, 2KNM and resi 24 and name CA  # target=15.738985054077997 current=13.642694180586485
color yellow, pair_01
distance pair_02, 2KNM and resi 9 and name CA, 2KNM and resi 25 and name CA  # target=12.43985978430379 current=10.425387590725343
color yellow, pair_02
distance pair_03, 2KNM and resi 10 and name CA, 2KNM and resi 21 and name CA  # target=12.496543263914475 current=10.573356993092494
color yellow, pair_03
distance pair_04, 2KNM and resi 5 and name CA, 2KNM and resi 15 and name CA  # target=7.832130506953976 current=9.724304709527903
color yellow, pair_04
distance pair_05, 2KNM and resi 6 and name CA, 2KNM and resi 21 and name CA  # target=9.471135892028414 current=7.638534823925163
color yellow, pair_05
distance pair_06, 2KNM and resi 4 and name CA, 2KNM and resi 19 and name CA  # target=7.8521925221055415 current=9.597450800842305
color yellow, pair_06
distance pair_07, 2KNM and resi 17 and name CA, 2KNM and resi 26 and name CA  # target=12.716496495694654 current=10.994634535353583
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
