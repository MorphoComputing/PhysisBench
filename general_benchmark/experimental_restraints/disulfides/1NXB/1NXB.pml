# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 9.877264027103783

load 1NXB.pdb, 1NXB
bg_color white
hide everything, 1NXB
show cartoon, 1NXB
color grey80, 1NXB
set cartoon_transparency, 0.1

select worst_residues, 1NXB and resi 16+17+18+19+30+31+32+33+56+57
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1NXB and resi 16 and name CA, 1NXB and resi 40 and name CA  # target=5.526827568351721 current=7.2367749738009275
color yellow, pair_00
distance pair_01, 1NXB and resi 2 and name CA, 1NXB and resi 23 and name CA  # target=5.526827568351721 current=6.363010389048995
color yellow, pair_01
distance pair_02, 1NXB and resi 42 and name CA, 1NXB and resi 53 and name CA  # target=5.526827568351721 current=5.691699850651713
color yellow, pair_02

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
