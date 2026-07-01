# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.9940219318697147

load 1JBL.pdb, 1JBL
bg_color white
hide everything, 1JBL
show cartoon, 1JBL
color grey80, 1JBL
set cartoon_transparency, 0.1

select worst_residues, 1JBL and resi 1+3+4+5+6+7+8+9+11+12
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1JBL and resi 2 and name CA, 1JBL and resi 12 and name CA  # target=9.217701066562046 current=9.192491225676065
color yellow, pair_00
distance pair_01, 1JBL and resi 1 and name CA, 1JBL and resi 9 and name CA  # target=8.27070152925139 current=8.255383093931895
color yellow, pair_01
distance pair_02, 1JBL and resi 1 and name CA, 1JBL and resi 12 and name CA  # target=7.829589774562443 current=7.816824057891155
color yellow, pair_02

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
