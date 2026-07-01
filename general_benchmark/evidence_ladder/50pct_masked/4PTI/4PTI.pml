# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.08579362612908178

load 4PTI.pdb, 4PTI
bg_color white
hide everything, 4PTI
show cartoon, 4PTI
color grey80, 4PTI
set cartoon_transparency, 0.1

select worst_residues, 4PTI and resi 1+2+12+13+14+15+16+25+42+56
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 4PTI and resi 13 and name CA, 4PTI and resi 56 and name CA  # target=27.499360384307852 current=30.386772379954945
color yellow, pair_00
distance pair_01, 4PTI and resi 15 and name CA, 4PTI and resi 56 and name CA  # target=27.499304521823557 current=30.244731731207754
color yellow, pair_01
distance pair_02, 4PTI and resi 14 and name CA, 4PTI and resi 53 and name CA  # target=26.904604601728664 current=26.396251224735263
color yellow, pair_02
distance pair_03, 4PTI and resi 5 and name CA, 4PTI and resi 15 and name CA  # target=23.603244024914297 current=24.09422846799873
color yellow, pair_03
distance pair_04, 4PTI and resi 14 and name CA, 4PTI and resi 54 and name CA  # target=26.736465441198764 current=26.248383137144643
color yellow, pair_04
distance pair_05, 4PTI and resi 35 and name CA, 4PTI and resi 55 and name CA  # target=23.613117482721005 current=24.099439673913324
color yellow, pair_05
distance pair_06, 4PTI and resi 25 and name CA, 4PTI and resi 38 and name CA  # target=23.680828742294583 current=24.165177137121127
color yellow, pair_06
distance pair_07, 4PTI and resi 13 and name CA, 4PTI and resi 55 and name CA  # target=27.453028312785005 current=27.919178675549844
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
