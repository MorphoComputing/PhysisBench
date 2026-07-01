# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.472394967451113

load 1HVZ.pdb, 1HVZ
bg_color white
hide everything, 1HVZ
show cartoon, 1HVZ
color grey80, 1HVZ
set cartoon_transparency, 0.1

select worst_residues, 1HVZ and resi 1+3+4+5+7+8+9+13+14+16
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1HVZ and resi 4 and name CA, 1HVZ and resi 13 and name CA  # target=4.743748768144805 current=3.8404379181921784
color yellow, pair_00
distance pair_01, 1HVZ and resi 2 and name CA, 1HVZ and resi 16 and name CA  # target=6.500664848817827 current=5.742761048925499
color yellow, pair_01
distance pair_02, 1HVZ and resi 2 and name CA, 1HVZ and resi 11 and name CA  # target=11.670824380330645 current=12.390112570314429
color yellow, pair_02
distance pair_03, 1HVZ and resi 2 and name CA, 1HVZ and resi 10 and name CA  # target=15.408385428326204 current=16.01795458609545
color yellow, pair_03
distance pair_04, 1HVZ and resi 1 and name CA, 1HVZ and resi 9 and name CA  # target=20.989108836712546 current=21.49791029006071
color yellow, pair_04
distance pair_05, 1HVZ and resi 2 and name CA, 1HVZ and resi 15 and name CA  # target=4.825462045915141 current=4.3554477307854595
color yellow, pair_05
distance pair_06, 1HVZ and resi 8 and name CA, 1HVZ and resi 16 and name CA  # target=22.443846399356087 current=22.907528171305223
color yellow, pair_06
distance pair_07, 1HVZ and resi 3 and name CA, 1HVZ and resi 11 and name CA  # target=10.020062274080487 current=10.45648182912604
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
