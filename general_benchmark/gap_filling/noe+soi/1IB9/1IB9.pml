# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.6016133486183035

load 1IB9.pdb, 1IB9
bg_color white
hide everything, 1IB9
show cartoon, 1IB9
color grey80, 1IB9
set cartoon_transparency, 0.1

select worst_residues, 1IB9 and resi 3+4+11+12+13+17+18+29+30+32
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1IB9 and resi 10+20
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1IB9 and resi 17 and name CA, 1IB9 and resi 25 and name CA  # target=4.15551083370725 current=9.317719632817765
color yellow, pair_00
distance pair_01, 1IB9 and resi 21 and name CA, 1IB9 and resi 32 and name CA  # target=5.887208232899287 current=9.290424814253926
color yellow, pair_01
distance pair_02, 1IB9 and resi 12 and name CA, 1IB9 and resi 21 and name CA  # target=6.980849876453784 current=10.321613464854718
color yellow, pair_02
distance pair_03, 1IB9 and resi 14 and name CA, 1IB9 and resi 32 and name CA  # target=4.330384448044466 current=7.524685901955267
color yellow, pair_03
distance pair_04, 1IB9 and resi 13 and name CA, 1IB9 and resi 32 and name CA  # target=4.145201824648677 current=6.637301027049255
color yellow, pair_04
distance pair_05, 1IB9 and resi 1 and name CA, 1IB9 and resi 25 and name CA  # target=6.068331196299564 current=8.516348137199268
color yellow, pair_05
distance pair_06, 1IB9 and resi 12 and name CA, 1IB9 and resi 32 and name CA  # target=3.8636655574712133 current=6.256196187946399
color yellow, pair_06
distance pair_07, 1IB9 and resi 12 and name CA, 1IB9 and resi 20 and name CA  # target=6.068331196299564 current=8.288136098794967
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
