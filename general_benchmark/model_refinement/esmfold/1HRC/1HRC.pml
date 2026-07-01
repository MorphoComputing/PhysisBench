# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.4469105329968385

load 1HRC.pdb, 1HRC
bg_color white
hide everything, 1HRC
show cartoon, 1HRC
color grey80, 1HRC
set cartoon_transparency, 0.1

select worst_residues, 1HRC and resi 4+36+37+38+41+43+44+52+56+74
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1HRC and resi 3 and name CA, 1HRC and resi 49 and name CA  # target=27.48486409392377 current=33.36507953480724
color yellow, pair_00
distance pair_01, 1HRC and resi 1 and name CA, 1HRC and resi 49 and name CA  # target=27.481900509056555 current=33.22065689649206
color yellow, pair_01
distance pair_02, 1HRC and resi 3 and name CA, 1HRC and resi 53 and name CA  # target=27.475028861456547 current=32.84934653452545
color yellow, pair_02
distance pair_03, 1HRC and resi 4 and name CA, 1HRC and resi 49 and name CA  # target=27.469571158209067 current=32.322521949385596
color yellow, pair_03
distance pair_04, 1HRC and resi 4 and name CA, 1HRC and resi 53 and name CA  # target=27.45269746328515 current=31.993706722771766
color yellow, pair_04
distance pair_05, 1HRC and resi 3 and name CA, 1HRC and resi 50 and name CA  # target=27.448347430678645 current=31.986442571911986
color yellow, pair_05
distance pair_06, 1HRC and resi 1 and name CA, 1HRC and resi 53 and name CA  # target=27.449774019508787 current=31.846150842214016
color yellow, pair_06
distance pair_07, 1HRC and resi 1 and name CA, 1HRC and resi 48 and name CA  # target=27.441346522824183 current=31.791127015554004
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
