# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.5166785549767905

load 1L2Y.pdb, 1L2Y
bg_color white
hide everything, 1L2Y
show cartoon, 1L2Y
color grey80, 1L2Y
set cartoon_transparency, 0.1

select worst_residues, 1L2Y and resi 1+5+6+9+11+12+13+14+15+17
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1L2Y and resi 4 and name CA, 1L2Y and resi 16 and name CA  # target=12.105356942292602 current=10.971693466720158
color yellow, pair_00
distance pair_01, 1L2Y and resi 2 and name CA, 1L2Y and resi 18 and name CA  # target=6.331782083427597 current=5.3554849879706
color yellow, pair_01
distance pair_02, 1L2Y and resi 1 and name CA, 1L2Y and resi 12 and name CA  # target=16.539793205384598 current=15.800383166172912
color yellow, pair_02
distance pair_03, 1L2Y and resi 5 and name CA, 1L2Y and resi 14 and name CA  # target=10.503176693879002 current=10.95751494184337
color yellow, pair_03
distance pair_04, 1L2Y and resi 7 and name CA, 1L2Y and resi 16 and name CA  # target=13.242634762995467 current=12.84946641419425
color yellow, pair_04
distance pair_05, 1L2Y and resi 5 and name CA, 1L2Y and resi 17 and name CA  # target=6.705760020618665 current=6.362914492790265
color yellow, pair_05
distance pair_06, 1L2Y and resi 6 and name CA, 1L2Y and resi 18 and name CA  # target=10.155185148560939 current=9.950341869665277
color yellow, pair_06
distance pair_07, 1L2Y and resi 8 and name CA, 1L2Y and resi 18 and name CA  # target=12.675123246295298 current=12.500228050711609
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
