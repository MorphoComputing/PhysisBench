# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 6.3368386870839934

load 1IB9.pdb, 1IB9
bg_color white
hide everything, 1IB9
show cartoon, 1IB9
color grey80, 1IB9
set cartoon_transparency, 0.1

select worst_residues, 1IB9 and resi 3+8+9+10+11+12+13+15+21+22
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1IB9 and resi 12 and name CA, 1IB9 and resi 20 and name CA  # target=6.068331196299564 current=9.308030569137546
color yellow, pair_00
distance pair_01, 1IB9 and resi 14 and name CA, 1IB9 and resi 26 and name CA  # target=5.526827568351721 current=8.292039245743746
color yellow, pair_01
distance pair_02, 1IB9 and resi 1 and name CA, 1IB9 and resi 25 and name CA  # target=6.068331196299564 current=8.824305691877983
color yellow, pair_02
distance pair_03, 1IB9 and resi 16 and name CA, 1IB9 and resi 26 and name CA  # target=4.559103195956015 current=7.100145588045572
color yellow, pair_03
distance pair_04, 1IB9 and resi 11 and name CA, 1IB9 and resi 31 and name CA  # target=6.662208223542651 current=8.956625136478424
color yellow, pair_04
distance pair_05, 1IB9 and resi 13 and name CA, 1IB9 and resi 31 and name CA  # target=3.9791092582064715 current=6.095575681494621
color yellow, pair_05
distance pair_06, 1IB9 and resi 14 and name CA, 1IB9 and resi 32 and name CA  # target=4.330384448044466 current=6.389627819617824
color yellow, pair_06
distance pair_07, 1IB9 and resi 7 and name CA, 1IB9 and resi 23 and name CA  # target=4.47460509597741 current=6.027528704756483
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
