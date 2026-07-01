# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.7614933528751109

load 1L2Y.pdb, 1L2Y
bg_color white
hide everything, 1L2Y
show cartoon, 1L2Y
color grey80, 1L2Y
set cartoon_transparency, 0.1

select worst_residues, 1L2Y and resi 1+2+3+4+6+9+10+11+12+17
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1L2Y and resi 1 and name CA, 1L2Y and resi 12 and name CA  # target=16.539793205384598 current=17.98783513594319
color yellow, pair_00
distance pair_01, 1L2Y and resi 1 and name CA, 1L2Y and resi 17 and name CA  # target=7.47749828511675 current=8.772236987954876
color yellow, pair_01
distance pair_02, 1L2Y and resi 1 and name CA, 1L2Y and resi 10 and name CA  # target=11.50348132254815 current=12.681546789063807
color yellow, pair_02
distance pair_03, 1L2Y and resi 6 and name CA, 1L2Y and resi 18 and name CA  # target=10.155185148560939 current=11.18307670184202
color yellow, pair_03
distance pair_04, 1L2Y and resi 1 and name CA, 1L2Y and resi 18 and name CA  # target=5.719669657015186 current=6.404218793933563
color yellow, pair_04
distance pair_05, 1L2Y and resi 4 and name CA, 1L2Y and resi 16 and name CA  # target=12.105356942292602 current=12.531398954181947
color yellow, pair_05
distance pair_06, 1L2Y and resi 2 and name CA, 1L2Y and resi 14 and name CA  # target=14.665906042092663 current=14.30646213002939
color yellow, pair_06
distance pair_07, 1L2Y and resi 7 and name CA, 1L2Y and resi 16 and name CA  # target=13.242634762995467 current=12.954677330064513
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
