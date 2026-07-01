# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.7156243413392557

load 2YXF.pdb, 2YXF
bg_color white
hide everything, 2YXF
show cartoon, 2YXF
color grey80, 2YXF
set cartoon_transparency, 0.1

select worst_residues, 2YXF and resi 1+3+15+16+17+18+19+31+59+60
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2YXF and resi 2+11+18+22+55+75
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2YXF and resi 59 and name CA, 2YXF and resi 76 and name CA  # target=27.499999999486533 current=37.67394667922673
color yellow, pair_00
distance pair_01, 2YXF and resi 60 and name CA, 2YXF and resi 73 and name CA  # target=27.499999999692427 current=37.402576928684255
color yellow, pair_01
distance pair_02, 2YXF and resi 2 and name CA, 2YXF and resi 73 and name CA  # target=27.499999998529546 current=37.22064149458695
color yellow, pair_02
distance pair_03, 2YXF and resi 57 and name CA, 2YXF and resi 74 and name CA  # target=27.499999996487595 current=37.08006889846136
color yellow, pair_03
distance pair_04, 2YXF and resi 17 and name CA, 2YXF and resi 89 and name CA  # target=27.499999998179685 current=36.94063087026701
color yellow, pair_04
distance pair_05, 2YXF and resi 2 and name CA, 2YXF and resi 75 and name CA  # target=27.49999999810685 current=36.91071784247546
color yellow, pair_05
distance pair_06, 2YXF and resi 18 and name CA, 2YXF and resi 85 and name CA  # target=27.499999998479225 current=36.88713712244432
color yellow, pair_06
distance pair_07, 2YXF and resi 1 and name CA, 2YXF and resi 76 and name CA  # target=27.499999999244203 current=36.39201630257798
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
