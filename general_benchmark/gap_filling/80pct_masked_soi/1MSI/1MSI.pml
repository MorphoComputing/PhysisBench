# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.41619090509281226

load 1MSI.pdb, 1MSI
bg_color white
hide everything, 1MSI
show cartoon, 1MSI
color grey80, 1MSI
set cartoon_transparency, 0.1

select worst_residues, 1MSI and resi 2+16+18+23+26+31+37+40+41+44
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1MSI and resi 1 and name CA, 1MSI and resi 64 and name CA  # target=21.552228194066863 current=22.323284910723842
color yellow, pair_00
distance pair_01, 1MSI and resi 24 and name CA, 1MSI and resi 63 and name CA  # target=17.53373719464941 current=18.113804136489904
color yellow, pair_01
distance pair_02, 1MSI and resi 1 and name CA, 1MSI and resi 11 and name CA  # target=24.03590542020744 current=24.58315907928087
color yellow, pair_02
distance pair_03, 1MSI and resi 12 and name CA, 1MSI and resi 37 and name CA  # target=17.354908397748748 current=17.896708183522758
color yellow, pair_03
distance pair_04, 1MSI and resi 5 and name CA, 1MSI and resi 31 and name CA  # target=6.607469027561782 current=7.1343028941174005
color yellow, pair_04
distance pair_05, 1MSI and resi 2 and name CA, 1MSI and resi 16 and name CA  # target=24.041785772531423 current=24.547188785591484
color yellow, pair_05
distance pair_06, 1MSI and resi 28 and name CA, 1MSI and resi 39 and name CA  # target=21.316539981337602 current=21.8212661813602
color yellow, pair_06
distance pair_07, 1MSI and resi 21 and name CA, 1MSI and resi 42 and name CA  # target=10.918834175384657 current=11.415198033326295
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
