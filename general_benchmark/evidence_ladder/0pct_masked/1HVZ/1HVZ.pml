# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS | CA RMSD: 0.09320283516285716

load 1HVZ.pdb, 1HVZ
bg_color white
hide everything, 1HVZ
show cartoon, 1HVZ
color grey80, 1HVZ
set cartoon_transparency, 0.1

select worst_residues, 1HVZ and resi 4+5+6+9+10+11+12+13+15+16
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1HVZ and resi 4 and name CA, 1HVZ and resi 13 and name CA  # target=4.034457086336027 current=3.5164821906316606
color yellow, pair_00
distance pair_01, 1HVZ and resi 3 and name CA, 1HVZ and resi 12 and name CA  # target=8.352008875109242 current=8.458818710804167
color yellow, pair_01
distance pair_02, 1HVZ and resi 5 and name CA, 1HVZ and resi 14 and name CA  # target=7.316276058256372 current=7.417454225674446
color yellow, pair_02
distance pair_03, 1HVZ and resi 2 and name CA, 1HVZ and resi 14 and name CA  # target=5.8973556626287955 current=5.987571593586654
color yellow, pair_03
distance pair_04, 1HVZ and resi 5 and name CA, 1HVZ and resi 13 and name CA  # target=5.422188997747767 current=5.500517494881058
color yellow, pair_04
distance pair_05, 1HVZ and resi 1 and name CA, 1HVZ and resi 12 and name CA  # target=12.17172305312929 current=12.247601553053524
color yellow, pair_05
distance pair_06, 1HVZ and resi 2 and name CA, 1HVZ and resi 16 and name CA  # target=5.507935012836833 current=5.58356383425655
color yellow, pair_06
distance pair_07, 1HVZ and resi 2 and name CA, 1HVZ and resi 12 and name CA  # target=10.189814327988508 current=10.265065929952641
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
