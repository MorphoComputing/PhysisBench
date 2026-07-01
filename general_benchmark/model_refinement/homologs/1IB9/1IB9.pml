# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.46673384834019

load 1IB9.pdb, 1IB9
bg_color white
hide everything, 1IB9
show cartoon, 1IB9
color grey80, 1IB9
set cartoon_transparency, 0.1

select worst_residues, 1IB9 and resi 3+4+8+9+10+11+12+16+17+18
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1IB9 and resi 10 and name CA, 1IB9 and resi 29 and name CA  # target=15.110470192191913 current=13.005870413148005
color yellow, pair_00
distance pair_01, 1IB9 and resi 7 and name CA, 1IB9 and resi 24 and name CA  # target=6.409833011738453 current=4.637316260638424
color yellow, pair_01
distance pair_02, 1IB9 and resi 10 and name CA, 1IB9 and resi 31 and name CA  # target=9.847877143477987 current=8.167666542272126
color yellow, pair_02
distance pair_03, 1IB9 and resi 7 and name CA, 1IB9 and resi 25 and name CA  # target=9.897099171067758 current=8.244415555589782
color yellow, pair_03
distance pair_04, 1IB9 and resi 10 and name CA, 1IB9 and resi 28 and name CA  # target=16.454085801982668 current=14.83683899449009
color yellow, pair_04
distance pair_05, 1IB9 and resi 5 and name CA, 1IB9 and resi 25 and name CA  # target=9.450066166360621 current=7.888460345258526
color yellow, pair_05
distance pair_06, 1IB9 and resi 6 and name CA, 1IB9 and resi 25 and name CA  # target=10.867756884079766 current=9.427654899290737
color yellow, pair_06
distance pair_07, 1IB9 and resi 10 and name CA, 1IB9 and resi 25 and name CA  # target=10.88097966427954 current=9.466894349986005
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
