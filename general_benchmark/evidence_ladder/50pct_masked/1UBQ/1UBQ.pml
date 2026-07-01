# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.13544998646133144

load 1UBQ.pdb, 1UBQ
bg_color white
hide everything, 1UBQ
show cartoon, 1UBQ
color grey80, 1UBQ
set cartoon_transparency, 0.1

select worst_residues, 1UBQ and resi 1+8+45+59+61+63+71+72+73+74
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1UBQ and resi 62 and name CA, 1UBQ and resi 74 and name CA  # target=27.499999913278657 current=34.835044279861386
color yellow, pair_00
distance pair_01, 1UBQ and resi 63 and name CA, 1UBQ and resi 74 and name CA  # target=27.499998780297595 current=33.29615741942041
color yellow, pair_01
distance pair_02, 1UBQ and resi 18 and name CA, 1UBQ and resi 74 and name CA  # target=27.499997282430687 current=32.935886934279544
color yellow, pair_02
distance pair_03, 1UBQ and resi 1 and name CA, 1UBQ and resi 74 and name CA  # target=27.499996338318034 current=32.801266490855305
color yellow, pair_03
distance pair_04, 1UBQ and resi 62 and name CA, 1UBQ and resi 73 and name CA  # target=27.499977528751028 current=32.143688764339196
color yellow, pair_04
distance pair_05, 1UBQ and resi 16 and name CA, 1UBQ and resi 74 and name CA  # target=27.499891409773277 current=31.05555904211531
color yellow, pair_05
distance pair_06, 1UBQ and resi 63 and name CA, 1UBQ and resi 73 and name CA  # target=27.499793037305746 current=30.87011448345141
color yellow, pair_06
distance pair_07, 1UBQ and resi 64 and name CA, 1UBQ and resi 74 and name CA  # target=27.499897548857145 current=30.782993645651235
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
