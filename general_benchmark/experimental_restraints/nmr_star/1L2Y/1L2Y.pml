# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.060392804977484

load 1L2Y.pdb, 1L2Y
bg_color white
hide everything, 1L2Y
show cartoon, 1L2Y
color grey80, 1L2Y
set cartoon_transparency, 0.1

select worst_residues, 1L2Y and resi 6+7+9+10+11+12+14+15+17+18
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1L2Y and resi 3 and name CA, 1L2Y and resi 18 and name CA  # target=4.541917735763398 current=8.177744382581656
color yellow, pair_00
distance pair_01, 1L2Y and resi 6 and name CA, 1L2Y and resi 16 and name CA  # target=4.47460509597741 current=7.964282178435139
color yellow, pair_01
distance pair_02, 1L2Y and resi 6 and name CA, 1L2Y and resi 17 and name CA  # target=4.33579809717985 current=5.9889890105535155
color yellow, pair_02
distance pair_03, 1L2Y and resi 6 and name CA, 1L2Y and resi 18 and name CA  # target=4.33579809717985 current=3.9843401697418823
color yellow, pair_03

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
