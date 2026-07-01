# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.019315473459624

load 1NXB.pdb, 1NXB
bg_color white
hide everything, 1NXB
show cartoon, 1NXB
color grey80, 1NXB
set cartoon_transparency, 0.1

select worst_residues, 1NXB and resi 17+18+19+30+31+32+33+35+36+37
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1NXB and resi 7+8+15
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1NXB and resi 19 and name CA, 1NXB and resi 31 and name CA  # target=27.494631124911546 current=32.82048778350424
color yellow, pair_00
distance pair_01, 1NXB and resi 18 and name CA, 1NXB and resi 31 and name CA  # target=27.49699590902891 current=32.63387141357171
color yellow, pair_01
distance pair_02, 1NXB and resi 19 and name CA, 1NXB and resi 32 and name CA  # target=27.495438273657687 current=32.55149706961344
color yellow, pair_02
distance pair_03, 1NXB and resi 18 and name CA, 1NXB and resi 32 and name CA  # target=27.490936546528733 current=32.07640435327059
color yellow, pair_03
distance pair_04, 1NXB and resi 19 and name CA, 1NXB and resi 33 and name CA  # target=27.49070851004089 current=32.06397271413648
color yellow, pair_04
distance pair_05, 1NXB and resi 18 and name CA, 1NXB and resi 33 and name CA  # target=27.475478900273558 current=31.776570313031634
color yellow, pair_05
distance pair_06, 1NXB and resi 21 and name CA, 1NXB and resi 31 and name CA  # target=27.45035523882385 current=31.28211949323313
color yellow, pair_06
distance pair_07, 1NXB and resi 18 and name CA, 1NXB and resi 30 and name CA  # target=27.45705980974246 current=31.28631634532571
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
