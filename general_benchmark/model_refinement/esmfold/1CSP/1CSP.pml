# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.9943648255110158

load 1CSP.pdb, 1CSP
bg_color white
hide everything, 1CSP
show cartoon, 1CSP
color grey80, 1CSP
set cartoon_transparency, 0.1

select worst_residues, 1CSP and resi 10+11+12+13+20+21+52+53+54+55
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1CSP and resi 21 and name CA, 1CSP and resi 36 and name CA  # target=27.40783165842769 current=30.408085088467292
color yellow, pair_00
distance pair_01, 1CSP and resi 21 and name CA, 1CSP and resi 35 and name CA  # target=27.377483264407953 current=30.049728021185217
color yellow, pair_01
distance pair_02, 1CSP and resi 21 and name CA, 1CSP and resi 37 and name CA  # target=27.23126457975782 current=29.192149426739793
color yellow, pair_02
distance pair_03, 1CSP and resi 22 and name CA, 1CSP and resi 36 and name CA  # target=27.196002068790442 current=28.774555696299043
color yellow, pair_03
distance pair_04, 1CSP and resi 22 and name CA, 1CSP and resi 35 and name CA  # target=27.106285298701273 current=28.43966887981354
color yellow, pair_04
distance pair_05, 1CSP and resi 11 and name CA, 1CSP and resi 21 and name CA  # target=26.9639741906471 current=28.216299307555232
color yellow, pair_05
distance pair_06, 1CSP and resi 23 and name CA, 1CSP and resi 35 and name CA  # target=26.892028791886602 current=27.917267296643917
color yellow, pair_06
distance pair_07, 1CSP and resi 43 and name CA, 1CSP and resi 53 and name CA  # target=23.19764428768308 current=24.193989693184754
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
