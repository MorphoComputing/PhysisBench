# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 6.027554379523671

load 2HIU.pdb, 2HIU
bg_color white
hide everything, 2HIU
show cartoon, 2HIU
color grey80, 2HIU
set cartoon_transparency, 0.1

select worst_residues, 2HIU and resi 9+11+13+16+17+19+20+21+23+28
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2HIU and resi 4+26+34+37
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2HIU and resi 25 and name CA, 2HIU and resi 46 and name CA  # target=4.502374505101967 current=14.91310408622686
color yellow, pair_00
distance pair_01, 2HIU and resi 25 and name CA, 2HIU and resi 44 and name CA  # target=4.303568016043911 current=14.614591478927256
color yellow, pair_01
distance pair_02, 2HIU and resi 25 and name CA, 2HIU and resi 45 and name CA  # target=4.507975919933174 current=13.712492025567533
color yellow, pair_02
distance pair_03, 2HIU and resi 1 and name CA, 2HIU and resi 47 and name CA  # target=20.902293262270685 current=11.860227779378873
color yellow, pair_03
distance pair_04, 2HIU and resi 20 and name CA, 2HIU and resi 37 and name CA  # target=4.85760391055279 current=10.99640205591004
color yellow, pair_04
distance pair_05, 2HIU and resi 24 and name CA, 2HIU and resi 45 and name CA  # target=4.541917735763398 current=7.471118548737792
color yellow, pair_05
distance pair_06, 2HIU and resi 31 and name CA, 2HIU and resi 40 and name CA  # target=8.644613730501087 current=10.802089975148125
color yellow, pair_06
distance pair_07, 2HIU and resi 28 and name CA, 2HIU and resi 42 and name CA  # target=5.713081305182573 current=7.861715367939224
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
