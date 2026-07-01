# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 11.193943493427929

load 2YXF.pdb, 2YXF
bg_color white
hide everything, 2YXF
show cartoon, 2YXF
color grey80, 2YXF
set cartoon_transparency, 0.1

select worst_residues, 2YXF and resi 2+16+18+28+32+42+58+61+74+75
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2YXF and resi 25 and name CA, 2YXF and resi 80 and name CA  # target=5.526827568351721 current=5.616487233463499
color yellow, pair_00

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
