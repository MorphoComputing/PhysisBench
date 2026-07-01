# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.4769256783792724

load 1VII.pdb, 1VII
bg_color white
hide everything, 1VII
show cartoon, 1VII
color grey80, 1VII
set cartoon_transparency, 0.1

select worst_residues, 1VII and resi 2+8+11+12+13+14+15+26+30+31
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1VII and resi 1 and name CA, 1VII and resi 29 and name CA  # target=11.011963661731086 current=12.738549826693326
color yellow, pair_00
distance pair_01, 1VII and resi 1 and name CA, 1VII and resi 30 and name CA  # target=13.085106219374875 current=14.238766703447434
color yellow, pair_01
distance pair_02, 1VII and resi 5 and name CA, 1VII and resi 15 and name CA  # target=13.83241894514264 current=12.812671540507885
color yellow, pair_02
distance pair_03, 1VII and resi 3 and name CA, 1VII and resi 29 and name CA  # target=15.307357238721142 current=16.294034078972704
color yellow, pair_03
distance pair_04, 1VII and resi 2 and name CA, 1VII and resi 19 and name CA  # target=18.245899426380507 current=17.300465832860187
color yellow, pair_04
distance pair_05, 1VII and resi 2 and name CA, 1VII and resi 13 and name CA  # target=9.813120684845192 current=9.02771785884634
color yellow, pair_05
distance pair_06, 1VII and resi 3 and name CA, 1VII and resi 19 and name CA  # target=16.986315958122653 current=16.209730218654144
color yellow, pair_06
distance pair_07, 1VII and resi 6 and name CA, 1VII and resi 15 and name CA  # target=10.517862351308288 current=9.785977233143987
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
