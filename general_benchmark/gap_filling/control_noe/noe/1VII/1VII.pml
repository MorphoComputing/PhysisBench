# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.9137493615812584

load 1VII.pdb, 1VII
bg_color white
hide everything, 1VII
show cartoon, 1VII
color grey80, 1VII
set cartoon_transparency, 0.1

select worst_residues, 1VII and resi 5+11+12+16+21+22+23+25+26+34
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1VII and resi 14+32
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1VII and resi 20 and name CA, 1VII and resi 28 and name CA  # target=5.212492862963047 current=9.152632153478505
color yellow, pair_00
distance pair_01, 1VII and resi 17 and name CA, 1VII and resi 32 and name CA  # target=5.790717228239924 current=9.670538659426352
color yellow, pair_01
distance pair_02, 1VII and resi 10 and name CA, 1VII and resi 33 and name CA  # target=5.790717228239924 current=8.910894132310657
color yellow, pair_02
distance pair_03, 1VII and resi 17 and name CA, 1VII and resi 29 and name CA  # target=5.212492862963047 current=7.855838310820172
color yellow, pair_03
distance pair_04, 1VII and resi 17 and name CA, 1VII and resi 28 and name CA  # target=4.893392851656878 current=7.223193114657294
color yellow, pair_04
distance pair_05, 1VII and resi 10 and name CA, 1VII and resi 29 and name CA  # target=4.893392851656878 current=7.173101915484007
color yellow, pair_05
distance pair_06, 1VII and resi 17 and name CA, 1VII and resi 25 and name CA  # target=4.647636918307805 current=6.4491390468354375
color yellow, pair_06
distance pair_07, 1VII and resi 1 and name CA, 1VII and resi 14 and name CA  # target=5.212492862963047 current=6.263283623695545
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
