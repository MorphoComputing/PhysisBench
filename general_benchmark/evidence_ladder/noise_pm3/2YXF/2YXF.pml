# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.1957407800942645

load 2YXF.pdb, 2YXF
bg_color white
hide everything, 2YXF
show cartoon, 2YXF
color grey80, 2YXF
set cartoon_transparency, 0.1

select worst_residues, 2YXF and resi 1+2+15+16+17+18+19+27+88+89
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2YXF and resi 32+46+88+380+903+2210
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2YXF and resi 56 and name CA, 2YXF and resi 96 and name CA  # target=17.001586756550136 current=26.757072679804306
color yellow, pair_00
distance pair_01, 2YXF and resi 32 and name CA, 2YXF and resi 57 and name CA  # target=19.401460430145477 current=10.089679290394693
color yellow, pair_01
distance pair_02, 2YXF and resi 49 and name CA, 2YXF and resi 70 and name CA  # target=17.33028973107673 current=8.175237146248698
color yellow, pair_02
distance pair_03, 2YXF and resi 7 and name CA, 2YXF and resi 87 and name CA  # target=16.505565139979954 current=7.386282418096187
color yellow, pair_03
distance pair_04, 2YXF and resi 6 and name CA, 2YXF and resi 88 and name CA  # target=17.036945542406517 current=8.209036822260972
color yellow, pair_04
distance pair_05, 2YXF and resi 35 and name CA, 2YXF and resi 87 and name CA  # target=17.45282847642009 current=9.200542983841057
color yellow, pair_05
distance pair_06, 2YXF and resi 40 and name CA, 2YXF and resi 71 and name CA  # target=19.957549465257877 current=11.731582526648332
color yellow, pair_06
distance pair_07, 2YXF and resi 40 and name CA, 2YXF and resi 49 and name CA  # target=18.456770635544853 current=10.244624848025294
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
