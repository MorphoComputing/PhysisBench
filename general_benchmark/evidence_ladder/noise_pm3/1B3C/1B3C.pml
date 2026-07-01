# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.4389799646060517

load 1B3C.pdb, 1B3C
bg_color white
hide everything, 1B3C
show cartoon, 1B3C
color grey80, 1B3C
set cartoon_transparency, 0.1

select worst_residues, 1B3C and resi 3+6+16+17+18+19+21+37+41+42
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1B3C and resi 5+29+51+69+233+635
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1B3C and resi 18 and name CA, 1B3C and resi 41 and name CA  # target=18.970063194818767 current=7.372429938971154
color yellow, pair_00
distance pair_01, 1B3C and resi 4 and name CA, 1B3C and resi 26 and name CA  # target=17.227455733464133 current=7.053544341837526
color yellow, pair_01
distance pair_02, 1B3C and resi 34 and name CA, 1B3C and resi 48 and name CA  # target=13.547726830710523 current=3.907065229333978
color yellow, pair_02
distance pair_03, 1B3C and resi 24 and name CA, 1B3C and resi 42 and name CA  # target=18.26257743990699 current=9.452785642763757
color yellow, pair_03
distance pair_04, 1B3C and resi 32 and name CA, 1B3C and resi 51 and name CA  # target=20.037914577274186 current=11.372346692828176
color yellow, pair_04
distance pair_05, 1B3C and resi 20 and name CA, 1B3C and resi 40 and name CA  # target=17.04809282096871 current=8.992267163780124
color yellow, pair_05
distance pair_06, 1B3C and resi 23 and name CA, 1B3C and resi 58 and name CA  # target=8.822969980840048 current=16.77775802903634
color yellow, pair_06
distance pair_07, 1B3C and resi 24 and name CA, 1B3C and resi 38 and name CA  # target=12.001577763198528 current=4.36235493615764
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
