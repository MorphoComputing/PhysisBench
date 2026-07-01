# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.7064086675902232

load 1JBL.pdb, 1JBL
bg_color white
hide everything, 1JBL
show cartoon, 1JBL
color grey80, 1JBL
set cartoon_transparency, 0.1

select worst_residues, 1JBL and resi 1+2+3+4+6+7+8+9+11+12
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1JBL and resi 2 and name CA, 1JBL and resi 10 and name CA  # target=4.915841153405197 current=3.962065557193284
color yellow, pair_00
distance pair_01, 1JBL and resi 1 and name CA, 1JBL and resi 10 and name CA  # target=6.252280630248196 current=5.8210743512836975
color yellow, pair_01
distance pair_02, 1JBL and resi 1 and name CA, 1JBL and resi 12 and name CA  # target=6.890034719371309 current=7.274235291875537
color yellow, pair_02
distance pair_03, 1JBL and resi 3 and name CA, 1JBL and resi 12 and name CA  # target=11.363055629864256 current=11.745008305831405
color yellow, pair_03
distance pair_04, 1JBL and resi 2 and name CA, 1JBL and resi 12 and name CA  # target=8.309861614903724 current=8.647617173598993
color yellow, pair_04
distance pair_05, 1JBL and resi 1 and name CA, 1JBL and resi 9 and name CA  # target=8.478610296934006 current=8.803137024701243
color yellow, pair_05
distance pair_06, 1JBL and resi 2 and name CA, 1JBL and resi 11 and name CA  # target=6.343838535215126 current=6.036025442604929
color yellow, pair_06
distance pair_07, 1JBL and resi 4 and name CA, 1JBL and resi 12 and name CA  # target=14.496055774402732 current=14.73125351565936
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
