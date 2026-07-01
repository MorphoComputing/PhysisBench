# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.9357716991897626

load 1NXB.pdb, 1NXB
bg_color white
hide everything, 1NXB
show cartoon, 1NXB
color grey80, 1NXB
set cartoon_transparency, 0.1

select worst_residues, 1NXB and resi 5+6+8+18+19+30+31+45+46+47
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1NXB and resi 19 and name CA, 1NXB and resi 31 and name CA  # target=27.49394889578454 current=34.413643678295905
color yellow, pair_00
distance pair_01, 1NXB and resi 18 and name CA, 1NXB and resi 31 and name CA  # target=27.496051521354765 current=34.26279057124406
color yellow, pair_01
distance pair_02, 1NXB and resi 19 and name CA, 1NXB and resi 32 and name CA  # target=27.4881277377084 current=33.774790786231925
color yellow, pair_02
distance pair_03, 1NXB and resi 18 and name CA, 1NXB and resi 32 and name CA  # target=27.490425779876798 current=33.35164486565437
color yellow, pair_03
distance pair_04, 1NXB and resi 19 and name CA, 1NXB and resi 33 and name CA  # target=27.4739499517824 current=33.0259854519642
color yellow, pair_04
distance pair_05, 1NXB and resi 18 and name CA, 1NXB and resi 33 and name CA  # target=27.481986536827186 current=32.860551385381235
color yellow, pair_05
distance pair_06, 1NXB and resi 31 and name CA, 1NXB and resi 56 and name CA  # target=27.460088288535438 current=32.1699549843527
color yellow, pair_06
distance pair_07, 1NXB and resi 21 and name CA, 1NXB and resi 31 and name CA  # target=27.469598762850577 current=31.992530182390972
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
