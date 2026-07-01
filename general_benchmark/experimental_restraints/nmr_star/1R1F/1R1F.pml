# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 6.817412326544189

load 1R1F.pdb, 1R1F
bg_color white
hide everything, 1R1F
show cartoon, 1R1F
color grey80, 1R1F
set cartoon_transparency, 0.1

select worst_residues, 1R1F and resi 6+7+8+17+18+20+26+27+34+35
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1R1F and resi 19 and name CA, 1R1F and resi 34 and name CA  # target=4.893392851656878 current=8.813383279992735
color yellow, pair_00
distance pair_01, 1R1F and resi 20 and name CA, 1R1F and resi 34 and name CA  # target=4.491219231640243 current=8.190055179937653
color yellow, pair_01
distance pair_02, 1R1F and resi 23 and name CA, 1R1F and resi 31 and name CA  # target=3.6508476368543064 current=6.60008568222799
color yellow, pair_02
distance pair_03, 1R1F and resi 3 and name CA, 1R1F and resi 33 and name CA  # target=4.893392851656878 current=7.575369183981044
color yellow, pair_03
distance pair_04, 1R1F and resi 11 and name CA, 1R1F and resi 25 and name CA  # target=4.028908588844348 current=6.510277545095641
color yellow, pair_04
distance pair_05, 1R1F and resi 24 and name CA, 1R1F and resi 32 and name CA  # target=5.803813747193671 current=8.196200712945378
color yellow, pair_05
distance pair_06, 1R1F and resi 2 and name CA, 1R1F and resi 32 and name CA  # target=3.6635224040666117 current=5.957754352783075
color yellow, pair_06
distance pair_07, 1R1F and resi 21 and name CA, 1R1F and resi 34 and name CA  # target=5.533144452470395 current=7.697213636536645
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
