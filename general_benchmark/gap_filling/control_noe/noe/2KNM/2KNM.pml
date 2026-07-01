# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.459095698217061

load 2KNM.pdb, 2KNM
bg_color white
hide everything, 2KNM
show cartoon, 2KNM
color grey80, 2KNM
set cartoon_transparency, 0.1

select worst_residues, 2KNM and resi 1+8+12+13+15+16+17+18+23+24
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2KNM and resi 19 and name CA, 2KNM and resi 28 and name CA  # target=4.734597146117251 current=7.616617691762093
color yellow, pair_00
distance pair_01, 2KNM and resi 7 and name CA, 2KNM and resi 25 and name CA  # target=4.15551083370725 current=6.971584455727635
color yellow, pair_01
distance pair_02, 2KNM and resi 20 and name CA, 2KNM and resi 28 and name CA  # target=6.068331196299564 current=8.128203288065654
color yellow, pair_02
distance pair_03, 2KNM and resi 7 and name CA, 2KNM and resi 24 and name CA  # target=3.807615173945761 current=5.575047919236472
color yellow, pair_03
distance pair_04, 2KNM and resi 5 and name CA, 2KNM and resi 14 and name CA  # target=3.807615173945761 current=5.273085366552975
color yellow, pair_04
distance pair_05, 2KNM and resi 5 and name CA, 2KNM and resi 25 and name CA  # target=7.39019949670469 current=6.216855597889902
color yellow, pair_05
distance pair_06, 2KNM and resi 6 and name CA, 2KNM and resi 25 and name CA  # target=5.212492862963047 current=4.056615907336045
color yellow, pair_06
distance pair_07, 2KNM and resi 2 and name CA, 2KNM and resi 28 and name CA  # target=4.298255009038828 current=5.399331304182582
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
