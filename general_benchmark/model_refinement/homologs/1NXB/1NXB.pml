# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 7.410850799360973

load 1NXB.pdb, 1NXB
bg_color white
hide everything, 1NXB
show cartoon, 1NXB
color grey80, 1NXB
set cartoon_transparency, 0.1

select worst_residues, 1NXB and resi 17+18+19+20+34+54+55+56+58+59
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1NXB and resi 4+32+37
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1NXB and resi 3 and name CA, 1NXB and resi 31 and name CA  # target=24.525607428314522 current=19.990964339662984
color yellow, pair_00
distance pair_01, 1NXB and resi 3 and name CA, 1NXB and resi 32 and name CA  # target=22.54891935732696 current=18.115641909546778
color yellow, pair_01
distance pair_02, 1NXB and resi 33 and name CA, 1NXB and resi 52 and name CA  # target=17.507139058782556 current=13.1152747135135
color yellow, pair_02
distance pair_03, 1NXB and resi 32 and name CA, 1NXB and resi 60 and name CA  # target=20.7626847109292 current=16.383236064906697
color yellow, pair_03
distance pair_04, 1NXB and resi 30 and name CA, 1NXB and resi 51 and name CA  # target=15.465095899020262 current=11.238228071153515
color yellow, pair_04
distance pair_05, 1NXB and resi 31 and name CA, 1NXB and resi 60 and name CA  # target=22.484817897174825 current=18.303705889809073
color yellow, pair_05
distance pair_06, 1NXB and resi 33 and name CA, 1NXB and resi 60 and name CA  # target=17.541384046643167 current=13.440005780130694
color yellow, pair_06
distance pair_07, 1NXB and resi 30 and name CA, 1NXB and resi 52 and name CA  # target=18.571660614708634 current=14.487106282363838
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
