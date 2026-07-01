# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.036957722953880605

load 1IB9.pdb, 1IB9
bg_color white
hide everything, 1IB9
show cartoon, 1IB9
color grey80, 1IB9
set cartoon_transparency, 0.1

select worst_residues, 1IB9 and resi 3+4+9+11+13+19+23+28+29+30
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1IB9 and resi 3 and name CA, 1IB9 and resi 13 and name CA  # target=21.727041344483222 current=21.837705849772256
color yellow, pair_00
distance pair_01, 1IB9 and resi 3 and name CA, 1IB9 and resi 11 and name CA  # target=21.413553235253996 current=21.52106310747802
color yellow, pair_01
distance pair_02, 1IB9 and resi 3 and name CA, 1IB9 and resi 15 and name CA  # target=20.847845697215735 current=20.945694486059978
color yellow, pair_02
distance pair_03, 1IB9 and resi 3 and name CA, 1IB9 and resi 30 and name CA  # target=21.136113253389937 current=21.215430521897094
color yellow, pair_03
distance pair_04, 1IB9 and resi 3 and name CA, 1IB9 and resi 27 and name CA  # target=15.901318309979477 current=15.83830970333055
color yellow, pair_04
distance pair_05, 1IB9 and resi 3 and name CA, 1IB9 and resi 16 and name CA  # target=17.908915343118494 current=17.84968431849821
color yellow, pair_05
distance pair_06, 1IB9 and resi 4 and name CA, 1IB9 and resi 29 and name CA  # target=19.814221831851505 current=19.87311442044003
color yellow, pair_06
distance pair_07, 1IB9 and resi 13 and name CA, 1IB9 and resi 23 and name CA  # target=14.837570026733612 current=14.787180221940718
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
