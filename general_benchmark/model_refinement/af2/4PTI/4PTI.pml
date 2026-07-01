# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.34338269250112763

load 4PTI.pdb, 4PTI
bg_color white
hide everything, 4PTI
show cartoon, 4PTI
color grey80, 4PTI
set cartoon_transparency, 0.1

select worst_residues, 4PTI and resi 2+3+15+16+25+33+38+39+49+56
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 4PTI and resi 14 and name CA, 4PTI and resi 56 and name CA  # target=27.43784871746217 current=30.70973468809107
color yellow, pair_00
distance pair_01, 4PTI and resi 13 and name CA, 4PTI and resi 56 and name CA  # target=27.3659430061148 current=29.8288230557884
color yellow, pair_01
distance pair_02, 4PTI and resi 15 and name CA, 4PTI and resi 56 and name CA  # target=27.326091297433365 current=29.41367938261029
color yellow, pair_02
distance pair_03, 4PTI and resi 12 and name CA, 4PTI and resi 56 and name CA  # target=27.30817243648985 current=29.035178591828487
color yellow, pair_03
distance pair_04, 4PTI and resi 2 and name CA, 4PTI and resi 56 and name CA  # target=12.579689923339405 current=11.135916762845458
color yellow, pair_04
distance pair_05, 4PTI and resi 1 and name CA, 4PTI and resi 56 and name CA  # target=9.800521657482333 current=8.49900256104366
color yellow, pair_05
distance pair_06, 4PTI and resi 14 and name CA, 4PTI and resi 55 and name CA  # target=27.003866736765143 current=28.19236471113486
color yellow, pair_06
distance pair_07, 4PTI and resi 3 and name CA, 4PTI and resi 56 and name CA  # target=13.571339617469242 current=12.430317895643679
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
