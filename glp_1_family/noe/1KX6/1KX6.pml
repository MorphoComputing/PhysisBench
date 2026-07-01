# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.6223358089068185

load 1KX6.pdb, 1KX6
bg_color white
hide everything, 1KX6
show cartoon, 1KX6
color grey80, 1KX6
set cartoon_transparency, 0.1

select worst_residues, 1KX6 and resi 1+5+6+7+9+19+20+21+24+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)


set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
