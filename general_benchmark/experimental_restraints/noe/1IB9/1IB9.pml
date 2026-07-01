# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.590850817529552

load 1IB9.pdb, 1IB9
bg_color white
hide everything, 1IB9
show cartoon, 1IB9
color grey80, 1IB9
set cartoon_transparency, 0.1

select worst_residues, 1IB9 and resi 2+8+11+15+16+17+18+21+22+31
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1IB9 and resi 1 and name CA, 1IB9 and resi 25 and name CA  # target=6.068331196299564 current=9.746596150528571
color yellow, pair_00
distance pair_01, 1IB9 and resi 13 and name CA, 1IB9 and resi 31 and name CA  # target=3.9791092582064715 current=7.119257901138289
color yellow, pair_01
distance pair_02, 1IB9 and resi 16 and name CA, 1IB9 and resi 26 and name CA  # target=4.559103195956015 current=7.5780542836230955
color yellow, pair_02
distance pair_03, 1IB9 and resi 11 and name CA, 1IB9 and resi 31 and name CA  # target=6.662208223542651 current=9.389744121966194
color yellow, pair_03
distance pair_04, 1IB9 and resi 14 and name CA, 1IB9 and resi 30 and name CA  # target=3.8636655574712133 current=6.503394118926609
color yellow, pair_04
distance pair_05, 1IB9 and resi 17 and name CA, 1IB9 and resi 25 and name CA  # target=4.15551083370725 current=6.737790881138851
color yellow, pair_05
distance pair_06, 1IB9 and resi 14 and name CA, 1IB9 and resi 32 and name CA  # target=4.330384448044466 current=6.8571984845653535
color yellow, pair_06
distance pair_07, 1IB9 and resi 12 and name CA, 1IB9 and resi 21 and name CA  # target=6.980849876453784 current=9.188943970495577
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
