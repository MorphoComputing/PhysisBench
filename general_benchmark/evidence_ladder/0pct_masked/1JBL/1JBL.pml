# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.23656294321480004

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

distance pair_00, 1JBL and resi 2 and name CA, 1JBL and resi 10 and name CA  # target=4.054353227904101 current=3.809249691356099
color yellow, pair_00
distance pair_01, 1JBL and resi 1 and name CA, 1JBL and resi 9 and name CA  # target=8.27070152925139 current=8.431683742404207
color yellow, pair_01
distance pair_02, 1JBL and resi 3 and name CA, 1JBL and resi 11 and name CA  # target=8.272459378105134 current=8.412586020041422
color yellow, pair_02
distance pair_03, 1JBL and resi 1 and name CA, 1JBL and resi 12 and name CA  # target=7.490587479080613 current=7.62722177185682
color yellow, pair_03
distance pair_04, 1JBL and resi 1 and name CA, 1JBL and resi 11 and name CA  # target=5.100483813202766 current=5.226818386146653
color yellow, pair_04
distance pair_05, 1JBL and resi 1 and name CA, 1JBL and resi 10 and name CA  # target=5.340723162472754 current=5.431755007926964
color yellow, pair_05
distance pair_06, 1JBL and resi 4 and name CA, 1JBL and resi 12 and name CA  # target=15.581628141072102 current=15.669067564874023
color yellow, pair_06
distance pair_07, 1JBL and resi 2 and name CA, 1JBL and resi 11 and name CA  # target=5.956007746343918 current=6.024542381650716
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
