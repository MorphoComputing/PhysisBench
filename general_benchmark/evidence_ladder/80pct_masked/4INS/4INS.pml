# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 7.528872140937078

load 4INS.pdb, 4INS
bg_color white
hide everything, 4INS
show cartoon, 4INS
color grey80, 4INS
set cartoon_transparency, 0.1

select worst_residues, 4INS and resi 17+18+23+43+45+46+47+64+70+74
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 4INS and resi 19+32+42+47+68+174
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 4INS and resi 46 and name CA, 4INS and resi 68 and name CA  # target=27.29455361270812 current=9.63807814631554
color yellow, pair_00
distance pair_01, 4INS and resi 45 and name CA, 4INS and resi 54 and name CA  # target=26.80549421678686 current=13.486564784433092
color yellow, pair_01
distance pair_02, 4INS and resi 8 and name CA, 4INS and resi 17 and name CA  # target=17.46913895734687 current=4.43064350838178
color yellow, pair_02
distance pair_03, 4INS and resi 45 and name CA, 4INS and resi 67 and name CA  # target=27.20434996530542 current=14.519815831505056
color yellow, pair_03
distance pair_04, 4INS and resi 46 and name CA, 4INS and resi 72 and name CA  # target=22.71375705799234 current=10.427733049074797
color yellow, pair_04
distance pair_05, 4INS and resi 28 and name CA, 4INS and resi 92 and name CA  # target=18.905346340478133 current=7.3523561824900465
color yellow, pair_05
distance pair_06, 4INS and resi 46 and name CA, 4INS and resi 57 and name CA  # target=24.344152239909924 current=12.901036341227226
color yellow, pair_06
distance pair_07, 4INS and resi 65 and name CA, 4INS and resi 73 and name CA  # target=15.29231095785695 current=4.244702246262286
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
