# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.44121528656649617

load 2ACY.pdb, 2ACY
bg_color white
hide everything, 2ACY
show cartoon, 2ACY
color grey80, 2ACY
set cartoon_transparency, 0.1

select worst_residues, 2ACY and resi 2+3+14+15+40+42+43+73+75+85
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2ACY and resi 71 and name CA, 2ACY and resi 86 and name CA  # target=27.499999982348104 current=35.740427224145385
color yellow, pair_00
distance pair_01, 2ACY and resi 2 and name CA, 2ACY and resi 42 and name CA  # target=27.499999859630087 current=34.76659605471492
color yellow, pair_01
distance pair_02, 2ACY and resi 4 and name CA, 2ACY and resi 44 and name CA  # target=27.499992405994117 current=32.585639904574684
color yellow, pair_02
distance pair_03, 2ACY and resi 14 and name CA, 2ACY and resi 86 and name CA  # target=27.499997287591132 current=32.53198688059738
color yellow, pair_03
distance pair_04, 2ACY and resi 71 and name CA, 2ACY and resi 84 and name CA  # target=27.499993958360523 current=32.42356306301876
color yellow, pair_04
distance pair_05, 2ACY and resi 20 and name CA, 2ACY and resi 86 and name CA  # target=27.49998023715531 current=32.00061361322714
color yellow, pair_05
distance pair_06, 2ACY and resi 19 and name CA, 2ACY and resi 84 and name CA  # target=27.499964662238614 current=31.810523825315766
color yellow, pair_06
distance pair_07, 2ACY and resi 75 and name CA, 2ACY and resi 86 and name CA  # target=27.49999049385121 current=31.61861188002631
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
