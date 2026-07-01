# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.5875424421181785

load 2KNM.pdb, 2KNM
bg_color white
hide everything, 2KNM
show cartoon, 2KNM
color grey80, 2KNM
set cartoon_transparency, 0.1

select worst_residues, 2KNM and resi 1+4+5+6+9+15+16+22+23+28
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2KNM and resi 6+24
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2KNM and resi 5 and name CA, 2KNM and resi 13 and name CA  # target=3.807615173945761 current=7.318214417757771
color yellow, pair_00
distance pair_01, 2KNM and resi 5 and name CA, 2KNM and resi 14 and name CA  # target=3.807615173945761 current=6.861741915559509
color yellow, pair_01
distance pair_02, 2KNM and resi 1 and name CA, 2KNM and resi 28 and name CA  # target=3.711689012941624 current=6.068990700130789
color yellow, pair_02
distance pair_03, 2KNM and resi 2 and name CA, 2KNM and resi 28 and name CA  # target=4.298255009038828 current=5.980740950184757
color yellow, pair_03
distance pair_04, 2KNM and resi 3 and name CA, 2KNM and resi 26 and name CA  # target=3.807615173945761 current=5.465451209010927
color yellow, pair_04
distance pair_05, 2KNM and resi 9 and name CA, 2KNM and resi 21 and name CA  # target=11.946200314462017 current=10.374776557684303
color yellow, pair_05
distance pair_06, 2KNM and resi 9 and name CA, 2KNM and resi 20 and name CA  # target=14.98052180652072 current=13.425690368910745
color yellow, pair_06
distance pair_07, 2KNM and resi 3 and name CA, 2KNM and resi 27 and name CA  # target=3.6850847653642034 current=5.239861695101022
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
