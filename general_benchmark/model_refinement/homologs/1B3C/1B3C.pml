# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.395844972889786

load 1B3C.pdb, 1B3C
bg_color white
hide everything, 1B3C
show cartoon, 1B3C
color grey80, 1B3C
set cartoon_transparency, 0.1

select worst_residues, 1B3C and resi 1+2+3+4+5+6+8+11+15+62
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1B3C and resi 268+600
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1B3C and resi 1 and name CA, 1B3C and resi 57 and name CA  # target=27.498732610169824 current=3.2990858935124656
color yellow, pair_00
distance pair_01, 1B3C and resi 1 and name CA, 1B3C and resi 55 and name CA  # target=27.495715891600803 current=4.133616980422347
color yellow, pair_01
distance pair_02, 1B3C and resi 1 and name CA, 1B3C and resi 56 and name CA  # target=27.497095248424223 current=4.387760997994187
color yellow, pair_02
distance pair_03, 1B3C and resi 1 and name CA, 1B3C and resi 53 and name CA  # target=27.496011474747924 current=8.708320888700314
color yellow, pair_03
distance pair_04, 1B3C and resi 2 and name CA, 1B3C and resi 56 and name CA  # target=27.4951775518837 current=9.725155547672108
color yellow, pair_04
distance pair_05, 1B3C and resi 3 and name CA, 1B3C and resi 56 and name CA  # target=27.49441139156355 current=9.869288287651253
color yellow, pair_05
distance pair_06, 1B3C and resi 1 and name CA, 1B3C and resi 52 and name CA  # target=27.497656779125425 current=10.065312135038882
color yellow, pair_06
distance pair_07, 1B3C and resi 1 and name CA, 1B3C and resi 12 and name CA  # target=27.49899815882319 current=10.709297709459685
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
