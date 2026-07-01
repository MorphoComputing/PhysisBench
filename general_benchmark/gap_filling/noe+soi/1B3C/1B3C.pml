# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 7.075055842569293

load 1B3C.pdb, 1B3C
bg_color white
hide everything, 1B3C
show cartoon, 1B3C
color grey80, 1B3C
set cartoon_transparency, 0.1

select worst_residues, 1B3C and resi 1+2+7+15+22+31+51+52+60+61
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1B3C and resi 4+10+18+52+56+62
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1B3C and resi 1 and name CA, 1B3C and resi 62 and name CA  # target=24.66353430433161 current=16.498260388575744
color yellow, pair_00
distance pair_01, 1B3C and resi 1 and name CA, 1B3C and resi 47 and name CA  # target=4.028908588844348 current=11.802174307503524
color yellow, pair_01
distance pair_02, 1B3C and resi 36 and name CA, 1B3C and resi 47 and name CA  # target=3.9693779294802645 current=10.011730151673365
color yellow, pair_02
distance pair_03, 1B3C and resi 4 and name CA, 1B3C and resi 27 and name CA  # target=6.154433278656084 current=12.091618538329591
color yellow, pair_03
distance pair_04, 1B3C and resi 17 and name CA, 1B3C and resi 41 and name CA  # target=5.1756846552692375 current=10.725301527132462
color yellow, pair_04
distance pair_05, 1B3C and resi 2 and name CA, 1B3C and resi 47 and name CA  # target=4.893392851656878 current=10.032971311032636
color yellow, pair_05
distance pair_06, 1B3C and resi 13 and name CA, 1B3C and resi 43 and name CA  # target=4.028908588844348 current=9.129606327071144
color yellow, pair_06
distance pair_07, 1B3C and resi 3 and name CA, 1B3C and resi 46 and name CA  # target=4.028908588844348 current=9.099534935133297
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
