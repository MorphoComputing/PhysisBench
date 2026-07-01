# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 11.20748027686275

load 4PTI.pdb, 4PTI
bg_color white
hide everything, 4PTI
show cartoon, 4PTI
color grey80, 4PTI
set cartoon_transparency, 0.1

select worst_residues, 4PTI and resi 2+5+15+32+33+34+35+36+39+56
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 4PTI and resi 22+36+41+76+132+331
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 4PTI and resi 27 and name CA, 4PTI and resi 39 and name CA  # target=27.4960239707206 current=7.717786716633072
color yellow, pair_00
distance pair_01, 4PTI and resi 27 and name CA, 4PTI and resi 40 and name CA  # target=27.499896257588574 current=8.731309423999283
color yellow, pair_01
distance pair_02, 4PTI and resi 22 and name CA, 4PTI and resi 36 and name CA  # target=27.49143199665152 current=10.56931649759382
color yellow, pair_02
distance pair_03, 4PTI and resi 31 and name CA, 4PTI and resi 41 and name CA  # target=25.108498165212833 current=8.1942447467286
color yellow, pair_03
distance pair_04, 4PTI and resi 27 and name CA, 4PTI and resi 35 and name CA  # target=27.4661373969045 current=10.661298165558039
color yellow, pair_04
distance pair_05, 4PTI and resi 24 and name CA, 4PTI and resi 39 and name CA  # target=27.499210067263174 current=10.71491108293131
color yellow, pair_05
distance pair_06, 4PTI and resi 27 and name CA, 4PTI and resi 36 and name CA  # target=27.498611698234182 current=10.942473944995273
color yellow, pair_06
distance pair_07, 4PTI and resi 32 and name CA, 4PTI and resi 41 and name CA  # target=22.60494875792813 current=6.337819311592595
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
