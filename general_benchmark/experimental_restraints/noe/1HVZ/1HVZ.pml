# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.288507844748808

load 1HVZ.pdb, 1HVZ
bg_color white
hide everything, 1HVZ
show cartoon, 1HVZ
color grey80, 1HVZ
set cartoon_transparency, 0.1

select worst_residues, 1HVZ and resi 1+2+3+4+7+8+9+10+13+16
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1HVZ and resi 4 and name CA, 1HVZ and resi 13 and name CA  # target=5.212492862963047 current=4.837963794171456
color yellow, pair_00
distance pair_01, 1HVZ and resi 1 and name CA, 1HVZ and resi 16 and name CA  # target=4.028908588844348 current=4.289555170010699
color yellow, pair_01
distance pair_02, 1HVZ and resi 3 and name CA, 1HVZ and resi 14 and name CA  # target=5.212492862963047 current=5.4072476387236135
color yellow, pair_02
distance pair_03, 1HVZ and resi 2 and name CA, 1HVZ and resi 16 and name CA  # target=5.212492862963047 current=5.047653231728958
color yellow, pair_03
distance pair_04, 1HVZ and resi 2 and name CA, 1HVZ and resi 15 and name CA  # target=5.212492862963047 current=5.108221778797381
color yellow, pair_04
distance pair_05, 1HVZ and resi 5 and name CA, 1HVZ and resi 13 and name CA  # target=5.212492862963047 current=5.134480207278164
color yellow, pair_05
distance pair_06, 1HVZ and resi 4 and name CA, 1HVZ and resi 14 and name CA  # target=5.212492862963047 current=5.275314036989068
color yellow, pair_06

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
