# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.8129511379305902

load 1TIT.pdb, 1TIT
bg_color white
hide everything, 1TIT
show cartoon, 1TIT
color grey80, 1TIT
set cartoon_transparency, 0.1

select worst_residues, 1TIT and resi 1+8+12+13+26+27+28+54+68+87
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1TIT and resi 1 and name CA, 1TIT and resi 87 and name CA  # target=27.500000000000004 current=36.43918152538006
color yellow, pair_00
distance pair_01, 1TIT and resi 27 and name CA, 1TIT and resi 87 and name CA  # target=27.49999999892991 current=35.99457158562849
color yellow, pair_01
distance pair_02, 1TIT and resi 28 and name CA, 1TIT and resi 87 and name CA  # target=27.499999999506457 current=35.91827375566502
color yellow, pair_02
distance pair_03, 1TIT and resi 15 and name CA, 1TIT and resi 26 and name CA  # target=27.49999857722503 current=32.86409577492347
color yellow, pair_03
distance pair_04, 1TIT and resi 1 and name CA, 1TIT and resi 13 and name CA  # target=27.499999586443018 current=32.61680472008432
color yellow, pair_04
distance pair_05, 1TIT and resi 13 and name CA, 1TIT and resi 25 and name CA  # target=27.499995625024003 current=31.32069164246974
color yellow, pair_05
distance pair_06, 1TIT and resi 53 and name CA, 1TIT and resi 86 and name CA  # target=27.499978815231334 current=31.191067568684932
color yellow, pair_06
distance pair_07, 1TIT and resi 14 and name CA, 1TIT and resi 75 and name CA  # target=27.4999017929902 current=30.934716437398567
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
