# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.4426504496055594

load 2ACY.pdb, 2ACY
bg_color white
hide everything, 2ACY
show cartoon, 2ACY
color grey80, 2ACY
set cartoon_transparency, 0.1

select worst_residues, 2ACY and resi 3+15+18+46+54+58+64+71+85+87
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2ACY and resi 13+14+25+38+58+79
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2ACY and resi 71 and name CA, 2ACY and resi 86 and name CA  # target=27.4965492232417 current=35.79086018615837
color yellow, pair_00
distance pair_01, 2ACY and resi 18 and name CA, 2ACY and resi 86 and name CA  # target=27.491390067749183 current=34.93350942280646
color yellow, pair_01
distance pair_02, 2ACY and resi 2 and name CA, 2ACY and resi 42 and name CA  # target=27.495163315205296 current=34.80619074566305
color yellow, pair_02
distance pair_03, 2ACY and resi 15 and name CA, 2ACY and resi 86 and name CA  # target=27.491803494684802 current=34.491074901125224
color yellow, pair_03
distance pair_04, 2ACY and resi 71 and name CA, 2ACY and resi 87 and name CA  # target=27.477641037309635 current=34.47172931580214
color yellow, pair_04
distance pair_05, 2ACY and resi 19 and name CA, 2ACY and resi 86 and name CA  # target=27.48584797039374 current=34.341484415072536
color yellow, pair_05
distance pair_06, 2ACY and resi 70 and name CA, 2ACY and resi 86 and name CA  # target=27.491351358454487 current=34.12709685793343
color yellow, pair_06
distance pair_07, 2ACY and resi 73 and name CA, 2ACY and resi 86 and name CA  # target=27.475355616864256 current=34.101578354658145
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
