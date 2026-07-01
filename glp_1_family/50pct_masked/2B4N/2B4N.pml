# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.945439109621467

load 2B4N.pdb, 2B4N
bg_color white
hide everything, 2B4N
show cartoon, 2B4N
color grey80, 2B4N
set cartoon_transparency, 0.1

select worst_residues, 2B4N and resi 1+11+16+22+23+27+28+29+30+39
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2B4N and resi 1 and name CA, 2B4N and resi 24 and name CA  # target=27.614535517418503 current=29.996942088343815
color yellow, pair_00
distance pair_01, 2B4N and resi 6 and name CA, 2B4N and resi 24 and name CA  # target=27.637285029109606 current=29.512907990171456
color yellow, pair_01
distance pair_02, 2B4N and resi 9 and name CA, 2B4N and resi 38 and name CA  # target=51.982040496003165 current=50.278944341745635
color yellow, pair_02
distance pair_03, 2B4N and resi 2 and name CA, 2B4N and resi 28 and name CA  # target=33.16806003468655 current=34.80584388872776
color yellow, pair_03
distance pair_04, 2B4N and resi 19 and name CA, 2B4N and resi 35 and name CA  # target=27.656589203378378 current=29.14766998014088
color yellow, pair_04
distance pair_05, 2B4N and resi 5 and name CA, 2B4N and resi 29 and name CA  # target=37.743828685696805 current=39.20060532340911
color yellow, pair_05
distance pair_06, 2B4N and resi 2 and name CA, 2B4N and resi 27 and name CA  # target=32.53795825921335 current=33.953164845109825
color yellow, pair_06
distance pair_07, 2B4N and resi 18 and name CA, 2B4N and resi 36 and name CA  # target=33.37552269844362 current=34.728621379405396
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
