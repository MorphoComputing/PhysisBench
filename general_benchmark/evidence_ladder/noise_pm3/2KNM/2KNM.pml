# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.596658843198658

load 2KNM.pdb, 2KNM
bg_color white
hide everything, 2KNM
show cartoon, 2KNM
color grey80, 2KNM
set cartoon_transparency, 0.1

select worst_residues, 2KNM and resi 1+13+14+15+16+17+18+24+25+28
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2KNM and resi 7+10+18+19+46
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2KNM and resi 14 and name CA, 2KNM and resi 24 and name CA  # target=18.221569640103304 current=11.997272959856208
color yellow, pair_00
distance pair_01, 2KNM and resi 17 and name CA, 2KNM and resi 26 and name CA  # target=15.9392059896641 current=10.160019540895139
color yellow, pair_01
distance pair_02, 2KNM and resi 10 and name CA, 2KNM and resi 21 and name CA  # target=16.194786085660148 current=10.939566509986328
color yellow, pair_02
distance pair_03, 2KNM and resi 9 and name CA, 2KNM and resi 25 and name CA  # target=16.29359309894949 current=11.29895536128986
color yellow, pair_03
distance pair_04, 2KNM and resi 2 and name CA, 2KNM and resi 25 and name CA  # target=11.201696062974271 current=6.3032892400466
color yellow, pair_04
distance pair_05, 2KNM and resi 14 and name CA, 2KNM and resi 28 and name CA  # target=7.724264754147887 current=12.582552513139753
color yellow, pair_05
distance pair_06, 2KNM and resi 4 and name CA, 2KNM and resi 14 and name CA  # target=14.800360342167352 current=10.150417180302469
color yellow, pair_06
distance pair_07, 2KNM and resi 2 and name CA, 2KNM and resi 12 and name CA  # target=5.93354279260776 current=10.500661818337822
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
