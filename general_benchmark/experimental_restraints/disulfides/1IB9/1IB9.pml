# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 6.383778397996654

load 1IB9.pdb, 1IB9
bg_color white
hide everything, 1IB9
show cartoon, 1IB9
color grey80, 1IB9
set cartoon_transparency, 0.1

select worst_residues, 1IB9 and resi 3+8+9+10+11+12+17+18+23+28
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1IB9 and resi 7 and name CA, 1IB9 and resi 24 and name CA  # target=5.526827568351721 current=4.728338173152995
color yellow, pair_00
distance pair_01, 1IB9 and resi 20 and name CA, 1IB9 and resi 32 and name CA  # target=5.526827568351721 current=5.7801364241560504
color yellow, pair_01
distance pair_02, 1IB9 and resi 14 and name CA, 1IB9 and resi 26 and name CA  # target=5.526827568351721 current=5.773054202730294
color yellow, pair_02

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
