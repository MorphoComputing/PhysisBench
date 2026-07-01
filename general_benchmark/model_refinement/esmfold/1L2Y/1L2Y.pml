# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.18399523871242

load 1L2Y.pdb, 1L2Y
bg_color white
hide everything, 1L2Y
show cartoon, 1L2Y
color grey80, 1L2Y
set cartoon_transparency, 0.1

select worst_residues, 1L2Y and resi 1+3+4+8+10+11+12+14+15+17
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1L2Y and resi 1 and name CA, 1L2Y and resi 9 and name CA  # target=12.651471541684925 current=13.327861963438295
color yellow, pair_00
distance pair_01, 1L2Y and resi 7 and name CA, 1L2Y and resi 17 and name CA  # target=11.504675634711193 current=12.109731681264883
color yellow, pair_01
distance pair_02, 1L2Y and resi 6 and name CA, 1L2Y and resi 17 and name CA  # target=8.422942923942673 current=8.996442837188535
color yellow, pair_02
distance pair_03, 1L2Y and resi 2 and name CA, 1L2Y and resi 11 and name CA  # target=11.179037550196782 current=11.741124147648746
color yellow, pair_03
distance pair_04, 1L2Y and resi 4 and name CA, 1L2Y and resi 13 and name CA  # target=10.558596534036816 current=11.068603074650738
color yellow, pair_04
distance pair_05, 1L2Y and resi 8 and name CA, 1L2Y and resi 18 and name CA  # target=11.977183267182477 current=12.475811053342763
color yellow, pair_05
distance pair_06, 1L2Y and resi 3 and name CA, 1L2Y and resi 11 and name CA  # target=12.117158238994847 current=12.613857955575453
color yellow, pair_06
distance pair_07, 1L2Y and resi 1 and name CA, 1L2Y and resi 13 and name CA  # target=13.300875229692915 current=13.794166755771354
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
