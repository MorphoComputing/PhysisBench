# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.2728886791143803

load 1NB1.pdb, 1NB1
bg_color white
hide everything, 1NB1
show cartoon, 1NB1
color grey80, 1NB1
set cartoon_transparency, 0.1

select worst_residues, 1NB1 and resi 3+4+5+6+8+22+24+25+26+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1NB1 and resi 1 and name CA, 1NB1 and resi 27 and name CA  # target=15.220001515018621 current=8.929074991908283
color yellow, pair_00
distance pair_01, 1NB1 and resi 2 and name CA, 1NB1 and resi 27 and name CA  # target=16.73863130491185 current=11.238315489587048
color yellow, pair_01
distance pair_02, 1NB1 and resi 11 and name CA, 1NB1 and resi 27 and name CA  # target=17.666024050912 current=14.535123584839727
color yellow, pair_02
distance pair_03, 1NB1 and resi 3 and name CA, 1NB1 and resi 27 and name CA  # target=17.125978759005328 current=14.418022073324494
color yellow, pair_03
distance pair_04, 1NB1 and resi 10 and name CA, 1NB1 and resi 27 and name CA  # target=19.618089596798313 current=17.24275918403807
color yellow, pair_04
distance pair_05, 1NB1 and resi 12 and name CA, 1NB1 and resi 27 and name CA  # target=17.511183358882835 current=15.547721893701787
color yellow, pair_05
distance pair_06, 1NB1 and resi 2 and name CA, 1NB1 and resi 26 and name CA  # target=15.15595932907123 current=13.291177520440115
color yellow, pair_06
distance pair_07, 1NB1 and resi 9 and name CA, 1NB1 and resi 27 and name CA  # target=17.121403255915983 current=15.324390831618317
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
