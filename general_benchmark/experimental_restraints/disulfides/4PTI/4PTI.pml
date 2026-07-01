# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 9.105999963627609

load 4PTI.pdb, 4PTI
bg_color white
hide everything, 4PTI
show cartoon, 4PTI
color grey80, 4PTI
set cartoon_transparency, 0.1

select worst_residues, 4PTI and resi 12+13+14+15+16+17+18+24+25+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 4PTI and resi 29 and name CA, 4PTI and resi 50 and name CA  # target=5.526827568351721 current=6.805497255428369
color yellow, pair_00
distance pair_01, 4PTI and resi 13 and name CA, 4PTI and resi 37 and name CA  # target=5.526827568351721 current=6.283874517986725
color yellow, pair_01
distance pair_02, 4PTI and resi 4 and name CA, 4PTI and resi 54 and name CA  # target=5.526827568351721 current=5.84462459866633
color yellow, pair_02

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
