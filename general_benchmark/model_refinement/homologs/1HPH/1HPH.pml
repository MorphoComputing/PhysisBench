# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.704632070384139

load 1HPH.pdb, 1HPH
bg_color white
hide everything, 1HPH
show cartoon, 1HPH
color grey80, 1HPH
set cartoon_transparency, 0.1

select worst_residues, 1HPH and resi 1+2+3+7+8+12+13+14+34+35
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1HPH and resi 9 and name CA, 1HPH and resi 31 and name CA  # target=26.590809584126763 current=23.91273220706969
color yellow, pair_00
distance pair_01, 1HPH and resi 9 and name CA, 1HPH and resi 32 and name CA  # target=27.404384038203624 current=24.85126431556273
color yellow, pair_01
distance pair_02, 1HPH and resi 10 and name CA, 1HPH and resi 20 and name CA  # target=15.12721599495179 current=12.839875934242267
color yellow, pair_02
distance pair_03, 1HPH and resi 19 and name CA, 1HPH and resi 31 and name CA  # target=14.429985534717213 current=16.714235206010226
color yellow, pair_03
distance pair_04, 1HPH and resi 9 and name CA, 1HPH and resi 30 and name CA  # target=26.109014284643095 current=23.91798319842731
color yellow, pair_04
distance pair_05, 1HPH and resi 22 and name CA, 1HPH and resi 31 and name CA  # target=11.418810095981692 current=13.52818611656452
color yellow, pair_05
distance pair_06, 1HPH and resi 1 and name CA, 1HPH and resi 10 and name CA  # target=15.878622181783408 current=13.935566017089867
color yellow, pair_06
distance pair_07, 1HPH and resi 10 and name CA, 1HPH and resi 24 and name CA  # target=19.350848057097444 current=17.45851043686061
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
