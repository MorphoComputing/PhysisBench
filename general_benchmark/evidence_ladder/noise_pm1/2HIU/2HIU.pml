# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.587072795391888

load 2HIU.pdb, 2HIU
bg_color white
hide everything, 2HIU
show cartoon, 2HIU
color grey80, 2HIU
set cartoon_transparency, 0.1

select worst_residues, 2HIU and resi 7+9+15+16+17+19+20+21+22+37
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2HIU and resi 11+16+22+36+38+62
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2HIU and resi 14 and name CA, 2HIU and resi 22 and name CA  # target=13.043086613231566 current=7.374657307188763
color yellow, pair_00
distance pair_01, 2HIU and resi 19 and name CA, 2HIU and resi 43 and name CA  # target=6.0614649974356665 current=11.44285996928103
color yellow, pair_01
distance pair_02, 2HIU and resi 9 and name CA, 2HIU and resi 37 and name CA  # target=15.26452990829101 current=20.15899408502316
color yellow, pair_02
distance pair_03, 2HIU and resi 19 and name CA, 2HIU and resi 36 and name CA  # target=8.286749835087972 current=3.6718953559634273
color yellow, pair_03
distance pair_04, 2HIU and resi 13 and name CA, 2HIU and resi 21 and name CA  # target=12.629792781979605 current=8.30239524155331
color yellow, pair_04
distance pair_05, 2HIU and resi 16 and name CA, 2HIU and resi 37 and name CA  # target=5.641404114907587 current=9.394111209496849
color yellow, pair_05
distance pair_06, 2HIU and resi 9 and name CA, 2HIU and resi 39 and name CA  # target=21.57789308824205 current=25.323662680083377
color yellow, pair_06
distance pair_07, 2HIU and resi 19 and name CA, 2HIU and resi 29 and name CA  # target=15.552489552064738 current=11.916220913298481
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
