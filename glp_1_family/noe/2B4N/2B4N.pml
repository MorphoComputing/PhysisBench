# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 9.521196127339566

load 2B4N.pdb, 2B4N
bg_color white
hide everything, 2B4N
show cartoon, 2B4N
color grey80, 2B4N
set cartoon_transparency, 0.1

select worst_residues, 2B4N and resi 3+4+5+6+7+8+35+36+38+39
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)


set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
