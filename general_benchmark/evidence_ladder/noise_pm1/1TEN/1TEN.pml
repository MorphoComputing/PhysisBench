# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.49456814469722843

load 1TEN.pdb, 1TEN
bg_color white
hide everything, 1TEN
show cartoon, 1TEN
color grey80, 1TEN
set cartoon_transparency, 0.1

select worst_residues, 1TEN and resi 26+28+30+36+37+50+61+63+67+70
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1TEN and resi 18+26+48+64
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1TEN and resi 64 and name CA, 1TEN and resi 77 and name CA  # target=27.49868123802494 current=36.92357697109419
color yellow, pair_00
distance pair_01, 1TEN and resi 14 and name CA, 1TEN and resi 77 and name CA  # target=27.49889074195795 current=36.81021089539507
color yellow, pair_01
distance pair_02, 1TEN and resi 27 and name CA, 1TEN and resi 64 and name CA  # target=27.49810342936676 current=36.61005465791702
color yellow, pair_02
distance pair_03, 1TEN and resi 64 and name CA, 1TEN and resi 76 and name CA  # target=27.49746805782422 current=36.604497087960546
color yellow, pair_03
distance pair_04, 1TEN and resi 63 and name CA, 1TEN and resi 77 and name CA  # target=27.498884384080284 current=36.59326183860739
color yellow, pair_04
distance pair_05, 1TEN and resi 27 and name CA, 1TEN and resi 63 and name CA  # target=27.496329603023057 current=36.39417725164645
color yellow, pair_05
distance pair_06, 1TEN and resi 13 and name CA, 1TEN and resi 77 and name CA  # target=27.49868727034071 current=36.09292987569773
color yellow, pair_06
distance pair_07, 1TEN and resi 26 and name CA, 1TEN and resi 63 and name CA  # target=27.498802731352466 current=36.092339515335624
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
