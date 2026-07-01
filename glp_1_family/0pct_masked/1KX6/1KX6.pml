# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.4830872510214344

load 1KX6.pdb, 1KX6
bg_color white
hide everything, 1KX6
show cartoon, 1KX6
color grey80, 1KX6
set cartoon_transparency, 0.1

select worst_residues, 1KX6 and resi 1+5+6+15+16+18+19+25+26+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1KX6 and resi 6 and name CA, 1KX6 and resi 25 and name CA  # target=32.85077590365877 current=34.24964292159923
color yellow, pair_00
distance pair_01, 1KX6 and resi 5 and name CA, 1KX6 and resi 27 and name CA  # target=37.79081258238068 current=39.00686579577633
color yellow, pair_01
distance pair_02, 1KX6 and resi 8 and name CA, 1KX6 and resi 27 and name CA  # target=32.947330226346715 current=34.129274348508844
color yellow, pair_02
distance pair_03, 1KX6 and resi 7 and name CA, 1KX6 and resi 26 and name CA  # target=32.59706568080955 current=33.59451861127271
color yellow, pair_03
distance pair_04, 1KX6 and resi 7 and name CA, 1KX6 and resi 22 and name CA  # target=27.85996595716759 current=28.85387245173287
color yellow, pair_04
distance pair_05, 1KX6 and resi 12 and name CA, 1KX6 and resi 27 and name CA  # target=28.02795172322401 current=28.99237355098495
color yellow, pair_05
distance pair_06, 1KX6 and resi 5 and name CA, 1KX6 and resi 23 and name CA  # target=36.85369388863575 current=35.889389221958
color yellow, pair_06
distance pair_07, 1KX6 and resi 5 and name CA, 1KX6 and resi 20 and name CA  # target=32.164510121226435 current=31.207779466611964
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
