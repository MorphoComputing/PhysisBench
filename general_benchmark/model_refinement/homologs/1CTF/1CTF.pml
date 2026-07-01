# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 10.205878927881681

load 1CTF.pdb, 1CTF
bg_color white
hide everything, 1CTF
show cartoon, 1CTF
color grey80, 1CTF
set cartoon_transparency, 0.1

select worst_residues, 1CTF and resi 1+2+21+24+35+36+37+38+60+62
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1CTF and resi 12+46+65+144+372+2065
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1CTF and resi 36 and name CA, 1CTF and resi 46 and name CA  # target=27.114718137307474 current=5.345288819031667
color yellow, pair_00
distance pair_01, 1CTF and resi 28 and name CA, 1CTF and resi 36 and name CA  # target=26.519391891581908 current=7.284521368295035
color yellow, pair_01
distance pair_02, 1CTF and resi 7 and name CA, 1CTF and resi 59 and name CA  # target=23.775520673783248 current=4.65099500052493
color yellow, pair_02
distance pair_03, 1CTF and resi 36 and name CA, 1CTF and resi 56 and name CA  # target=26.783153923762505 current=7.876376796780839
color yellow, pair_03
distance pair_04, 1CTF and resi 8 and name CA, 1CTF and resi 59 and name CA  # target=26.328526829861236 current=7.605011688107457
color yellow, pair_04
distance pair_05, 1CTF and resi 36 and name CA, 1CTF and resi 47 and name CA  # target=27.448403523298758 current=9.716300346030103
color yellow, pair_05
distance pair_06, 1CTF and resi 10 and name CA, 1CTF and resi 59 and name CA  # target=27.31775867262154 current=9.703991851131393
color yellow, pair_06
distance pair_07, 1CTF and resi 6 and name CA, 1CTF and resi 61 and name CA  # target=26.614241466450594 current=9.290047106295305
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
