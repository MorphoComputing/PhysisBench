# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.4700423783749144

load 2ACY.pdb, 2ACY
bg_color white
hide everything, 2ACY
show cartoon, 2ACY
color grey80, 2ACY
set cartoon_transparency, 0.1

select worst_residues, 2ACY and resi 1+2+3+15+18+42+46+58+71+84
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2ACY and resi 13+41+64+286+1142+1950
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2ACY and resi 37 and name CA, 2ACY and resi 92 and name CA  # target=15.496327670947045 current=5.791960715211463
color yellow, pair_00
distance pair_01, 2ACY and resi 53 and name CA, 2ACY and resi 88 and name CA  # target=18.375348867662353 current=9.386776197469446
color yellow, pair_01
distance pair_02, 2ACY and resi 11 and name CA, 2ACY and resi 58 and name CA  # target=7.897836881604353 current=16.80132397995423
color yellow, pair_02
distance pair_03, 2ACY and resi 2 and name CA, 2ACY and resi 60 and name CA  # target=21.092593963843427 current=12.634204509316088
color yellow, pair_03
distance pair_04, 2ACY and resi 38 and name CA, 2ACY and resi 51 and name CA  # target=19.743634835956914 current=11.2936893682629
color yellow, pair_04
distance pair_05, 2ACY and resi 6 and name CA, 2ACY and resi 36 and name CA  # target=17.93231484920032 current=9.509990818103619
color yellow, pair_05
distance pair_06, 2ACY and resi 42 and name CA, 2ACY and resi 54 and name CA  # target=20.486406549814333 current=28.74654328105254
color yellow, pair_06
distance pair_07, 2ACY and resi 22 and name CA, 2ACY and resi 93 and name CA  # target=18.32055102692267 current=10.089487702315376
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
