# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.8712794052530861

load 1YCC.pdb, 1YCC
bg_color white
hide everything, 1YCC
show cartoon, 1YCC
color grey80, 1YCC
set cartoon_transparency, 0.1

select worst_residues, 1YCC and resi 26+27+53+54+58+60+77+78+87+102
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1YCC and resi 46+73+100+195+625+1080
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1YCC and resi 26 and name CA, 1YCC and resi 102 and name CA  # target=15.297955374485994 current=4.929436227133369
color yellow, pair_00
distance pair_01, 1YCC and resi 35 and name CA, 1YCC and resi 49 and name CA  # target=16.31631330424869 current=8.145973966893436
color yellow, pair_01
distance pair_02, 1YCC and resi 73 and name CA, 1YCC and resi 87 and name CA  # target=11.634780891719823 current=3.54420720855389
color yellow, pair_02
distance pair_03, 1YCC and resi 38 and name CA, 1YCC and resi 100 and name CA  # target=16.94462347552533 current=8.918159662330321
color yellow, pair_03
distance pair_04, 1YCC and resi 34 and name CA, 1YCC and resi 48 and name CA  # target=15.015827557583277 current=7.098096023222511
color yellow, pair_04
distance pair_05, 1YCC and resi 66 and name CA, 1YCC and resi 95 and name CA  # target=18.580710733669807 current=10.677524567127165
color yellow, pair_05
distance pair_06, 1YCC and resi 54 and name CA, 1YCC and resi 83 and name CA  # target=20.40070394567839 current=12.659779007087248
color yellow, pair_06
distance pair_07, 1YCC and resi 13 and name CA, 1YCC and resi 91 and name CA  # target=15.62663195366075 current=8.117275023195095
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
