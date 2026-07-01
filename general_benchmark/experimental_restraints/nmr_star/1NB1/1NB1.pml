# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.518431585537013

load 1NB1.pdb, 1NB1
bg_color white
hide everything, 1NB1
show cartoon, 1NB1
color grey80, 1NB1
set cartoon_transparency, 0.1

select worst_residues, 1NB1 and resi 4+5+6+7+10+13+19+23+24+25
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1NB1 and resi 3
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1NB1 and resi 15 and name CA, 1NB1 and resi 24 and name CA  # target=4.03399379435194 current=8.531530917326918
color yellow, pair_00
distance pair_01, 1NB1 and resi 1 and name CA, 1NB1 and resi 22 and name CA  # target=3.8684697490113473 current=6.5100496577444655
color yellow, pair_01
distance pair_02, 1NB1 and resi 1 and name CA, 1NB1 and resi 15 and name CA  # target=4.828171047634252 current=7.1488065467978865
color yellow, pair_02
distance pair_03, 1NB1 and resi 2 and name CA, 1NB1 and resi 22 and name CA  # target=5.212492862963047 current=7.109292720740913
color yellow, pair_03
distance pair_04, 1NB1 and resi 2 and name CA, 1NB1 and resi 21 and name CA  # target=6.797588029865607 current=8.21390019894165
color yellow, pair_04
distance pair_05, 1NB1 and resi 8 and name CA, 1NB1 and resi 17 and name CA  # target=5.341583822382451 current=6.652227725829827
color yellow, pair_05
distance pair_06, 1NB1 and resi 6 and name CA, 1NB1 and resi 19 and name CA  # target=4.519226341626202 current=5.765539280597555
color yellow, pair_06
distance pair_07, 1NB1 and resi 5 and name CA, 1NB1 and resi 22 and name CA  # target=4.3412285601786795 current=3.2571881493794703
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
