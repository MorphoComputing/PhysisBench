# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.618650220868718

load 1IB9.pdb, 1IB9
bg_color white
hide everything, 1IB9
show cartoon, 1IB9
color grey80, 1IB9
set cartoon_transparency, 0.1

select worst_residues, 1IB9 and resi 3+4+6+9+16+21+22+23+25+28
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1IB9 and resi 1 and name CA, 1IB9 and resi 25 and name CA  # target=6.068331196299564 current=8.388268188756207
color yellow, pair_00
distance pair_01, 1IB9 and resi 7 and name CA, 1IB9 and resi 25 and name CA  # target=6.452246554221226 current=4.271166186183235
color yellow, pair_01
distance pair_02, 1IB9 and resi 14 and name CA, 1IB9 and resi 32 and name CA  # target=4.330384448044466 current=6.131228614324047
color yellow, pair_02
distance pair_03, 1IB9 and resi 12 and name CA, 1IB9 and resi 21 and name CA  # target=6.980849876453784 current=8.561173612822929
color yellow, pair_03
distance pair_04, 1IB9 and resi 12 and name CA, 1IB9 and resi 31 and name CA  # target=7.084920168856882 current=5.549361169275542
color yellow, pair_04
distance pair_05, 1IB9 and resi 14 and name CA, 1IB9 and resi 26 and name CA  # target=4.834029179202727 current=5.818576845137105
color yellow, pair_05
distance pair_06, 1IB9 and resi 13 and name CA, 1IB9 and resi 31 and name CA  # target=3.9791092582064715 current=3.0945580679102633
color yellow, pair_06
distance pair_07, 1IB9 and resi 7 and name CA, 1IB9 and resi 23 and name CA  # target=4.47460509597741 current=5.187377901547998
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
