# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.35538466103623545

load 1JRJ.pdb, 1JRJ
bg_color white
hide everything, 1JRJ
show cartoon, 1JRJ
color grey80, 1JRJ
set cartoon_transparency, 0.1

select worst_residues, 1JRJ and resi 1+2+3+4+5+6+7+8+12+33
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1JRJ and resi 1 and name CA, 1JRJ and resi 17 and name CA  # target=31.77183832895647 current=30.57917263397044
color yellow, pair_00
distance pair_01, 1JRJ and resi 1 and name CA, 1JRJ and resi 24 and name CA  # target=41.874096805064596 current=40.75000708014098
color yellow, pair_01
distance pair_02, 1JRJ and resi 5 and name CA, 1JRJ and resi 24 and name CA  # target=27.80560460452795 current=28.90641413668239
color yellow, pair_02
distance pair_03, 1JRJ and resi 3 and name CA, 1JRJ and resi 24 and name CA  # target=33.340365350180704 current=34.40604310343108
color yellow, pair_03
distance pair_04, 1JRJ and resi 8 and name CA, 1JRJ and resi 28 and name CA  # target=32.086990987285304 current=31.023190902218566
color yellow, pair_04
distance pair_05, 1JRJ and resi 1 and name CA, 1JRJ and resi 36 and name CA  # target=41.51777113472294 current=40.46807708651881
color yellow, pair_05
distance pair_06, 1JRJ and resi 10 and name CA, 1JRJ and resi 31 and name CA  # target=32.08907145522658 current=31.041120783177384
color yellow, pair_06
distance pair_07, 1JRJ and resi 3 and name CA, 1JRJ and resi 37 and name CA  # target=31.54947837823203 current=30.50523247486549
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
