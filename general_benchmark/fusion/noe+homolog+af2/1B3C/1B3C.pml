# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.6627885450679953

load 1B3C.pdb, 1B3C
bg_color white
hide everything, 1B3C
show cartoon, 1B3C
color grey80, 1B3C
set cartoon_transparency, 0.1

select worst_residues, 1B3C and resi 7+29+30+31+32+33+50+51+54+60
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1B3C and resi 10 and name CA, 1B3C and resi 56 and name CA  # target=4.647636918307805 current=7.271793799077369
color yellow, pair_00
distance pair_01, 1B3C and resi 14 and name CA, 1B3C and resi 39 and name CA  # target=4.368633443260828 current=6.967528600040095
color yellow, pair_01
distance pair_02, 1B3C and resi 19 and name CA, 1B3C and resi 60 and name CA  # target=27.352606855959234 current=29.75745689055765
color yellow, pair_02
distance pair_03, 1B3C and resi 1 and name CA, 1B3C and resi 48 and name CA  # target=4.028908588844348 current=6.168666585419817
color yellow, pair_03
distance pair_04, 1B3C and resi 3 and name CA, 1B3C and resi 46 and name CA  # target=4.028908588844348 current=6.073273932775536
color yellow, pair_04
distance pair_05, 1B3C and resi 7 and name CA, 1B3C and resi 53 and name CA  # target=10.284367150295004 current=12.309327014967717
color yellow, pair_05
distance pair_06, 1B3C and resi 21 and name CA, 1B3C and resi 60 and name CA  # target=27.24611915793037 current=29.192668484214934
color yellow, pair_06
distance pair_07, 1B3C and resi 18 and name CA, 1B3C and resi 60 and name CA  # target=27.226522974943336 current=28.66707411022596
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
