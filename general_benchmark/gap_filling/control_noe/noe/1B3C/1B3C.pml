# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 6.8025498165394

load 1B3C.pdb, 1B3C
bg_color white
hide everything, 1B3C
show cartoon, 1B3C
color grey80, 1B3C
set cartoon_transparency, 0.1

select worst_residues, 1B3C and resi 1+7+8+15+19+30+48+60+61+62
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1B3C and resi 2+6
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1B3C and resi 10 and name CA, 1B3C and resi 56 and name CA  # target=4.647636918307805 current=9.407596368239249
color yellow, pair_00
distance pair_01, 1B3C and resi 27 and name CA, 1B3C and resi 46 and name CA  # target=4.368633443260828 current=8.693293632901284
color yellow, pair_01
distance pair_02, 1B3C and resi 4 and name CA, 1B3C and resi 27 and name CA  # target=6.154433278656084 current=10.33864588397889
color yellow, pair_02
distance pair_03, 1B3C and resi 1 and name CA, 1B3C and resi 48 and name CA  # target=4.028908588844348 current=8.109572295461964
color yellow, pair_03
distance pair_04, 1B3C and resi 1 and name CA, 1B3C and resi 46 and name CA  # target=4.893392851656878 current=8.72860882885712
color yellow, pair_04
distance pair_05, 1B3C and resi 20 and name CA, 1B3C and resi 39 and name CA  # target=4.893392851656878 current=8.585702485873108
color yellow, pair_05
distance pair_06, 1B3C and resi 2 and name CA, 1B3C and resi 46 and name CA  # target=3.9693779294802645 current=7.437307456967107
color yellow, pair_06
distance pair_07, 1B3C and resi 13 and name CA, 1B3C and resi 43 and name CA  # target=4.028908588844348 current=6.752298058234424
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
