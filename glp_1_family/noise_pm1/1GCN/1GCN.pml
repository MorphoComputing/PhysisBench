# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.9664125854678283

load 1GCN.pdb, 1GCN
bg_color white
hide everything, 1GCN
show cartoon, 1GCN
color grey80, 1GCN
set cartoon_transparency, 0.1

select worst_residues, 1GCN and resi 2+4+5+8+9+10+11+15+16+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1GCN and resi 10 and name CA, 1GCN and resi 25 and name CA  # target=21.66415083741174 current=24.107362056576527
color yellow, pair_00
distance pair_01, 1GCN and resi 5 and name CA, 1GCN and resi 17 and name CA  # target=18.514220599488617 current=20.820861611500252
color yellow, pair_01
distance pair_02, 1GCN and resi 6 and name CA, 1GCN and resi 15 and name CA  # target=17.703016385792317 current=15.45053724841354
color yellow, pair_02
distance pair_03, 1GCN and resi 1 and name CA, 1GCN and resi 25 and name CA  # target=44.52352970283506 current=42.38423707932375
color yellow, pair_03
distance pair_04, 1GCN and resi 12 and name CA, 1GCN and resi 27 and name CA  # target=20.04383680176948 current=22.138907193974223
color yellow, pair_04
distance pair_05, 1GCN and resi 16 and name CA, 1GCN and resi 25 and name CA  # target=16.77575789363361 current=14.76196880961616
color yellow, pair_05
distance pair_06, 1GCN and resi 2 and name CA, 1GCN and resi 17 and name CA  # target=29.717924660172777 current=27.717748706353234
color yellow, pair_06
distance pair_07, 1GCN and resi 8 and name CA, 1GCN and resi 22 and name CA  # target=20.685285320269195 current=22.672107310900635
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
