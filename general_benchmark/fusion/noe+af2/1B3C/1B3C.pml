# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.6138979570501875

load 1B3C.pdb, 1B3C
bg_color white
hide everything, 1B3C
show cartoon, 1B3C
color grey80, 1B3C
set cartoon_transparency, 0.1

select worst_residues, 1B3C and resi 28+29+30+31+32+33+50+51+54+59
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1B3C and resi 14 and name CA, 1B3C and resi 39 and name CA  # target=4.368633443260828 current=6.969877117179191
color yellow, pair_00
distance pair_01, 1B3C and resi 10 and name CA, 1B3C and resi 56 and name CA  # target=4.647636918307805 current=7.107022475309723
color yellow, pair_01
distance pair_02, 1B3C and resi 1 and name CA, 1B3C and resi 48 and name CA  # target=4.028908588844348 current=6.184500879086274
color yellow, pair_02
distance pair_03, 1B3C and resi 3 and name CA, 1B3C and resi 46 and name CA  # target=4.028908588844348 current=6.023314108159419
color yellow, pair_03
distance pair_04, 1B3C and resi 19 and name CA, 1B3C and resi 60 and name CA  # target=27.32336847671364 current=29.0584479113825
color yellow, pair_04
distance pair_05, 1B3C and resi 21 and name CA, 1B3C and resi 60 and name CA  # target=27.24611915793037 current=28.82619372215778
color yellow, pair_05
distance pair_06, 1B3C and resi 4 and name CA, 1B3C and resi 60 and name CA  # target=15.922166578034611 current=14.561714720836486
color yellow, pair_06
distance pair_07, 1B3C and resi 2 and name CA, 1B3C and resi 60 and name CA  # target=16.719253580376744 current=15.453897813311418
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
