# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.070288168383596

load 1HVZ.pdb, 1HVZ
bg_color white
hide everything, 1HVZ
show cartoon, 1HVZ
color grey80, 1HVZ
set cartoon_transparency, 0.1

select worst_residues, 1HVZ and resi 1+2+3+7+8+9+10+12+15+16
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1HVZ and resi 6 and name CA, 1HVZ and resi 14 and name CA  # target=5.212492862963047 current=10.483333283228681
color yellow, pair_00
distance pair_01, 1HVZ and resi 4 and name CA, 1HVZ and resi 15 and name CA  # target=5.212492862963047 current=8.426165428417244
color yellow, pair_01
distance pair_02, 1HVZ and resi 3 and name CA, 1HVZ and resi 16 and name CA  # target=5.212492862963047 current=7.845491015879125
color yellow, pair_02
distance pair_03, 1HVZ and resi 5 and name CA, 1HVZ and resi 15 and name CA  # target=5.212492862963047 current=7.752558837960251
color yellow, pair_03
distance pair_04, 1HVZ and resi 5 and name CA, 1HVZ and resi 14 and name CA  # target=5.212492862963047 current=6.823138029693865
color yellow, pair_04

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
