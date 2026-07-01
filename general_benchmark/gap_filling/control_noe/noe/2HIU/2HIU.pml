# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 7.049719557060037

load 2HIU.pdb, 2HIU
bg_color white
hide everything, 2HIU
show cartoon, 2HIU
color grey80, 2HIU
set cartoon_transparency, 0.1

select worst_residues, 2HIU and resi 7+13+17+20+21+39+40+43+46+47
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2HIU and resi 5
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2HIU and resi 25 and name CA, 2HIU and resi 45 and name CA  # target=4.507975919933174 current=14.208176413426566
color yellow, pair_00
distance pair_01, 2HIU and resi 25 and name CA, 2HIU and resi 44 and name CA  # target=4.303568016043911 current=13.411741132439122
color yellow, pair_01
distance pair_02, 2HIU and resi 25 and name CA, 2HIU and resi 46 and name CA  # target=4.502374505101967 current=11.690011795188845
color yellow, pair_02
distance pair_03, 2HIU and resi 20 and name CA, 2HIU and resi 37 and name CA  # target=4.85760391055279 current=8.242269641843107
color yellow, pair_03
distance pair_04, 2HIU and resi 24 and name CA, 2HIU and resi 45 and name CA  # target=4.541917735763398 current=7.651141158040479
color yellow, pair_04
distance pair_05, 2HIU and resi 28 and name CA, 2HIU and resi 43 and name CA  # target=5.1756846552692375 current=7.636116802729198
color yellow, pair_05
distance pair_06, 2HIU and resi 28 and name CA, 2HIU and resi 44 and name CA  # target=5.071063307555523 current=6.109804458628734
color yellow, pair_06
distance pair_07, 2HIU and resi 28 and name CA, 2HIU and resi 42 and name CA  # target=5.713081305182573 current=6.270334291388973
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
