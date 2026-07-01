# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.4129044486205364

load 1HVZ.pdb, 1HVZ
bg_color white
hide everything, 1HVZ
show cartoon, 1HVZ
color grey80, 1HVZ
set cartoon_transparency, 0.1

select worst_residues, 1HVZ and resi 1+2+3+4+5+8+9+10+12+16
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1HVZ and resi 11+25
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1HVZ and resi 4 and name CA, 1HVZ and resi 16 and name CA  # target=14.67852495735833 current=6.718108528552507
color yellow, pair_00
distance pair_01, 1HVZ and resi 1 and name CA, 1HVZ and resi 13 and name CA  # target=13.13853661077137 current=8.175458234178794
color yellow, pair_01
distance pair_02, 1HVZ and resi 2 and name CA, 1HVZ and resi 16 and name CA  # target=10.74724235345865 current=6.282208302860956
color yellow, pair_02
distance pair_03, 1HVZ and resi 5 and name CA, 1HVZ and resi 13 and name CA  # target=10.131217123668502 current=5.842335817521784
color yellow, pair_03
distance pair_04, 1HVZ and resi 8 and name CA, 1HVZ and resi 16 and name CA  # target=12.663347348738196 current=16.561777522178243
color yellow, pair_04
distance pair_05, 1HVZ and resi 2 and name CA, 1HVZ and resi 15 and name CA  # target=7.906254274526224 current=4.103501714297245
color yellow, pair_05
distance pair_06, 1HVZ and resi 1 and name CA, 1HVZ and resi 15 and name CA  # target=9.344141517641729 current=6.350000467299958
color yellow, pair_06
distance pair_07, 1HVZ and resi 5 and name CA, 1HVZ and resi 15 and name CA  # target=7.7682419406031 current=10.563410005642698
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
