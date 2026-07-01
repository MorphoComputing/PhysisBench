# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.3856920856933404

load 1B3C.pdb, 1B3C
bg_color white
hide everything, 1B3C
show cartoon, 1B3C
color grey80, 1B3C
set cartoon_transparency, 0.1

select worst_residues, 1B3C and resi 15+17+19+20+29+34+35+41+51+52
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1B3C and resi 20 and name CA, 1B3C and resi 62 and name CA  # target=27.500000000000004 current=25.425106821894822
color yellow, pair_00
distance pair_01, 1B3C and resi 29 and name CA, 1B3C and resi 51 and name CA  # target=15.390096291284703 current=14.762431470235974
color yellow, pair_01
distance pair_02, 1B3C and resi 7 and name CA, 1B3C and resi 19 and name CA  # target=23.300310175969358 current=23.91354073406144
color yellow, pair_02
distance pair_03, 1B3C and resi 24 and name CA, 1B3C and resi 62 and name CA  # target=23.09979585749783 current=23.68790614734185
color yellow, pair_03
distance pair_04, 1B3C and resi 41 and name CA, 1B3C and resi 56 and name CA  # target=13.956528022505438 current=14.538549626561675
color yellow, pair_04
distance pair_05, 1B3C and resi 1 and name CA, 1B3C and resi 20 and name CA  # target=15.114799289057087 current=15.668493763583344
color yellow, pair_05
distance pair_06, 1B3C and resi 16 and name CA, 1B3C and resi 36 and name CA  # target=15.38041268806892 current=15.87688820306537
color yellow, pair_06
distance pair_07, 1B3C and resi 32 and name CA, 1B3C and resi 62 and name CA  # target=24.103642978597687 current=24.58435006218891
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
