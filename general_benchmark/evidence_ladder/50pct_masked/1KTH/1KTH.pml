# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.08693834782889048

load 1KTH.pdb, 1KTH
bg_color white
hide everything, 1KTH
show cartoon, 1KTH
color grey80, 1KTH
set cartoon_transparency, 0.1

select worst_residues, 1KTH and resi 1+2+12+13+14+27+37+38+52+56
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1KTH and resi 13 and name CA, 1KTH and resi 56 and name CA  # target=27.49997738708943 current=32.1330715625323
color yellow, pair_00
distance pair_01, 1KTH and resi 15 and name CA, 1KTH and resi 56 and name CA  # target=27.499911688112512 current=31.365326157256423
color yellow, pair_01
distance pair_02, 1KTH and resi 13 and name CA, 1KTH and resi 55 and name CA  # target=27.490495840610627 current=28.839173103154643
color yellow, pair_02
distance pair_03, 1KTH and resi 14 and name CA, 1KTH and resi 27 and name CA  # target=27.491686344161042 current=28.811976420795776
color yellow, pair_03
distance pair_04, 1KTH and resi 37 and name CA, 1KTH and resi 56 and name CA  # target=27.488746705658585 current=28.656303297127884
color yellow, pair_04
distance pair_05, 1KTH and resi 13 and name CA, 1KTH and resi 52 and name CA  # target=27.469762587636183 current=28.102714471091357
color yellow, pair_05
distance pair_06, 1KTH and resi 13 and name CA, 1KTH and resi 49 and name CA  # target=23.69691604279881 current=24.28019409283754
color yellow, pair_06
distance pair_07, 1KTH and resi 13 and name CA, 1KTH and resi 26 and name CA  # target=27.460707431906613 current=28.021708926719086
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
