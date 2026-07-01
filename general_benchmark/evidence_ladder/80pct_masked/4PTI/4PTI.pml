# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.2776147188442744

load 4PTI.pdb, 4PTI
bg_color white
hide everything, 4PTI
show cartoon, 4PTI
color grey80, 4PTI
set cartoon_transparency, 0.1

select worst_residues, 4PTI and resi 2+3+7+11+12+24+32+35+38+43
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 4PTI and resi 21 and name CA, 4PTI and resi 43 and name CA  # target=5.106981373704519 current=3.2389922298658114
color yellow, pair_00
distance pair_01, 4PTI and resi 11 and name CA, 4PTI and resi 35 and name CA  # target=5.7027151459697105 current=3.8998114897758405
color yellow, pair_01
distance pair_02, 4PTI and resi 8 and name CA, 4PTI and resi 38 and name CA  # target=11.88388086380016 current=10.118829079165149
color yellow, pair_02
distance pair_03, 4PTI and resi 11 and name CA, 4PTI and resi 38 and name CA  # target=5.866413493339225 current=4.1077058905291
color yellow, pair_03
distance pair_04, 4PTI and resi 7 and name CA, 4PTI and resi 47 and name CA  # target=15.798340869551009 current=14.07526844847046
color yellow, pair_04
distance pair_05, 4PTI and resi 7 and name CA, 4PTI and resi 26 and name CA  # target=12.181177444277257 current=13.80238260071559
color yellow, pair_05
distance pair_06, 4PTI and resi 5 and name CA, 4PTI and resi 24 and name CA  # target=5.7702876493487185 current=7.278942958922349
color yellow, pair_06
distance pair_07, 4PTI and resi 32 and name CA, 4PTI and resi 42 and name CA  # target=10.92044099127306 current=9.437495854310777
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
