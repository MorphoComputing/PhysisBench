# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.9437085618350338

load 1UBQ.pdb, 1UBQ
bg_color white
hide everything, 1UBQ
show cartoon, 1UBQ
color grey80, 1UBQ
set cartoon_transparency, 0.1

select worst_residues, 1UBQ and resi 7+8+9+17+38+46+47+72+73+74
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1UBQ and resi 62 and name CA, 1UBQ and resi 73 and name CA  # target=27.442314019191883 current=31.88675177550438
color yellow, pair_00
distance pair_01, 1UBQ and resi 61 and name CA, 1UBQ and resi 73 and name CA  # target=27.393623597134038 current=30.86649200492814
color yellow, pair_01
distance pair_02, 1UBQ and resi 63 and name CA, 1UBQ and resi 73 and name CA  # target=27.366384958001465 current=30.55413836601833
color yellow, pair_02
distance pair_03, 1UBQ and resi 62 and name CA, 1UBQ and resi 74 and name CA  # target=27.355208149355224 current=30.50772494983778
color yellow, pair_03
distance pair_04, 1UBQ and resi 18 and name CA, 1UBQ and resi 73 and name CA  # target=27.3326915507553 current=30.148458617586083
color yellow, pair_04
distance pair_05, 1UBQ and resi 1 and name CA, 1UBQ and resi 73 and name CA  # target=27.323790213173517 current=30.113376522682117
color yellow, pair_05
distance pair_06, 1UBQ and resi 17 and name CA, 1UBQ and resi 73 and name CA  # target=27.31716466512758 current=30.040787148876692
color yellow, pair_06
distance pair_07, 1UBQ and resi 19 and name CA, 1UBQ and resi 73 and name CA  # target=27.26697967697911 current=29.721439130138283
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
