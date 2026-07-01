# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.178916278560377

load 1HVZ.pdb, 1HVZ
bg_color white
hide everything, 1HVZ
show cartoon, 1HVZ
color grey80, 1HVZ
set cartoon_transparency, 0.1

select worst_residues, 1HVZ and resi 1+7+8+9+10+12+13+14+15+16
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1HVZ and resi 1 and name CA, 1HVZ and resi 16 and name CA  # target=4.028908588844348 current=5.8709602808025085
color yellow, pair_00
distance pair_01, 1HVZ and resi 4 and name CA, 1HVZ and resi 13 and name CA  # target=5.526827568351721 current=4.316730527124087
color yellow, pair_01
distance pair_02, 1HVZ and resi 4 and name CA, 1HVZ and resi 14 and name CA  # target=5.212492862963047 current=6.002517551382739
color yellow, pair_02
distance pair_03, 1HVZ and resi 3 and name CA, 1HVZ and resi 14 and name CA  # target=5.212492862963047 current=5.834802704067184
color yellow, pair_03
distance pair_04, 1HVZ and resi 2 and name CA, 1HVZ and resi 15 and name CA  # target=5.526827568351721 current=4.956122345421139
color yellow, pair_04
distance pair_05, 1HVZ and resi 2 and name CA, 1HVZ and resi 16 and name CA  # target=5.212492862963047 current=5.6217985011785565
color yellow, pair_05
distance pair_06, 1HVZ and resi 5 and name CA, 1HVZ and resi 13 and name CA  # target=5.212492862963047 current=4.851180906699838
color yellow, pair_06

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
