# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.12299574769060914

load 1MSI.pdb, 1MSI
bg_color white
hide everything, 1MSI
show cartoon, 1MSI
color grey80, 1MSI
set cartoon_transparency, 0.1

select worst_residues, 1MSI and resi 1+2+3+13+14+15+16+29+51+52
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1MSI and resi 1 and name CA, 1MSI and resi 15 and name CA  # target=27.490431349682137 current=28.639612941830407
color yellow, pair_00
distance pair_01, 1MSI and resi 26 and name CA, 1MSI and resi 62 and name CA  # target=23.481610072046166 current=24.063042296999566
color yellow, pair_01
distance pair_02, 1MSI and resi 2 and name CA, 1MSI and resi 15 and name CA  # target=26.48893392023175 current=25.912266674037852
color yellow, pair_02
distance pair_03, 1MSI and resi 2 and name CA, 1MSI and resi 47 and name CA  # target=23.67892635324656 current=24.239813380993017
color yellow, pair_03
distance pair_04, 1MSI and resi 2 and name CA, 1MSI and resi 16 and name CA  # target=24.041785772531423 current=24.51449376708642
color yellow, pair_04
distance pair_05, 1MSI and resi 15 and name CA, 1MSI and resi 28 and name CA  # target=24.199768537122587 current=24.661273163616293
color yellow, pair_05
distance pair_06, 1MSI and resi 2 and name CA, 1MSI and resi 48 and name CA  # target=23.631070158665548 current=24.090332573521557
color yellow, pair_06
distance pair_07, 1MSI and resi 1 and name CA, 1MSI and resi 42 and name CA  # target=27.007528761143224 current=26.553117061695026
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
