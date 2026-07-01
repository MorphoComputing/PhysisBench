# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.180886373877347

load 1PT4.pdb, 1PT4
bg_color white
hide everything, 1PT4
show cartoon, 1PT4
color grey80, 1PT4
set cartoon_transparency, 0.1

select worst_residues, 1PT4 and resi 5+6+7+10+11+12+13+18+19+23
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1PT4 and resi 3 and name CA, 1PT4 and resi 22 and name CA  # target=3.9693779294802645 current=6.836120681781457
color yellow, pair_00
distance pair_01, 1PT4 and resi 4 and name CA, 1PT4 and resi 20 and name CA  # target=4.028908588844348 current=6.227624932181531
color yellow, pair_01
distance pair_02, 1PT4 and resi 14 and name CA, 1PT4 and resi 22 and name CA  # target=4.893392851656878 current=7.021372613250283
color yellow, pair_02
distance pair_03, 1PT4 and resi 5 and name CA, 1PT4 and resi 19 and name CA  # target=5.533144452470395 current=4.064766475355976
color yellow, pair_03
distance pair_04, 1PT4 and resi 5 and name CA, 1PT4 and resi 18 and name CA  # target=4.647636918307805 current=3.2149076259584954
color yellow, pair_04
distance pair_05, 1PT4 and resi 2 and name CA, 1PT4 and resi 20 and name CA  # target=6.703322173651606 current=5.286822817856209
color yellow, pair_05
distance pair_06, 1PT4 and resi 14 and name CA, 1PT4 and resi 23 and name CA  # target=4.15551083370725 current=5.424770237884153
color yellow, pair_06
distance pair_07, 1PT4 and resi 3 and name CA, 1PT4 and resi 21 and name CA  # target=4.893392851656878 current=3.719767838749979
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
