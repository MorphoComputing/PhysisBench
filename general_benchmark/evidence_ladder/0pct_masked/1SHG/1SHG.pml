# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.02553289916549934

load 1SHG.pdb, 1SHG
bg_color white
hide everything, 1SHG
show cartoon, 1SHG
color grey80, 1SHG
set cartoon_transparency, 0.1

select worst_residues, 1SHG and resi 1+7+8+10+21+31+33+44+45+55
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1SHG and resi 1 and name CA, 1SHG and resi 12 and name CA  # target=23.795104396412707 current=24.419619747443814
color yellow, pair_00
distance pair_01, 1SHG and resi 1 and name CA, 1SHG and resi 13 and name CA  # target=23.58456851819988 current=24.19123043167942
color yellow, pair_01
distance pair_02, 1SHG and resi 14 and name CA, 1SHG and resi 54 and name CA  # target=23.424799656483003 current=24.01643398442021
color yellow, pair_02
distance pair_03, 1SHG and resi 15 and name CA, 1SHG and resi 55 and name CA  # target=23.200161036449202 current=23.69479361395094
color yellow, pair_03
distance pair_04, 1SHG and resi 33 and name CA, 1SHG and resi 42 and name CA  # target=23.18472498410587 current=23.678720677299232
color yellow, pair_04
distance pair_05, 1SHG and resi 1 and name CA, 1SHG and resi 14 and name CA  # target=23.183462060243574 current=23.66009928216034
color yellow, pair_05
distance pair_06, 1SHG and resi 13 and name CA, 1SHG and resi 54 and name CA  # target=22.99130700364859 current=23.396685020497937
color yellow, pair_06
distance pair_07, 1SHG and resi 13 and name CA, 1SHG and resi 55 and name CA  # target=26.723622804999486 current=26.31896859004244
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
