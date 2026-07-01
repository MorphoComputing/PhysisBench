# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 8.479069815895443

load 1KX6.pdb, 1KX6
bg_color white
hide everything, 1KX6
show cartoon, 1KX6
color grey80, 1KX6
set cartoon_transparency, 0.1

select worst_residues, 1KX6 and resi 1+5+10+20+21+23+24+25+26+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1KX6 and resi 1 and name CA, 1KX6 and resi 27 and name CA  # target=12.165208914036542 current=21.360577014928044
color yellow, pair_00

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
