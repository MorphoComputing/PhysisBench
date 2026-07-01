# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.7678664325633384

load 1IB9.pdb, 1IB9
bg_color white
hide everything, 1IB9
show cartoon, 1IB9
color grey80, 1IB9
set cartoon_transparency, 0.1

select worst_residues, 1IB9 and resi 3+5+13+14+15+16+17+18+19+30
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1IB9 and resi 1 and name CA, 1IB9 and resi 32 and name CA  # target=10.885200710942915 current=10.322482065472801
color yellow, pair_00
distance pair_01, 1IB9 and resi 8 and name CA, 1IB9 and resi 28 and name CA  # target=16.745696595521093 current=16.189004789701126
color yellow, pair_01
distance pair_02, 1IB9 and resi 19 and name CA, 1IB9 and resi 30 and name CA  # target=10.357842055986007 current=10.910658732368255
color yellow, pair_02
distance pair_03, 1IB9 and resi 5 and name CA, 1IB9 and resi 14 and name CA  # target=14.334242802804232 current=13.78192864419589
color yellow, pair_03
distance pair_04, 1IB9 and resi 15 and name CA, 1IB9 and resi 24 and name CA  # target=12.170173698773628 current=12.721793050904125
color yellow, pair_04
distance pair_05, 1IB9 and resi 6 and name CA, 1IB9 and resi 25 and name CA  # target=7.900150461297168 current=7.348560856244743
color yellow, pair_05
distance pair_06, 1IB9 and resi 17 and name CA, 1IB9 and resi 29 and name CA  # target=11.849631466229715 current=12.391536074067993
color yellow, pair_06
distance pair_07, 1IB9 and resi 3 and name CA, 1IB9 and resi 15 and name CA  # target=20.847845697215735 current=21.36186614988294
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
