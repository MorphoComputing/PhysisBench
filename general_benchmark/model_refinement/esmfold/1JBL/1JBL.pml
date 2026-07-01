# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.5897478774682815

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

distance pair_00, 1JBL and resi 2 and name CA, 1JBL and resi 10 and name CA  # target=4.739671523205486 current=3.8046385901884063
color yellow, pair_00
distance pair_01, 1JBL and resi 1 and name CA, 1JBL and resi 10 and name CA  # target=6.098079535763911 current=5.548566463216259
color yellow, pair_01
distance pair_02, 1JBL and resi 1 and name CA, 1JBL and resi 11 and name CA  # target=5.8117587551820336 current=5.294213836102579
color yellow, pair_02
distance pair_03, 1JBL and resi 2 and name CA, 1JBL and resi 12 and name CA  # target=8.692846112956625 current=9.097212960609632
color yellow, pair_03
distance pair_04, 1JBL and resi 1 and name CA, 1JBL and resi 12 and name CA  # target=7.1263437067499495 current=7.3645389695618055
color yellow, pair_04
distance pair_05, 1JBL and resi 2 and name CA, 1JBL and resi 11 and name CA  # target=6.220943520837776 current=6.00685547911286
color yellow, pair_05
distance pair_06, 1JBL and resi 3 and name CA, 1JBL and resi 11 and name CA  # target=8.482092413524976 current=8.326214324349708
color yellow, pair_06
distance pair_07, 1JBL and resi 4 and name CA, 1JBL and resi 12 and name CA  # target=15.24496563940237 current=15.36935266660844
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
