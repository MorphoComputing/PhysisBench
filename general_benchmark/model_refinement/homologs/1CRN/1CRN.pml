# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.2885196280653523

load 1CRN.pdb, 1CRN
bg_color white
hide everything, 1CRN
show cartoon, 1CRN
color grey80, 1CRN
set cartoon_transparency, 0.1

select worst_residues, 1CRN and resi 17+18+19+20+21+35+36+37+38+41
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1CRN and resi 18 and name CA, 1CRN and resi 41 and name CA  # target=27.08383149356562 current=28.521840638936858
color yellow, pair_00
distance pair_01, 1CRN and resi 3 and name CA, 1CRN and resi 31 and name CA  # target=5.007480451626009 current=4.0828813779355615
color yellow, pair_01
distance pair_02, 1CRN and resi 18 and name CA, 1CRN and resi 42 and name CA  # target=26.460585127849885 current=27.268288742948727
color yellow, pair_02
distance pair_03, 1CRN and resi 19 and name CA, 1CRN and resi 41 and name CA  # target=26.532532962514217 current=27.304405339442066
color yellow, pair_03
distance pair_04, 1CRN and resi 4 and name CA, 1CRN and resi 43 and name CA  # target=4.9983824676143245 current=4.233238343411918
color yellow, pair_04
distance pair_05, 1CRN and resi 3 and name CA, 1CRN and resi 43 and name CA  # target=5.403540253583428 current=4.749809755012029
color yellow, pair_05
distance pair_06, 1CRN and resi 19 and name CA, 1CRN and resi 42 and name CA  # target=25.57162400920589 current=26.21811025119301
color yellow, pair_06
distance pair_07, 1CRN and resi 20 and name CA, 1CRN and resi 42 and name CA  # target=23.52417875652235 current=24.15793308774091
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
