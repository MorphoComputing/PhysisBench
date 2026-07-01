# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 8.718502961840535

load 2HIU.pdb, 2HIU
bg_color white
hide everything, 2HIU
show cartoon, 2HIU
color grey80, 2HIU
set cartoon_transparency, 0.1

select worst_residues, 2HIU and resi 3+4+5+7+8+9+13+17+18+19
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2HIU and resi 91+166
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2HIU and resi 6 and name CA, 2HIU and resi 25 and name CA  # target=17.146558355740467 current=6.122953507535813
color yellow, pair_00
distance pair_01, 2HIU and resi 25 and name CA, 2HIU and resi 43 and name CA  # target=17.758203349131826 current=7.559233203733487
color yellow, pair_01
distance pair_02, 2HIU and resi 25 and name CA, 2HIU and resi 44 and name CA  # target=16.344920139605193 current=6.572708193755777
color yellow, pair_02
distance pair_03, 2HIU and resi 19 and name CA, 2HIU and resi 37 and name CA  # target=17.65835025307014 current=7.955535648603415
color yellow, pair_03
distance pair_04, 2HIU and resi 25 and name CA, 2HIU and resi 42 and name CA  # target=16.42020203789778 current=7.23035233251619
color yellow, pair_04
distance pair_05, 2HIU and resi 18 and name CA, 2HIU and resi 46 and name CA  # target=18.286662136298343 current=9.544710513158861
color yellow, pair_05
distance pair_06, 2HIU and resi 25 and name CA, 2HIU and resi 45 and name CA  # target=17.75902637737752 current=9.472429574210722
color yellow, pair_06
distance pair_07, 2HIU and resi 2 and name CA, 2HIU and resi 46 and name CA  # target=20.441407314169968 current=12.220215167786424
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
