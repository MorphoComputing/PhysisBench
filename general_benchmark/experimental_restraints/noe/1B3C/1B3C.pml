# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 8.321234638765084

load 1B3C.pdb, 1B3C
bg_color white
hide everything, 1B3C
show cartoon, 1B3C
color grey80, 1B3C
set cartoon_transparency, 0.1

select worst_residues, 1B3C and resi 15+16+17+18+19+21+25+40+41+42
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1B3C and resi 3+9+37
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1B3C and resi 1 and name CA, 1B3C and resi 46 and name CA  # target=4.893392851656878 current=12.612946707224726
color yellow, pair_00
distance pair_01, 1B3C and resi 19 and name CA, 1B3C and resi 38 and name CA  # target=4.893392851656878 current=11.693460684899884
color yellow, pair_01
distance pair_02, 1B3C and resi 4 and name CA, 1B3C and resi 27 and name CA  # target=6.154433278656084 current=12.214095257944983
color yellow, pair_02
distance pair_03, 1B3C and resi 24 and name CA, 1B3C and resi 37 and name CA  # target=4.893392851656878 current=10.307480623105103
color yellow, pair_03
distance pair_04, 1B3C and resi 2 and name CA, 1B3C and resi 46 and name CA  # target=3.9693779294802645 current=9.37993233242314
color yellow, pair_04
distance pair_05, 1B3C and resi 14 and name CA, 1B3C and resi 39 and name CA  # target=4.368633443260828 current=9.66770017515877
color yellow, pair_05
distance pair_06, 1B3C and resi 1 and name CA, 1B3C and resi 47 and name CA  # target=4.028908588844348 current=8.485991837262155
color yellow, pair_06
distance pair_07, 1B3C and resi 3 and name CA, 1B3C and resi 46 and name CA  # target=4.028908588844348 current=8.267694767414003
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
