# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.1788797724959825

load 1HVZ.pdb, 1HVZ
bg_color white
hide everything, 1HVZ
show cartoon, 1HVZ
color grey80, 1HVZ
set cartoon_transparency, 0.1

select worst_residues, 1HVZ and resi 1+3+4+6+7+8+11+13+14+16
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1HVZ and resi 3 and name CA, 1HVZ and resi 16 and name CA  # target=8.330141441022448 current=7.271551078369642
color yellow, pair_00
distance pair_01, 1HVZ and resi 1 and name CA, 1HVZ and resi 13 and name CA  # target=10.321959391628013 current=9.298576585666163
color yellow, pair_01
distance pair_02, 1HVZ and resi 1 and name CA, 1HVZ and resi 9 and name CA  # target=19.94800020743144 current=20.731957944630402
color yellow, pair_02
distance pair_03, 1HVZ and resi 4 and name CA, 1HVZ and resi 13 and name CA  # target=4.034457086336027 current=3.3393062305731926
color yellow, pair_03
distance pair_04, 1HVZ and resi 4 and name CA, 1HVZ and resi 15 and name CA  # target=8.79542026899863 current=8.166476944414168
color yellow, pair_04
distance pair_05, 1HVZ and resi 8 and name CA, 1HVZ and resi 16 and name CA  # target=18.81324389942984 current=19.14879990788416
color yellow, pair_05
distance pair_06, 1HVZ and resi 3 and name CA, 1HVZ and resi 13 and name CA  # target=5.521119401847383 current=5.832301106584311
color yellow, pair_06
distance pair_07, 1HVZ and resi 3 and name CA, 1HVZ and resi 15 and name CA  # target=6.697087098117435 current=6.999056277303042
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
