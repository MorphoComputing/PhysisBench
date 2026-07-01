# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS | CA RMSD: 0.05458192604313364

load 1CTF.pdb, 1CTF
bg_color white
hide everything, 1CTF
show cartoon, 1CTF
color grey80, 1CTF
set cartoon_transparency, 0.1

select worst_residues, 1CTF and resi 18+20+21+22+23+28+38+39+40+60
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1CTF and resi 10 and name CA, 1CTF and resi 46 and name CA  # target=27.495010393467883 current=29.3026184162245
color yellow, pair_00
distance pair_01, 1CTF and resi 28 and name CA, 1CTF and resi 47 and name CA  # target=27.487136538824252 current=28.70845425589153
color yellow, pair_01
distance pair_02, 1CTF and resi 10 and name CA, 1CTF and resi 44 and name CA  # target=27.476318564756276 current=28.412209531129356
color yellow, pair_02
distance pair_03, 1CTF and resi 10 and name CA, 1CTF and resi 47 and name CA  # target=27.463892794535933 current=28.19919014999508
color yellow, pair_03
distance pair_04, 1CTF and resi 28 and name CA, 1CTF and resi 48 and name CA  # target=27.46785348902766 current=28.170994259909822
color yellow, pair_04
distance pair_05, 1CTF and resi 14 and name CA, 1CTF and resi 46 and name CA  # target=23.915199676562125 current=24.609308469821304
color yellow, pair_05
distance pair_06, 1CTF and resi 14 and name CA, 1CTF and resi 44 and name CA  # target=23.91145886896314 current=24.58351708217485
color yellow, pair_06
distance pair_07, 1CTF and resi 11 and name CA, 1CTF and resi 48 and name CA  # target=23.869781313701665 current=24.540953815251772
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
