# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 7.828095146822857

load 1D0R.pdb, 1D0R
bg_color white
hide everything, 1D0R
show cartoon, 1D0R
color grey80, 1D0R
set cartoon_transparency, 0.1

select worst_residues, 1D0R and resi 6+7+17+18+23+24+25+26+27+28
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1D0R and resi 6+19
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1D0R and resi 1 and name CA, 1D0R and resi 28 and name CA  # target=15.058823715744152 current=16.84642314506877
color yellow, pair_00

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
