# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.733170763910261

load 1CSP.pdb, 1CSP
bg_color white
hide everything, 1CSP
show cartoon, 1CSP
color grey80, 1CSP
set cartoon_transparency, 0.1

select worst_residues, 1CSP and resi 1+2+22+23+36+45+52+53+54+55
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1CSP and resi 2+1044
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1CSP and resi 2 and name CA, 1CSP and resi 47 and name CA  # target=27.150797693642794 current=6.8788482206157795
color yellow, pair_00
distance pair_01, 1CSP and resi 2 and name CA, 1CSP and resi 48 and name CA  # target=26.001359563621655 current=6.043755367161883
color yellow, pair_01
distance pair_02, 1CSP and resi 2 and name CA, 1CSP and resi 49 and name CA  # target=25.649102925390068 current=7.3678056059139445
color yellow, pair_02
distance pair_03, 1CSP and resi 2 and name CA, 1CSP and resi 46 and name CA  # target=27.239080827842194 current=9.012024030076986
color yellow, pair_03
distance pair_04, 1CSP and resi 2 and name CA, 1CSP and resi 63 and name CA  # target=24.93473844307749 current=7.146266092737193
color yellow, pair_04
distance pair_05, 1CSP and resi 1 and name CA, 1CSP and resi 47 and name CA  # target=24.514879609110523 current=7.484701491186595
color yellow, pair_05
distance pair_06, 1CSP and resi 2 and name CA, 1CSP and resi 64 and name CA  # target=26.83716806372117 current=10.346447754352099
color yellow, pair_06
distance pair_07, 1CSP and resi 2 and name CA, 1CSP and resi 65 and name CA  # target=27.417673771543832 current=10.972636503375947
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
