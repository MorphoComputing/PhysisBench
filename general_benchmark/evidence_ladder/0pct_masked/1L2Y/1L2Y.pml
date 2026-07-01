# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.03060384822376121

load 1L2Y.pdb, 1L2Y
bg_color white
hide everything, 1L2Y
show cartoon, 1L2Y
color grey80, 1L2Y
set cartoon_transparency, 0.1

select worst_residues, 1L2Y and resi 1+2+3+5+6+7+8+10+14+16
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1L2Y and resi 1 and name CA, 1L2Y and resi 12 and name CA  # target=16.539793205384598 current=16.504821461307138
color yellow, pair_00
distance pair_01, 1L2Y and resi 1 and name CA, 1L2Y and resi 11 and name CA  # target=14.442034526127784 current=14.408091259707792
color yellow, pair_01
distance pair_02, 1L2Y and resi 1 and name CA, 1L2Y and resi 9 and name CA  # target=13.338056296303066 current=13.304126272092166
color yellow, pair_02
distance pair_03, 1L2Y and resi 3 and name CA, 1L2Y and resi 18 and name CA  # target=9.970486105588448 current=9.937729988003039
color yellow, pair_03
distance pair_04, 1L2Y and resi 7 and name CA, 1L2Y and resi 16 and name CA  # target=13.242634762995467 current=13.210886800555855
color yellow, pair_04
distance pair_05, 1L2Y and resi 4 and name CA, 1L2Y and resi 16 and name CA  # target=12.105356942292602 current=12.074354102348964
color yellow, pair_05
distance pair_06, 1L2Y and resi 2 and name CA, 1L2Y and resi 11 and name CA  # target=11.671346644014488 current=11.641478049306492
color yellow, pair_06
distance pair_07, 1L2Y and resi 9 and name CA, 1L2Y and resi 18 and name CA  # target=13.332649990317371 current=13.303750848240329
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
