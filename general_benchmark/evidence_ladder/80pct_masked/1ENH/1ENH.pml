# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.038384473706536

load 1ENH.pdb, 1ENH
bg_color white
hide everything, 1ENH
show cartoon, 1ENH
color grey80, 1ENH
set cartoon_transparency, 0.1

select worst_residues, 1ENH and resi 6+19+21+22+26+29+30+33+34+40
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1ENH and resi 4+6+26+27+36
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1ENH and resi 1 and name CA, 1ENH and resi 33 and name CA  # target=19.99856012553707 current=8.667626333441536
color yellow, pair_00
distance pair_01, 1ENH and resi 12 and name CA, 1ENH and resi 22 and name CA  # target=14.971077868719545 current=6.077161290702411
color yellow, pair_01
distance pair_02, 1ENH and resi 9 and name CA, 1ENH and resi 22 and name CA  # target=17.603998066288806 current=9.13823035938446
color yellow, pair_02
distance pair_03, 1ENH and resi 33 and name CA, 1ENH and resi 44 and name CA  # target=16.411687661565406 current=8.60536079159922
color yellow, pair_03
distance pair_04, 1ENH and resi 22 and name CA, 1ENH and resi 33 and name CA  # target=17.901578686790444 current=10.321495105494115
color yellow, pair_04
distance pair_05, 1ENH and resi 34 and name CA, 1ENH and resi 44 and name CA  # target=17.113495676742264 current=10.60467201412229
color yellow, pair_05
distance pair_06, 1ENH and resi 21 and name CA, 1ENH and resi 43 and name CA  # target=10.699281464297469 current=4.226513636239185
color yellow, pair_06
distance pair_07, 1ENH and resi 21 and name CA, 1ENH and resi 40 and name CA  # target=15.673136879144668 current=9.24973735966518
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
