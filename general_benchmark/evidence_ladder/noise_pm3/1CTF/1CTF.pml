# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.392967388849536

load 1CTF.pdb, 1CTF
bg_color white
hide everything, 1CTF
show cartoon, 1CTF
color grey80, 1CTF
set cartoon_transparency, 0.1

select worst_residues, 1CTF and resi 1+4+9+28+30+34+46+56+65+66
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1CTF and resi 12+19+41+150+261+495
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1CTF and resi 15 and name CA, 1CTF and resi 26 and name CA  # target=21.294904801563703 current=12.882653394226502
color yellow, pair_00
distance pair_01, 1CTF and resi 13 and name CA, 1CTF and resi 65 and name CA  # target=10.755743121423649 current=19.12863099744876
color yellow, pair_01
distance pair_02, 1CTF and resi 6 and name CA, 1CTF and resi 54 and name CA  # target=20.42943223750316 current=12.222954741810355
color yellow, pair_02
distance pair_03, 1CTF and resi 7 and name CA, 1CTF and resi 27 and name CA  # target=9.04803591322598 current=17.23524131263905
color yellow, pair_03
distance pair_04, 1CTF and resi 3 and name CA, 1CTF and resi 17 and name CA  # target=9.163398764898032 current=17.018605440752154
color yellow, pair_04
distance pair_05, 1CTF and resi 34 and name CA, 1CTF and resi 45 and name CA  # target=24.507060606427068 current=16.769548737771984
color yellow, pair_05
distance pair_06, 1CTF and resi 12 and name CA, 1CTF and resi 37 and name CA  # target=18.537457570712746 current=10.971166145941085
color yellow, pair_06
distance pair_07, 1CTF and resi 7 and name CA, 1CTF and resi 62 and name CA  # target=13.20155376855387 current=6.183891889985863
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
