# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.1182714236685065

load 1YCC.pdb, 1YCC
bg_color white
hide everything, 1YCC
show cartoon, 1YCC
color grey80, 1YCC
set cartoon_transparency, 0.1

select worst_residues, 1YCC and resi 5+6+9+51+98+99+100+101+102+103
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1YCC and resi 10+94+103+164
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1YCC and resi 25 and name CA, 1YCC and resi 99 and name CA  # target=10.339030112381362 current=18.815124982490573
color yellow, pair_00
distance pair_01, 1YCC and resi 5 and name CA, 1YCC and resi 103 and name CA  # target=16.10570004965658 current=7.904861895113078
color yellow, pair_01
distance pair_02, 1YCC and resi 24 and name CA, 1YCC and resi 98 and name CA  # target=10.146107204135934 current=18.109427951181583
color yellow, pair_02
distance pair_03, 1YCC and resi 47 and name CA, 1YCC and resi 102 and name CA  # target=16.538561200809188 current=23.698713067623846
color yellow, pair_03
distance pair_04, 1YCC and resi 11 and name CA, 1YCC and resi 103 and name CA  # target=11.6846524616256 current=4.623258653692152
color yellow, pair_04
distance pair_05, 1YCC and resi 34 and name CA, 1YCC and resi 100 and name CA  # target=16.419144964695615 current=23.453266924380273
color yellow, pair_05
distance pair_06, 1YCC and resi 37 and name CA, 1YCC and resi 102 and name CA  # target=7.5497539264391555 current=14.40783189578909
color yellow, pair_06
distance pair_07, 1YCC and resi 34 and name CA, 1YCC and resi 101 and name CA  # target=17.56812674275551 current=24.38040590843603
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
