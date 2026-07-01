# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.8385626089781255

load 1GCN.pdb, 1GCN
bg_color white
hide everything, 1GCN
show cartoon, 1GCN
color grey80, 1GCN
set cartoon_transparency, 0.1

select worst_residues, 1GCN and resi 8+11+12+19+20+21+22+24+25+26
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1GCN and resi 7 and name CA, 1GCN and resi 25 and name CA  # target=27.786540813558187 current=28.999387828456154
color yellow, pair_00
distance pair_01, 1GCN and resi 2 and name CA, 1GCN and resi 21 and name CA  # target=32.7008976228241 current=33.72494818858094
color yellow, pair_01
distance pair_02, 1GCN and resi 3 and name CA, 1GCN and resi 22 and name CA  # target=32.819145345924746 current=33.7898096715263
color yellow, pair_02
distance pair_03, 1GCN and resi 1 and name CA, 1GCN and resi 13 and name CA  # target=23.787913677120656 current=24.717629813786708
color yellow, pair_03
distance pair_04, 1GCN and resi 12 and name CA, 1GCN and resi 27 and name CA  # target=21.87520379531537 current=22.764177524212585
color yellow, pair_04
distance pair_05, 1GCN and resi 11 and name CA, 1GCN and resi 26 and name CA  # target=23.162688087647325 current=24.03376489937246
color yellow, pair_05
distance pair_06, 1GCN and resi 6 and name CA, 1GCN and resi 20 and name CA  # target=22.049958265718935 current=22.877595270075567
color yellow, pair_06
distance pair_07, 1GCN and resi 5 and name CA, 1GCN and resi 19 and name CA  # target=22.890374300576614 current=23.674574621910374
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
