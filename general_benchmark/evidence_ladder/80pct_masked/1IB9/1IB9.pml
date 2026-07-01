# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.774235764016238

load 1IB9.pdb, 1IB9
bg_color white
hide everything, 1IB9
show cartoon, 1IB9
color grey80, 1IB9
set cartoon_transparency, 0.1

select worst_residues, 1IB9 and resi 2+3+11+15+16+17+18+29+30+31
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1IB9 and resi 8+12
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1IB9 and resi 3 and name CA, 1IB9 and resi 13 and name CA  # target=21.727041344483222 current=13.678492592353958
color yellow, pair_00
distance pair_01, 1IB9 and resi 9 and name CA, 1IB9 and resi 18 and name CA  # target=15.281566330605626 current=9.294315578352737
color yellow, pair_01
distance pair_02, 1IB9 and resi 5 and name CA, 1IB9 and resi 14 and name CA  # target=14.334242802804232 current=9.514206761508307
color yellow, pair_02
distance pair_03, 1IB9 and resi 2 and name CA, 1IB9 and resi 10 and name CA  # target=15.26222075197511 current=10.634171532088933
color yellow, pair_03
distance pair_04, 1IB9 and resi 11 and name CA, 1IB9 and resi 22 and name CA  # target=13.426288734697533 current=9.12154517197762
color yellow, pair_04
distance pair_05, 1IB9 and resi 22 and name CA, 1IB9 and resi 30 and name CA  # target=16.426090093151966 current=12.152494735159248
color yellow, pair_05
distance pair_06, 1IB9 and resi 6 and name CA, 1IB9 and resi 31 and name CA  # target=13.875921585236984 current=9.880709788341747
color yellow, pair_06
distance pair_07, 1IB9 and resi 13 and name CA, 1IB9 and resi 21 and name CA  # target=10.228862363150167 current=6.353226594528556
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
