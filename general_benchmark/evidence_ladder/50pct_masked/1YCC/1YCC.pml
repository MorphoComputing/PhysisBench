# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.36370563551827484

load 1YCC.pdb, 1YCC
bg_color white
hide everything, 1YCC
show cartoon, 1YCC
color grey80, 1YCC
set cartoon_transparency, 0.1

select worst_residues, 1YCC and resi 1+3+4+5+48+51+78+95+101+102
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1YCC and resi 8 and name CA, 1YCC and resi 54 and name CA  # target=27.49999917700067 current=33.73907523251163
color yellow, pair_00
distance pair_01, 1YCC and resi 8 and name CA, 1YCC and resi 58 and name CA  # target=27.499997104005004 current=33.00859637446346
color yellow, pair_01
distance pair_02, 1YCC and resi 9 and name CA, 1YCC and resi 54 and name CA  # target=27.499994973860197 current=32.81376672883331
color yellow, pair_02
distance pair_03, 1YCC and resi 1 and name CA, 1YCC and resi 49 and name CA  # target=27.49999462056133 current=32.54500503859808
color yellow, pair_03
distance pair_04, 1YCC and resi 6 and name CA, 1YCC and resi 58 and name CA  # target=27.499986568360562 current=32.097845906860215
color yellow, pair_04
distance pair_05, 1YCC and resi 3 and name CA, 1YCC and resi 49 and name CA  # target=27.499991054823163 current=32.02957769269918
color yellow, pair_05
distance pair_06, 1YCC and resi 8 and name CA, 1YCC and resi 55 and name CA  # target=27.499972997094236 current=32.00675399174594
color yellow, pair_06
distance pair_07, 1YCC and resi 49 and name CA, 1YCC and resi 89 and name CA  # target=27.49997060568383 current=31.835394160303355
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
