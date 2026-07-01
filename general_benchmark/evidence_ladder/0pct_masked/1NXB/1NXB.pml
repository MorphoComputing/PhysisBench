# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.5664007207161362

load 1NXB.pdb, 1NXB
bg_color white
hide everything, 1NXB
show cartoon, 1NXB
color grey80, 1NXB
set cartoon_transparency, 0.1

select worst_residues, 1NXB and resi 15+17+18+19+20+30+31+32+33+47
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1NXB and resi 19 and name CA, 1NXB and resi 31 and name CA  # target=27.499999986930618 current=34.45330003574002
color yellow, pair_00
distance pair_01, 1NXB and resi 18 and name CA, 1NXB and resi 31 and name CA  # target=27.499999987978345 current=34.19071206894735
color yellow, pair_01
distance pair_02, 1NXB and resi 19 and name CA, 1NXB and resi 32 and name CA  # target=27.499999880636196 current=34.16054963541017
color yellow, pair_02
distance pair_03, 1NXB and resi 18 and name CA, 1NXB and resi 32 and name CA  # target=27.499999802051633 current=33.64057998540954
color yellow, pair_03
distance pair_04, 1NXB and resi 19 and name CA, 1NXB and resi 33 and name CA  # target=27.499998931908255 current=33.388863634526686
color yellow, pair_04
distance pair_05, 1NXB and resi 18 and name CA, 1NXB and resi 33 and name CA  # target=27.499998816652337 current=33.121028804359156
color yellow, pair_05
distance pair_06, 1NXB and resi 18 and name CA, 1NXB and resi 30 and name CA  # target=27.499998412258662 current=32.64730367179481
color yellow, pair_06
distance pair_07, 1NXB and resi 31 and name CA, 1NXB and resi 56 and name CA  # target=27.49999339656225 current=32.619692075307924
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
