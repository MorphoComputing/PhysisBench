# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 7.054539087990983

load 1JRJ.pdb, 1JRJ
bg_color white
hide everything, 1JRJ
show cartoon, 1JRJ
color grey80, 1JRJ
set cartoon_transparency, 0.1

select worst_residues, 1JRJ and resi 1+8+17+20+28+29+31+32+33+37
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1JRJ and resi 6
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1JRJ and resi 21 and name CA, 1JRJ and resi 37 and name CA  # target=5.772031158468575 current=7.056325956056277
color yellow, pair_00
distance pair_01, 1JRJ and resi 24 and name CA, 1JRJ and resi 37 and name CA  # target=7.2145919427095455 current=6.2733800671487465
color yellow, pair_01
distance pair_02, 1JRJ and resi 21 and name CA, 1JRJ and resi 36 and name CA  # target=7.2145919427095455 current=7.909915389295774
color yellow, pair_02
distance pair_03, 1JRJ and resi 24 and name CA, 1JRJ and resi 34 and name CA  # target=6.128972277676497 current=6.429231710816011
color yellow, pair_03
distance pair_04, 1JRJ and resi 24 and name CA, 1JRJ and resi 36 and name CA  # target=5.772031158468575 current=5.55028234436385
color yellow, pair_04
distance pair_05, 1JRJ and resi 24 and name CA, 1JRJ and resi 35 and name CA  # target=6.128972277676497 current=6.1730786873362575
color yellow, pair_05

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
