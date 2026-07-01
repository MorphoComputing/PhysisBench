# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.12191780481014552

load 1TIT.pdb, 1TIT
bg_color white
hide everything, 1TIT
show cartoon, 1TIT
color grey80, 1TIT
set cartoon_transparency, 0.1

select worst_residues, 1TIT and resi 1+13+15+25+26+28+61+75+76+87
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1TIT and resi 7+63+86
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1TIT and resi 28 and name CA, 1TIT and resi 87 and name CA  # target=27.499999999506457 current=38.22405277025428
color yellow, pair_00
distance pair_01, 1TIT and resi 1 and name CA, 1TIT and resi 87 and name CA  # target=27.49999999895617 current=37.842229573477745
color yellow, pair_01
distance pair_02, 1TIT and resi 27 and name CA, 1TIT and resi 87 and name CA  # target=27.49999999892991 current=37.796346929782835
color yellow, pair_02
distance pair_03, 1TIT and resi 25 and name CA, 1TIT and resi 87 and name CA  # target=27.499999996640767 current=37.045342871853094
color yellow, pair_03
distance pair_04, 1TIT and resi 28 and name CA, 1TIT and resi 86 and name CA  # target=27.499999962432035 current=35.77956389066479
color yellow, pair_04
distance pair_05, 1TIT and resi 26 and name CA, 1TIT and resi 86 and name CA  # target=27.499999963060883 current=35.75090149042062
color yellow, pair_05
distance pair_06, 1TIT and resi 29 and name CA, 1TIT and resi 87 and name CA  # target=27.499999943194325 current=35.66955984189188
color yellow, pair_06
distance pair_07, 1TIT and resi 75 and name CA, 1TIT and resi 87 and name CA  # target=27.499999880900706 current=35.276986958265816
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
