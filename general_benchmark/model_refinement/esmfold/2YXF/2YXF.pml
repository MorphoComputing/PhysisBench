# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.153127568876113

load 2YXF.pdb, 2YXF
bg_color white
hide everything, 2YXF
show cartoon, 2YXF
color grey80, 2YXF
set cartoon_transparency, 0.1

select worst_residues, 2YXF and resi 1+14+15+16+17+18+51+53+59+97
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2YXF and resi 2+19+20+61+75+166
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2YXF and resi 1 and name CA, 2YXF and resi 18 and name CA  # target=27.499972078812807 current=38.908527762863
color yellow, pair_00
distance pair_01, 2YXF and resi 1 and name CA, 2YXF and resi 19 and name CA  # target=27.499930390964234 current=38.90511463425488
color yellow, pair_01
distance pair_02, 2YXF and resi 58 and name CA, 2YXF and resi 75 and name CA  # target=27.49975111416443 current=38.75861395727904
color yellow, pair_02
distance pair_03, 2YXF and resi 59 and name CA, 2YXF and resi 75 and name CA  # target=27.499705433665017 current=38.3807684570457
color yellow, pair_03
distance pair_04, 2YXF and resi 2 and name CA, 2YXF and resi 19 and name CA  # target=27.499507802471797 current=38.32025766216184
color yellow, pair_04
distance pair_05, 2YXF and resi 2 and name CA, 2YXF and resi 18 and name CA  # target=27.499777087636566 current=38.14288563136598
color yellow, pair_05
distance pair_06, 2YXF and resi 60 and name CA, 2YXF and resi 75 and name CA  # target=27.49954933195442 current=38.062312247130734
color yellow, pair_06
distance pair_07, 2YXF and resi 58 and name CA, 2YXF and resi 74 and name CA  # target=27.499640644763872 current=37.48308379118982
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
