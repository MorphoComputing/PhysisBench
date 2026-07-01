# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.05331601720196334

load 1ENH.pdb, 1ENH
bg_color white
hide everything, 1ENH
show cartoon, 1ENH
color grey80, 1ENH
set cartoon_transparency, 0.1

select worst_residues, 1ENH and resi 1+5+6+18+20+26+32+40+50+52
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1ENH and resi 1 and name CA, 1ENH and resi 20 and name CA  # target=23.779364778444844 current=24.35675826140377
color yellow, pair_00
distance pair_01, 1ENH and resi 1 and name CA, 1ENH and resi 18 and name CA  # target=23.737439094375652 current=24.29632159250026
color yellow, pair_01
distance pair_02, 1ENH and resi 36 and name CA, 1ENH and resi 52 and name CA  # target=23.623446506642086 current=24.121632614663806
color yellow, pair_02
distance pair_03, 1ENH and resi 7 and name CA, 1ENH and resi 25 and name CA  # target=23.28085434756635 current=23.75261896501456
color yellow, pair_03
distance pair_04, 1ENH and resi 26 and name CA, 1ENH and resi 52 and name CA  # target=23.50362158195231 current=23.96865366889863
color yellow, pair_04
distance pair_05, 1ENH and resi 34 and name CA, 1ENH and resi 52 and name CA  # target=24.48014633560257 current=24.85492654131363
color yellow, pair_05
distance pair_06, 1ENH and resi 7 and name CA, 1ENH and resi 24 and name CA  # target=23.086563679044183 current=23.45796069160882
color yellow, pair_06
distance pair_07, 1ENH and resi 29 and name CA, 1ENH and resi 52 and name CA  # target=23.02283130350746 current=23.348964203451832
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
