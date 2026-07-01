# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.1023761831855556

load 1EGF.pdb, 1EGF
bg_color white
hide everything, 1EGF
show cartoon, 1EGF
color grey80, 1EGF
set cartoon_transparency, 0.1

select worst_residues, 1EGF and resi 1+8+10+24+34+35+48+49+50+51
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1EGF and resi 4+22+43+51
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1EGF and resi 1 and name CA, 1EGF and resi 24 and name CA  # target=14.66785248559224 current=8.214953557396765
color yellow, pair_00
distance pair_01, 1EGF and resi 1 and name CA, 1EGF and resi 23 and name CA  # target=12.132971589211595 current=5.999867066471677
color yellow, pair_01
distance pair_02, 1EGF and resi 1 and name CA, 1EGF and resi 22 and name CA  # target=11.371413242309098 current=5.900645480845383
color yellow, pair_02
distance pair_03, 1EGF and resi 1 and name CA, 1EGF and resi 25 and name CA  # target=16.574240996778094 current=11.229426544840324
color yellow, pair_03
distance pair_04, 1EGF and resi 1 and name CA, 1EGF and resi 26 and name CA  # target=15.84228975497439 current=10.992960701556441
color yellow, pair_04
distance pair_05, 1EGF and resi 34 and name CA, 1EGF and resi 50 and name CA  # target=13.223848185783787 current=8.727773940678969
color yellow, pair_05
distance pair_06, 1EGF and resi 31 and name CA, 1EGF and resi 50 and name CA  # target=20.997703456219494 current=16.74200534741716
color yellow, pair_06
distance pair_07, 1EGF and resi 31 and name CA, 1EGF and resi 51 and name CA  # target=21.06457938210532 current=16.810610523650276
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
