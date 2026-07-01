# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.1302068564478371

load 1JBL.pdb, 1JBL
bg_color white
hide everything, 1JBL
show cartoon, 1JBL
color grey80, 1JBL
set cartoon_transparency, 0.1

select worst_residues, 1JBL and resi 1+2+3+4+6+7+8+9+10+12
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1JBL and resi 2 and name CA, 1JBL and resi 10 and name CA  # target=4.054353227904101 current=3.533957361650101
color yellow, pair_00
distance pair_01, 1JBL and resi 1 and name CA, 1JBL and resi 11 and name CA  # target=5.100483813202766 current=5.531539575905917
color yellow, pair_01
distance pair_02, 1JBL and resi 1 and name CA, 1JBL and resi 9 and name CA  # target=8.27070152925139 current=8.560248156048214
color yellow, pair_02
distance pair_03, 1JBL and resi 4 and name CA, 1JBL and resi 12 and name CA  # target=15.581628141072102 current=15.793521690201887
color yellow, pair_03
distance pair_04, 1JBL and resi 3 and name CA, 1JBL and resi 11 and name CA  # target=8.272459378105134 current=8.43381059969799
color yellow, pair_04
distance pair_05, 1JBL and resi 3 and name CA, 1JBL and resi 12 and name CA  # target=12.008068071461167 current=12.073666693577893
color yellow, pair_05
distance pair_06, 1JBL and resi 2 and name CA, 1JBL and resi 12 and name CA  # target=9.217701066562046 current=9.199829124550378
color yellow, pair_06

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
