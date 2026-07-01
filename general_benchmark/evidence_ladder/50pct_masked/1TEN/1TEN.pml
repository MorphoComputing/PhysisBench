# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.3156911268366794

load 1TEN.pdb, 1TEN
bg_color white
hide everything, 1TEN
show cartoon, 1TEN
color grey80, 1TEN
set cartoon_transparency, 0.1

select worst_residues, 1TEN and resi 14+41+42+51+60+63+65+76+77+78
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1TEN and resi 9+64
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1TEN and resi 27 and name CA, 1TEN and resi 64 and name CA  # target=27.49999999740103 current=37.07910051830663
color yellow, pair_00
distance pair_01, 1TEN and resi 64 and name CA, 1TEN and resi 77 and name CA  # target=27.49999999877349 current=36.50014149480724
color yellow, pair_01
distance pair_02, 1TEN and resi 26 and name CA, 1TEN and resi 64 and name CA  # target=27.499999992903216 current=36.36460918792038
color yellow, pair_02
distance pair_03, 1TEN and resi 63 and name CA, 1TEN and resi 76 and name CA  # target=27.499999993817188 current=36.25312901647979
color yellow, pair_03
distance pair_04, 1TEN and resi 14 and name CA, 1TEN and resi 76 and name CA  # target=27.499999990136516 current=35.94202079354973
color yellow, pair_04
distance pair_05, 1TEN and resi 14 and name CA, 1TEN and resi 77 and name CA  # target=27.49999999763107 current=35.81207569282598
color yellow, pair_05
distance pair_06, 1TEN and resi 14 and name CA, 1TEN and resi 27 and name CA  # target=27.49999991967922 current=35.06926814425165
color yellow, pair_06
distance pair_07, 1TEN and resi 13 and name CA, 1TEN and resi 76 and name CA  # target=27.49999992724799 current=34.97294382031348
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
