# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.817668165361293

load 3IOL.pdb, 3IOL
bg_color white
hide everything, 3IOL
show cartoon, 3IOL
color grey80, 3IOL
set cartoon_transparency, 0.1

select worst_residues, 3IOL and resi 1+2+3+18+19+20+21+22+23+24
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 3IOL and resi 6 and name CA, 3IOL and resi 22 and name CA  # target=23.70810718518416 current=24.263559786751436
color yellow, pair_00
distance pair_01, 3IOL and resi 2 and name CA, 3IOL and resi 22 and name CA  # target=31.504744834537608 current=30.964747892576337
color yellow, pair_01
distance pair_02, 3IOL and resi 1 and name CA, 3IOL and resi 24 and name CA  # target=32.16625508204472 current=31.632077973117106
color yellow, pair_02
distance pair_03, 3IOL and resi 11 and name CA, 3IOL and resi 24 and name CA  # target=20.184242103917057 current=20.71619089237415
color yellow, pair_03
distance pair_04, 3IOL and resi 2 and name CA, 3IOL and resi 23 and name CA  # target=32.17596927917813 current=31.652982311742416
color yellow, pair_04
distance pair_05, 3IOL and resi 3 and name CA, 3IOL and resi 19 and name CA  # target=24.357934055386295 current=24.88006102073293
color yellow, pair_05
distance pair_06, 3IOL and resi 2 and name CA, 3IOL and resi 18 and name CA  # target=24.618681903543568 current=25.133918998308896
color yellow, pair_06
distance pair_07, 3IOL and resi 3 and name CA, 3IOL and resi 24 and name CA  # target=31.9181309952657 current=31.42662656937319
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
