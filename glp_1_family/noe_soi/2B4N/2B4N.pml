# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 7.45666484880322

load 2B4N.pdb, 2B4N
bg_color white
hide everything, 2B4N
show cartoon, 2B4N
color grey80, 2B4N
set cartoon_transparency, 0.1

select worst_residues, 2B4N and resi 1+25+28+29+32+33+34+38+39+40
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2B4N and resi 26+250
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2B4N and resi 1 and name CA, 2B4N and resi 40 and name CA  # target=21.535217588398204 current=39.75099389959704
color yellow, pair_00

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
