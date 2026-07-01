# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.333650206749659

load 1PT4.pdb, 1PT4
bg_color white
hide everything, 1PT4
show cartoon, 1PT4
color grey80, 1PT4
set cartoon_transparency, 0.1

select worst_residues, 1PT4 and resi 1+2+5+6+8+10+11+12+18+19
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1PT4 and resi 9 and name CA, 1PT4 and resi 21 and name CA  # target=5.526827568351721 current=7.587398188657023
color yellow, pair_00
distance pair_01, 1PT4 and resi 3 and name CA, 1PT4 and resi 22 and name CA  # target=3.9693779294802645 current=5.84441859158883
color yellow, pair_01
distance pair_02, 1PT4 and resi 5 and name CA, 1PT4 and resi 20 and name CA  # target=6.114476574701069 current=7.293545997011506
color yellow, pair_02
distance pair_03, 1PT4 and resi 2 and name CA, 1PT4 and resi 10 and name CA  # target=5.533144452470395 current=6.645225619391411
color yellow, pair_03
distance pair_04, 1PT4 and resi 4 and name CA, 1PT4 and resi 18 and name CA  # target=4.893392851656878 current=5.971412009632882
color yellow, pair_04
distance pair_05, 1PT4 and resi 5 and name CA, 1PT4 and resi 18 and name CA  # target=4.647636918307805 current=5.689776783239919
color yellow, pair_05
distance pair_06, 1PT4 and resi 4 and name CA, 1PT4 and resi 20 and name CA  # target=4.028908588844348 current=5.066338247170034
color yellow, pair_06
distance pair_07, 1PT4 and resi 7 and name CA, 1PT4 and resi 18 and name CA  # target=4.647636918307805 current=5.675843495196278
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
