# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.4065433589683489

load 1MSI.pdb, 1MSI
bg_color white
hide everything, 1MSI
show cartoon, 1MSI
color grey80, 1MSI
set cartoon_transparency, 0.1

select worst_residues, 1MSI and resi 1+15+16+17+18+24+29+31+62+64
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1MSI and resi 13 and name CA, 1MSI and resi 48 and name CA  # target=5.124867962428853 current=4.392918381444085
color yellow, pair_00
distance pair_01, 1MSI and resi 45 and name CA, 1MSI and resi 60 and name CA  # target=5.169835078221787 current=4.451867166952544
color yellow, pair_01
distance pair_02, 1MSI and resi 3 and name CA, 1MSI and resi 26 and name CA  # target=5.077779706734895 current=4.36618075502875
color yellow, pair_02
distance pair_03, 1MSI and resi 10 and name CA, 1MSI and resi 51 and name CA  # target=5.408757411739293 current=4.702633939521299
color yellow, pair_03
distance pair_04, 1MSI and resi 6 and name CA, 1MSI and resi 54 and name CA  # target=5.068794817959237 current=4.380915002053364
color yellow, pair_04
distance pair_05, 1MSI and resi 2 and name CA, 1MSI and resi 14 and name CA  # target=26.212912636415158 current=26.883992750871005
color yellow, pair_05
distance pair_06, 1MSI and resi 10 and name CA, 1MSI and resi 50 and name CA  # target=5.339986565661523 current=4.698545483085993
color yellow, pair_06
distance pair_07, 1MSI and resi 25 and name CA, 1MSI and resi 62 and name CA  # target=22.06194255513266 current=22.691505133355918
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
