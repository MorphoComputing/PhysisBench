# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.3660043941943078

load 1MSI.pdb, 1MSI
bg_color white
hide everything, 1MSI
show cartoon, 1MSI
color grey80, 1MSI
set cartoon_transparency, 0.1

select worst_residues, 1MSI and resi 1+11+15+16+24+25+26+27+28+62
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1MSI and resi 1 and name CA, 1MSI and resi 14 and name CA  # target=27.256106622415388 current=29.735688007995662
color yellow, pair_00
distance pair_01, 1MSI and resi 1 and name CA, 1MSI and resi 13 and name CA  # target=27.067675970278486 current=28.8651492731967
color yellow, pair_01
distance pair_02, 1MSI and resi 1 and name CA, 1MSI and resi 15 and name CA  # target=27.000044822712262 current=28.518408318038773
color yellow, pair_02
distance pair_03, 1MSI and resi 1 and name CA, 1MSI and resi 12 and name CA  # target=26.90410674051829 current=28.200684853298963
color yellow, pair_03
distance pair_04, 1MSI and resi 1 and name CA, 1MSI and resi 16 and name CA  # target=26.62779371607883 current=27.575546153779907
color yellow, pair_04
distance pair_05, 1MSI and resi 9 and name CA, 1MSI and resi 64 and name CA  # target=22.464525129417837 current=23.308572019065313
color yellow, pair_05
distance pair_06, 1MSI and resi 1 and name CA, 1MSI and resi 46 and name CA  # target=26.10655135309214 current=26.907994010013613
color yellow, pair_06
distance pair_07, 1MSI and resi 26 and name CA, 1MSI and resi 62 and name CA  # target=23.04490067408429 current=23.802385975052925
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
